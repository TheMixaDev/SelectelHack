package v1

import (
	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"

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

func authPostConfirmEmailHandler(c *fiber.Ctx) error {
	return c.SendStatus(fiber.StatusNotImplemented)
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
	return c.SendStatus(fiber.StatusNotImplemented)
}

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
	return c.SendStatus(fiber.StatusNotImplemented)
}

// Implement logic for POST /auth/registration
func authPostRegistrationHandler(c *fiber.Ctx) error {
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
