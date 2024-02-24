package v1

import (
	"bytes"
	"fmt"
	"io"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"github.com/spf13/viper"
	"go.uber.org/zap"
)

type requestBody struct {
	Bytes string `json:"bytes"`
}

func picturePostHandler(c *fiber.Ctx) error {
	var reqBody requestBody
	if err := c.BodyParser(&reqBody); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"error": err.Error(),
		})
	}

	return c.Status(200).JSON(&fiber.Map{
		"message": "OK",
		"id":      5675678567,
	})
}

func pictureGetHandler(c *fiber.Ctx) error {
	img := c.Query("id", "0")
	img_url := fmt.Sprint("https://api.telegram.org/file/%s:%s/", viper.GetString("bot.bot_id"), viper.GetString("bot.api_key")) + img
	fmt.Printf("Redirecting to %s", img_url)

	client := &http.Client{}

	req, err := http.NewRequest(c.Method(), img_url, bytes.NewReader(c.Request().Body()))
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to create request")
	}

	resp, err := client.Do(req)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to send request")
	}
	defer resp.Body.Close()

	zap.S().Debugln("Response status code:", resp.StatusCode)
	// zap.S().Debugln("Response headers:", resp.Header)

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to read response body")
	}

	return c.Status(resp.StatusCode).Send(body)
}
