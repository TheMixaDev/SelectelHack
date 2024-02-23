package auth

import (
	"time"

	jwtware "github.com/gofiber/contrib/jwt"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"github.com/invalidteam/selectel_hack/database"
	"go.uber.org/zap"
)

type AuthRequest struct {
	FirstName    string `json:"firstName"`
	Email        string `json:"email"`
	HashPassword string `json:"hash_password"`
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
	id, err := database.GetUserIdByEmail(form.Email)
	if err != nil {
		return c.Status(fiber.StatusUnauthorized).JSON(&fiber.Map{
			"message": "Invalid username or password!",
		})
	}

	// Create a JWT token with the user ID and expiration time
	claims := jwt.MapClaims{
		"user_id": id, // set user id from database
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
	user := database.NewUser(form.Email, form.HashPassword, form.FirstName)

	err := database.AddUser(user)
	if err != nil {
		zap.L().Sugar().Debugf("Error while adding user to database: %v", err)
	}

	return c.Status(200).JSON(&fiber.Map{
		"message": "User registered successfully!",
	})
}
