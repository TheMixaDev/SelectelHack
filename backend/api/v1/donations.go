package v1

import (
	"strconv"

	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"

	"github.com/invalidteam/selectel_hack/api/auth"
	"github.com/invalidteam/selectel_hack/database"
)

func donationsGetHandler(c *fiber.Ctx) error {
	donations, err := database.GetDonations(auth.ExtractUserID(c))
	if err != nil {
		zap.S().Debugln("Error getting donation information", zap.Error(err))
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"message": "Error getting donation information",
		})
	}

	return c.Status(fiber.StatusOK).JSON(donations)
}

func donationsPostHandler(c *fiber.Ctx) error {
	var data database.Donation

	if err := c.BodyParser(&data); err != nil {
		zap.S().Debugln("Error parsing body")
		zap.S().Debugln(err)
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": err.Error(),
		})
	}

	id, err := database.AddDonation(auth.ExtractUserID(c), data)
	if err != nil {
		zap.S().Debugln("Error adding donation")
		return c.SendStatus(fiber.StatusInternalServerError)
	}

	zap.S().Debugln("Donation added successfully", zap.Any("id", id))
	return c.Status(fiber.StatusOK).JSON(&fiber.Map{
		"id": id,
	})
}

func donationsGetWithIdHandler(c *fiber.Ctx) error {
	id := c.Params("id", "-1")
	if id == "-1" {
		return c.Status(400).JSON(&fiber.Map{
			"message": "Bad request. Please provide correct id.",
		})
	}

	zap.S().Debugln("id", id)
	intId, _ := strconv.Atoi(id)
	donation, err := database.GetDonationById(uint(intId))
	if err != nil {
		zap.S().Debugln("Error getting donation information", zap.Error(err))
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"message": "Error getting donation information",
		})
	}

	return c.Status(fiber.StatusOK).JSON(&fiber.Map{
		"donation": donation,
	})
}

func donationsPutWithIdHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func donationsPatchWithIdHandler(c *fiber.Ctx) error {
	var data database.Donation

	if err := c.BodyParser(&data); err != nil {
		zap.S().Debugln("Error parsing body")
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": err.Error(),
		})
	}

	err := database.UpdateDonation(data)
	if err != nil {
		zap.S().Debugln("Error updating donation", zap.Error(err))
		return c.SendStatus(fiber.StatusInternalServerError)
	}

	zap.S().Debugln("Donation updated successfully")
	return c.SendStatus(fiber.StatusOK)
}

func donationsDeleteWithIdHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func donationsGetIsExistsHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}
