package v1

import (
	"strconv"

	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"

	"github.com/invalidteam/selectel_hack/database"
)

func bonusesGetHandler(c *fiber.Ctx) error {
	// Implement logic for GET /bonuses
	return c.SendStatus(fiber.StatusNotImplemented)
}

func bonusesGetWithIdHandler(c *fiber.Ctx) error {
	id := c.Params("id", "-1")
	if id == "-1" {
		return c.Status(400).JSON(&fiber.Map{
			"message": "Bad request. Please provide correct id.",
		})
	}

	// get bonuses by id
	// Implement logic for GET /bonuses/:id
	return c.SendStatus(fiber.StatusNotImplemented)
}

type feedbackRequestBody struct {
	Rating  int    `json:"rating"`
	Comment string `json:"comment"`
}

func bonusesPostFeedbackHandler(c *fiber.Ctx) error {
	id := c.Params("id", "-1")
	if id == "-1" {
		return c.Status(400).JSON(&fiber.Map{
			"message": "Bad request. Please provide correct id.",
		})
	}

	intId, _ := strconv.Atoi(id)

	var body feedbackRequestBody
	if err := c.BodyParser(&body); err != nil {
		zap.S().Debugln(err)
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": err.Error(),
		})
	}

	if body.Rating < 1 || body.Rating > 5 {
		zap.S().Debug("Invalid rating!")
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": "Invalid rating! Valid values are 1-5",
		})
	}

	err := database.AddFeedback(intId, body.Rating, body.Comment)
	if err != nil {
		zap.S().Debug(err)
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"message": "Unable to add feedback",
		})
	}

	return c.SendStatus(fiber.StatusNotImplemented)
}

func bonusesGetFeedbackWithIdHandler(c *fiber.Ctx) error {
	// Implement logic for GET /bonuses/:id
	return c.SendStatus(fiber.StatusNotImplemented)
}

func bonusesPatchFeedbackHandler(c *fiber.Ctx) error {
	id := c.Params("id", "-1")
	if id == "-1" {
		return c.Status(400).JSON(&fiber.Map{
			"message": "Bad request. Please provide correct id.",
		})
	}

	intId, _ := strconv.Atoi(id)

	var body feedbackRequestBody
	if err := c.BodyParser(&body); err != nil {
		zap.S().Debugln(err)
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": err.Error(),
		})
	}

	if body.Rating < 1 || body.Rating > 5 {
		zap.S().Debug("Invalid rating!")
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": "Invalid rating! Valid values are 1-5",
		})
	}

	err := database.AddFeedback(intId, body.Rating, body.Comment)
	if err != nil {
		zap.S().Debug(err)
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"message": "Unable to add feedback",
		})
	}

	return c.SendStatus(fiber.StatusNotImplemented)
}
