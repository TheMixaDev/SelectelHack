package v1

import (
	"bytes"
	"io"
	"net/http"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/proxy"
	"github.com/invalidteam/selectel_hack/api/auth"
	"github.com/invalidteam/selectel_hack/database"
	"go.uber.org/zap"
)

func authPostChangeEmailHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostChangePasswordHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostChangePhoneHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostConfirmEmailHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/auth/confirm_email")

	url := "https://hackaton.donorsearch.org/api/auth/confirm_email/"
	client := &http.Client{}

	req, err := http.NewRequest("POST", url, c.Request().BodyStream())
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

func authGetDonorCardHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPatchDonorCardHandler(c *fiber.Ctx) error {
	var donorCard database.DonorCard
	if err := c.BodyParser(&donorCard); err != nil {
		return err
	}

	// err := database.UpdateDonorCard(auth.ExtractUserID(c), &donorCard)

	return c.SendStatus(fiber.StatusOK)
}

func authGetMeHandler(c *fiber.Ctx) error {
	id := auth.ExtractUserID(c)
	user, err := database.GetUserById(id)
	if err != nil {
		zap.S().Debugln("Error fetching profile", zap.Any("id", id))
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"message": "Error fetching profile",
		})
	}
	zap.S().Debugln("Profile fetched successfully", zap.Any("id", id))
	return c.Status(fiber.StatusOK).JSON(&fiber.Map{
		"message": "Profile fetched successfully",
		"data":    user,
	})

}

// last_name, first_name, middle_name, city_id, birth_date, blood_group

func authPatchMeHandler(c *fiber.Ctx) error {
	var updatedUser database.UserUpdate
	if err := c.BodyParser(&updatedUser); err != nil {
		return err
	}
	err := database.UpdateUser(auth.ExtractUserID(c), updatedUser)
	if err != nil {
		zap.S().Debugln("Error updating profile", zap.Any("id", auth.ExtractUserID(c)))
		return c.SendStatus(fiber.StatusInternalServerError)
	}
	zap.S().Debugln("Profile updated successfully", zap.Any("id", auth.ExtractUserID(c)))
	return c.SendStatus(fiber.StatusOK)
}

func authPostCheckSmsCodeHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/check_sms_code
	return c.SendStatus(fiber.StatusNotImplemented)
}

// Implement logic for POST /auth/confirm_email_reg
func authPostConfirmEmailRegHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/auth/confirm_email_reg")

	url := "https://hackaton.donorsearch.org/api/auth/confirm_email_reg/"
	client := &http.Client{}

	req, err := http.NewRequest("POST", url, c.Request().BodyStream())
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

// func authPostConfirmPhoneRegHandler(c *fiber.Ctx) error {
// 	// Implement logic for POST /auth/confirm_phone_reg
// 	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/auth/confirm_phone_reg")
// 	return proxy.Do(c, "https://hackaton.donorsearch.org/api/auth/confirm_phone_reg")
// }

func authPostLoginHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/login
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostLogoutHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/logout
	c.ClearCookie()
	return c.SendStatus(fiber.StatusOK)
}

func authPostRecoverHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/recover
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/auth/recover")
	return proxy.Do(c, "https://hackaton.donorsearch.org/api/auth/recover")
}

// Implement logic for POST /auth/registration
func authPostRegistrationHandler(c *fiber.Ctx) error {
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/auth/registration")

	url := "https://hackaton.donorsearch.org/api/auth/registration/"
	client := &http.Client{}

	req, err := http.NewRequest("POST", url, bytes.NewReader(c.Request().Body()))
	if err != nil {
		return c.Status(http.StatusInternalServerError).SendString("Failed to create request")
	}

	req.Header.Set("Content-Type", "application/json")
	req.Header.Set("accept", "application/json")
	req.Header.Set("accept-encoding", "gzip, deflate, br")

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

func authPostResendCodeHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/resend_code
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/auth/resend_code")
	return proxy.Do(c, "https://hackaton.donorsearch.org/api/auth/resend_code")
}

func authPostResendEmailCodeHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/resend_email_code
	zap.S().Debugln("Redirecting to https://hackaton.donorsearch.org/api/auth/resend_email_code")
	return proxy.Do(c, "https://hackaton.donorsearch.org/api/auth/resend_email_code")
}

func authPostSetPasswordHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/set_password
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostSetTwoFactorAuthHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/set_two_factor_auth
	return c.SendStatus(fiber.StatusNotImplemented)
}
