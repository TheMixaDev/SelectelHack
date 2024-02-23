package auth

import (
	"time"

	jwtware "github.com/gofiber/contrib/jwt"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"go.uber.org/zap"
)

type AuthRequest struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func SetupAuth(api *fiber.Router) {
	if err := GenerateOrLoadRsaKeyPair(); err != nil {
		zap.L().Sugar().Panicf("Failed to generate or load RSA key pair: %v", err)
	}
	// Login route
	(*api).Post("/login", loginRouter)
	// Registration route
	(*api).Post("/registration", registrationRouter)

	// JWT Middleware
	(*api).Use(jwtware.New(jwtware.Config{
		SigningKey: jwtware.SigningKey{
			JWTAlg: jwtware.RS256,
			Key:    keys.publicKey,
		},
	}))
	zap.L().Sugar().Debugln("JWT auth enabled successfully!")
}

func loginRouter(c *fiber.Ctx) error {
	var form AuthRequest

	if err := c.BodyParser(&form); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": "Invalid request. Please provide valid username and password.",
		})
	}

	// todo: Check database for userdata

	// Create a JWT token with the user ID and expiration time
	claims := jwt.MapClaims{
		"user_id": 0, // set user id from database
		"exp":     time.Now().Add(time.Hour * 24 * 30).Unix(),
	}
	unsignedToken := jwt.NewWithClaims(jwt.SigningMethodRS256, claims)

	// Sign the token using the private key
	token, err := unsignedToken.SignedString(keys.privateKey)
	if err != nil {
		zap.L().Sugar().Debugf("Error while signing token: %v", err)
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"message": "Unable to sign new token!",
		})
	}

	return c.Status(fiber.StatusOK).JSON(&fiber.Map{
		"token": token,
	})
}

func registrationRouter(c *fiber.Ctx) error {
	var form AuthRequest

	if err := c.BodyParser(&form); err != nil {
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": "Invalid request. Please provide valid username and password.",
		})
	}

	// todo: Add user to database

	return c.Status(200).JSON(&fiber.Map{
		"message": "User registered successfully!",
	})
}
