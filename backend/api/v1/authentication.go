package v1

import (
	"github.com/gofiber/fiber/v2"
	"github.com/invalidteam/selectel_hack/api/auth"
	"github.com/invalidteam/selectel_hack/database"
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

func authPostConfirmPhoneHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authGetDonorCardHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostDonorCardHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authGetMeHandler(c *fiber.Ctx) error {
	id := auth.ExtractUserID(c)
	user, err := database.GetUserById(id)
	if err != nil {
		return c.SendStatus(fiber.StatusInternalServerError)
	}
	return c.Status(fiber.StatusOK).JSON(&fiber.Map{
		"message": "Profile fetched successfully",
		"data":    user,
	})

}

func authPostMeHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostCheckSmsCodeHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/check_sms_code
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostConfirmEmailRegHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/confirm_email_reg
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostConfirmPhoneRegHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/confirm_phone_reg
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostLoginHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/login
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostLogoutHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/login
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostRecoverHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/recover
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostRegistrationHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/registration
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostResendCodeHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/resend_code
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostResendEmailCodeHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/resend_email_code
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostSetPasswordHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/set_password
	return c.SendStatus(fiber.StatusNotImplemented)
}

func authPostSetTwoFactorAuthHandler(c *fiber.Ctx) error {
	// Implement logic for POST /auth/set_two_factor_auth
	return c.SendStatus(fiber.StatusNotImplemented)
}
