package scheduler

import (
	"github.com/invalidteam/selectel_hack/utils"
)

func handleReportScheduleTask(payload NotificationTaskPayload) error {
	return utils.SendMessage(int64(payload.ChatID), "👋Привет! Спешу напомнить, что на сегодняшнюю дату у вас запланирована донация!")
}
