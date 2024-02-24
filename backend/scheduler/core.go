package scheduler

import (
	"context"
	"encoding/json"
	"fmt"
	"sync"
	"time"

	"github.com/redis/go-redis/v9"
	"go.uber.org/zap"
)

var (
	once        sync.Once
	redisClient *redis.Client
	redisConfig *RedisConfig
)

func UploadConfig(config *RedisConfig) {
	redisConfig = config
	redisClient = getRedisClient()
}

// ScheduleTask schedules a task and returns the task name or an error.
//
// It takes a pointer to a Task struct as a parameter.
// It returns a string representing the task name and an error object.
func scheduleTask(task *Task) (string, error) {
	if task.Name == "" {
		task.Name = generateTaskName()
		if _, err := redisClient.SAdd(context.Background(), "tasks", task.Name).Result(); err != nil {
			zap.S().Errorf("Unable to schedule new task", task.Name)
			return "", err
		}
	}

	payload, err := json.Marshal(task)
	if err != nil {
		return "", err
	}

	if _, err = redisClient.Set(context.Background(), task.Name, payload, 0).Result(); err != nil {
		zap.S().Errorf("Unable to set payload for task", task.Name)
		return "", err
	}

	return task.Name, nil
}

// ProcessDueTasks processes the due tasks.
//
// It retrieves the list of due tasks from Redis and iterates over each task.
// For each task, it retrieves the task payload from Redis, decodes it into the
// corresponding struct, and performs the appropriate action based on the task type.
// If the task is of type ReportSchedule, it decodes the payload into a ReportTaskPayload
// struct and calls the handleReportScheduleTask function. If the task is of type Email,
// it decodes the payload into an EmailTaskPayload struct and calls the handleEmailTask
// function.
//
// If the task is repeating, it updates the task's BeginTime and NextExecution fields
// based on the current time and the task's interval. It then schedules the task again
// using the ScheduleTask function. If there is an error during rescheduling, it logs
// the error. If the task is not repeating, it cancels the task using the CancelTaskByName
// function.
//
// There are no parameters.
// There is no return value.
func processDueTasks() {
	// Retrieve the list of due tasks
	listOfTasks, err := redisClient.SMembers(context.Background(), "tasks").Result()
	if err != nil {
		zap.S().Errorf("Error retrieving due tasks: %v\n", err)
		return
	}

	for _, taskID := range listOfTasks {
		var task Task
		taskData, err := redisClient.Get(context.Background(), taskID).Result()
		if err != nil {
			zap.S().Errorf("Error retrieving task payload: %v\n", err)
			continue
		}

		if err := json.Unmarshal([]byte(taskData), &task); err != nil {
			zap.S().Errorf("Error decoding task payload: %v\n", err)
			continue
		}

		// Check if the task is due
		if task.NextExecution.After(time.Now().Local()) {
			continue
		}

		switch task.Type {

		case NotificationSchedule:
			var payload NotificationTaskPayload
			if err := mapToStruct(task.Payload.(map[string]any), &payload); err != nil {
				zap.S().Errorf("Error decoding report schedule task payload: %v\n", err)
				continue
			}
			err = handleReportScheduleTask(payload)
			if err != nil {
				continue
			}

		}
		CancelTaskByName(task.Name)
	}
}

// RunScheduler runs the scheduler in a goroutine.
//
// It processes due tasks and sleeps for the specified poll interval.
func RunScheduler() {
	go func() {
		ticker := time.NewTicker(time.Duration(redisConfig.PollInterval) * time.Hour)
		defer ticker.Stop()

		for range ticker.C {
			// Process due tasks
			processDueTasks()
		}
	}()
}

// CancelTaskByName cancels a task by its name.
//
// taskName: the name of the task to be canceled.
// error: returns an error if there was any issue canceling the task.
func CancelTaskByName(taskName string) error {
	err := redisClient.Watch(context.Background(), func(tx *redis.Tx) error {
		_, err := tx.SRem(context.Background(), "tasks", taskName).Result()
		if err != nil {
			zap.S().Debugf("Error deleting task %s: %v\n", taskName, err)
			return err
		}

		_, err = tx.Del(context.Background(), taskName).Result()
		if err != nil {
			zap.S().Errorf("Error deleting task %s: %v\n", taskName, err)
			return err
		}

		return nil
	}, "tasks")

	if err == redis.TxFailedErr {
		return fmt.Errorf("task not found: %s", taskName)
	} else if err != nil {
		return err
	}

	return nil
}

// AddTask adds a task to the schedule.
//
// It takes the following parameters:
// - payload: the payload of the task.
// - taskType: the type of the task.
// - repeating: a boolean indicating whether the task should repeat.
// - interval: the interval at which the task should repeat, in milliseconds.
//
// It returns a string and an error.
func AddTask(payload any, taskType TaskType, repeating bool, end time.Time) (string, error) {
	task := Task{
		BeginTime:     time.Now().Local(),
		Payload:       payload,
		Type:          taskType,
		Repeating:     false,
		Interval:      0,
		NextExecution: end,
	}

	return scheduleTask(&task)
}
