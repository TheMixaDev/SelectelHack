package v1

import (
	"io"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"
)

func citiesGetHandler(c *fiber.Ctx) error {
	// Implement logic for GET /cities
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/cities/")
	url := "https://hackaton.donorsearch.org/api/cities/"
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

func citiesGetWithIdHandler(c *fiber.Ctx) error {
	// Implement logic for GET /cities/:id
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/cities/", zap.Any("id", c.Params("id")))
	url := "https://hackaton.donorsearch.org/api/cities/" + c.Params("id")
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

func citiesGetByLocationHandler(c *fiber.Ctx) error {
	// Implement logic for GET /cities/by_location
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/cities/by_location/")
	url := "https://hackaton.donorsearch.org/api/cities/by_location/"
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
