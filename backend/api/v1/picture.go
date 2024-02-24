package v1

import "github.com/gofiber/fiber/v2"

type requestBody struct {
	Bytes string `json:"bytes"`
}

func picturePostHandler(c *fiber.Ctx) error {
	// Implement logic for POST /picture
	var reqBody requestBody
	if err := c.BodyParser(&reqBody); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"error": err.Error(),
		})
	}

	return c.Status(200).JSON(&fiber.Map{
		"message": "OK",
		"id": 5675678567,
	})
}
