package v1

import (
	"strconv"

	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"

	"github.com/invalidteam/selectel_hack/api/auth"
	"github.com/invalidteam/selectel_hack/database"
	"github.com/invalidteam/selectel_hack/scheduler"
)

func donationPlanGetHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func donationPlanPostHandler(c *fiber.Ctx) error {
	var data database.DonationPlan

	if err := c.BodyParser(&data); err != nil {
		zap.S().Debugln("Error parsing body")
		zap.S().Debugln(err)
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": err.Error(),
		})
	}

	id, err := database.AddDonationPlan(auth.ExtractUserID(c), data)
	if err != nil {
		zap.S().Debugln("Error adding donation plan")
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"message": "Error adding donation plan",
			"error":   err.Error(),
		})
	}
	
	chatId, _ := strconv.Atoi(c.Get("TelegramId"))
	payload := scheduler.NotificationTaskPayload{
		ChatID:  uint(chatId),
		Message: "👋Привет! Спешу напомнить, что на сегодняшнюю дату у вас запланирована донация!",
		PlanId:  id,
	}
	scheduler.AddTask(payload, scheduler.NotificationSchedule, false, 15000) // 15 seconds
	zap.S().Debugln("Donation plan added successfully", zap.Any("id", id))
	return c.Status(fiber.StatusOK).JSON(&fiber.Map{
		"id": id,
	})
}

func donationPlanGetWithIdHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func donationPlanPutWithIdHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func donationPlanPatchWithIdHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func donationPlanDeleteWithIdHandler(c *fiber.Ctx) error {
	id := c.Params("id", "")
	if id == "" {
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": "Bad request. Please provide correct id.",
		})
	}

	intId, err := strconv.Atoi(id)
	if err != nil {
		zap.S().Debugln("Error converting id to int", zap.Error(err))
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": "Bad request. Please provide correct id.",
		})
	}

	err = database.DeleteDonationPlan(uint(intId))
	if err != nil {
		zap.S().Debugln("Error deleting donation plan")
		return c.SendStatus(fiber.StatusInternalServerError)
	}

	// todo: delete scheduler

	return c.SendStatus(fiber.StatusOK)
}

func donationPlanGetLatestHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}
