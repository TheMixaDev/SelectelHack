package auth

import (
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
)

// ExtractUserID extracts the user ID from the fiber.Ctx object.
// Parameters:
// - c: A pointer to a fiber.Ctx object.
//
// Return:
// - id: An unsigned integer representing the user ID.
func ExtractUserID(c *fiber.Ctx) uint {
	user := c.Locals("user").(*jwt.Token)
	claims := user.Claims.(jwt.MapClaims)
	id := uint(claims["user_id"].(float64))
	return id
}
