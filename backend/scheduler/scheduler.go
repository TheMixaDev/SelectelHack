package scheduler

import (
	"go.uber.org/zap"

	"github.com/invalidteam/selectel_hack/database"
	"github.com/invalidteam/selectel_hack/utils"
)

func handleReportScheduleTask(payload NotificationTaskPayload) error {
	zap.S().Infoln(payload.ChatID, payload.PlanId)

	err := database.DeleteDonationPlan(payload.PlanId)
	if err != nil {
		zap.S().Warnln("Unable to delete donation plan", zap.Error(err))
		return err
	}
	err = utils.SendMessage(int64(payload.ChatID), payload.Message)
	if err != nil {
		zap.S().Warnln("Unable to send message", zap.Error(err))
		return err
	}
	return nil
}
