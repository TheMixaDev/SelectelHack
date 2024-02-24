package utils

import (
	"bytes"
	"fmt"
	"io"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"
)

func Redirect(c *fiber.Ctx) error {
	url := "https://hackaton.donorsearch.org" + c.OriginalURL()
	zap.S().Debugln(fmt.Sprintf("Redirecting to %s", url))

	client := &http.Client{}

	req, err := http.NewRequest(c.Method(), url, bytes.NewReader(c.Request().Body()))
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to create request")
	}

	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("accept", "application/json")

	resp, err := client.Do(req)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to send request")
	}
	defer resp.Body.Close()

	zap.S().Debugln("Response status code:", resp.StatusCode)
	zap.S().Debugln("Response headers:", resp.Header)

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to read response body")
	}

	return c.Status(resp.StatusCode).Send(body)
}
