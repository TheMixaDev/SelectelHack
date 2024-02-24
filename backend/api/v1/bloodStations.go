package v1

import (
	"io"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"
)

// Implement logic for GET /blood_stations
func bloodStationsGetHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/blood_stations")

	url := "https://hackaton.donorsearch.org/api/blood_stations/"
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

// Implement logic for GET /blood_stations/:id
func bloodStationsGetWithIdHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/blood_stations", zap.Any("id", c.Params("id")))
	url := "https://hackaton.donorsearch.org/api/blood_stations/" + c.Params("id")
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

// Implement logic for GET /blood_stations/:id/planned
func bloodStationsGetPlannedWithIdHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/blood_stations", zap.Any("id", c.Params("id")), "/planned")
	url := "https://hackaton.donorsearch.org/api/blood_stations/" + c.Params("id") + "/planned"
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

// Implement logic for GET /blood_stations/:id/top
func bloodStationsGetTopWithIdHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/blood_stations", zap.Any("id", c.Params("id")), "/top")
	url := "https://hackaton.donorsearch.org/api/blood_stations/" + c.Params("id") + "/top"
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

// Implement logic for GET /blood_stations/:id/top_halfyear
func bloodStationsGetTopHalfYearWithIdHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/blood_stations", zap.Any("id", c.Params("id")), "/top_halfyear")
	url := "https://hackaton.donorsearch.org/api/blood_stations/" + c.Params("id") + "/top_halfyear"
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

// Implement logic for GET /blood_stations/all_names
func bloodStationsGetAllNamesHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/blood_stations/all_names/")
	url := "https://hackaton.donorsearch.org/api/blood_stations/all_names/"
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

// Implement logic for GET /blood_stations/map
func bloodStationsGetMapHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/blood_stations/map/")
	url := "https://hackaton.donorsearch.org/api/blood_stations/map/"
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

// Implement logic for GET /blood_stations/search
func bloodStationsGetSearchHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/blood_stations/search/")
	url := "https://hackaton.donorsearch.org/api/blood_stations/search/"
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

// Implement logic for GET /blood_stations/selected
func bloodStationsGetSelectedHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/blood_stations/selected/")
	url := "https://hackaton.donorsearch.org/api/blood_stations/selected/"
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
