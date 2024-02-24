package v1

import "github.com/gofiber/fiber/v2"

type requestBody struct {
	Bytes []byte `json:"bytes"`
}

func picturePostHandler(c *fiber.Ctx) error {
	// Implement logic for POST /picture
	var reqBody requestBody
	if err := c.BodyParser(&reqBody); err != nil {
		return err
	}
	// TODO: Save bytes to database + return image id
	return c.Status(200).JSON(&fiber.Map{
		"message": "OK",
		"id":      22, // TODO: REPLACE WITH ACTUAL ID
	})
}
