package scheduler

import (
	"encoding/json"
	"fmt"
	"time"

	"github.com/redis/go-redis/v9"
)

// generateTaskName generates a task name based on the current time in milliseconds.
//
// It does not take any parameters.
// It returns a string representing the generated task name.
func generateTaskName() string {
	return fmt.Sprintf("task_%d", time.Now().UnixMilli())
}

// getRedisClient returns the Redis client.
//
// No parameters.
// *redis.Client - the Redis client.
func getRedisClient() *redis.Client {
	once.Do(func() {
		redisClient = redis.NewClient(&redis.Options{
			Addr:     redisConfig.Host,
			Password: "",
			DB:       redisConfig.DbID,
		})
	})

	return redisClient
}

// mapToStruct maps a map to a struct using JSON encoding and decoding.
//
// The function takes a map m which contains string keys and values of any type,
// and a pointer to a struct s. It returns an error if there was an issue with
// marshaling or unmarshaling the map to the struct.
func mapToStruct(m map[string]any, s any) error {
	b, err := json.Marshal(m)
	if err != nil {
		return err
	}
	return json.Unmarshal(b, s)
}
