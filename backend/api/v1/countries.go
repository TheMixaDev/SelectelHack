package v1

import "github.com/gofiber/fiber/v2"

func countriesGetHandler(c *fiber.Ctx) error {
	// Implement logic for GET /countries
	return c.SendStatus(fiber.StatusNotImplemented)
}

func countriesGetWithIdHandler(c *fiber.Ctx) error {
	// Implement logic for GET /countries/:id
	return c.SendStatus(fiber.StatusNotImplemented)
}
