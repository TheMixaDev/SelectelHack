package v1

import "github.com/gofiber/fiber/v2"

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
		"id": 5675678567,
	})
}

func pictureGetHandler(c *fiber.Ctx) error {
	img := c.Params("id", "0")
	img_url := "https://api.telegram.org/file/bot6983241538:AAHNmAHQb2xphCyQzy9YE1AVZiKfttNKkNg/" + img

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
