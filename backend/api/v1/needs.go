package v1

import (
	"io"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"
)

func needsGetHandler(c *fiber.Ctx) error {
	// Implement logic for GET /needs
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/needs")
	url := "https://hackaton.donorsearch.org/api/needs"
	client := &http.Client{}

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to create request")
	}

	resp, err := client.Do(req)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to send request")
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to read response body")
	}

	return c.Status(resp.StatusCode).Send(body)
}

func needsGetWithIdHandler(c *fiber.Ctx) error {
	// Implement logic for GET /needs/:id
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/needs", zap.Any("id", c.Params("id")))
	url := "https://hackaton.donorsearch.org/api/needs/" + c.Params("id")
	client := &http.Client{}

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to create request")
	}

	resp, err := client.Do(req)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to send request")
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to read response body")
	}

	return c.Status(resp.StatusCode).Send(body)
}

func needsGetAvailableHandler(c *fiber.Ctx) error {
	// Implement logic for GET /needs/available
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/needs/available")
	url := "https://hackaton.donorsearch.org/api/needs/available"
	client := &http.Client{}

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to create request")
	}

	resp, err := client.Do(req)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to send request")
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to read response body")
	}

	return c.Status(resp.StatusCode).Send(body)
}
