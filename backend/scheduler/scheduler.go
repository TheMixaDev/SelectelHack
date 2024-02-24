package scheduler

import (
	"github.com/invalidteam/selectel_hack/database"
	"github.com/invalidteam/selectel_hack/utils"
)

func handleReportScheduleTask(payload NotificationTaskPayload) error {
	err := database.DeleteDonationPlan(payload.PlanId)
	if err != nil {
		return err
	}
	err = utils.SendMessage(int64(payload.ChatID), payload.Message)
	if err != nil {
		return err
	}
	return nil
}
