package auth

import (
	"time"

	jwtware "github.com/gofiber/contrib/jwt"
	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"go.uber.org/zap"

	"github.com/invalidteam/selectel_hack/database"
)

type AuthRequest struct {
	FirstName    string `json:"first_name"`
	Email        string `json:"email"`
	Phone        string `json:"phone"`
	HashPassword string `json:"hash_password"`
}

func SetupAuth(api *fiber.Router) {
	if err := GenerateOrLoadRsaKeyPair(); err != nil {
		zap.S().Panicf("Failed to generate or load RSA key pair: %v", err)
	}
	(*api).Post("/auth/login", loginRouter)
	(*api).Post("/auth/register", registrationRouter)

	// JWT Middleware
	(*api).Use(jwtware.New(jwtware.Config{
		SigningKey: jwtware.SigningKey{
			JWTAlg: jwtware.RS256,
			Key:    keys.publicKey,
		},
	}))
	zap.S().Debugln("JWT auth enabled successfully!")
}

func loginRouter(c *fiber.Ctx) error {
	var form AuthRequest

	if err := c.BodyParser(&form); err != nil {
		zap.S().Debugf("Invalid request: %v", err)
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": "Invalid request. Please provide valid username and password.",
		})
	}

	var (
		id  uint
		err error
	)
	if form.Phone == "" {
		if form.Email == "" {
			zap.S().Debug("No email or phone number provided!")
			return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
				"message": "Please provide either email or phone number!",
			})
		}
		id, err = database.CheckUserAuthByEmail(form.Email, form.HashPassword)
		if err != nil {
			zap.S().Debug("Invalid Email or password!", zap.String("email", form.Email))
			zap.S().Debug(err)
			return c.Status(fiber.StatusUnauthorized).JSON(&fiber.Map{
				"message": "Invalid Email or password!",
			})
		}
	} else {
		id, err = database.CheckUserAuthByPhone(form.Phone, form.HashPassword)
		if err != nil {
			zap.S().Debug("Invalid Phone or password!", zap.String("phone", form.Phone))
			zap.S().Debug(err)
			return c.Status(fiber.StatusUnauthorized).JSON(&fiber.Map{
				"message": "Invalid Phone or password!",
			})
		}
	}

	// Create a JWT token with the user ID and expiration time
	claims := jwt.MapClaims{
		"user_id": id,
		"exp":     time.Now().Add(time.Hour * 24 * 30).Unix(),
	}
	unsignedToken := jwt.NewWithClaims(jwt.SigningMethodRS256, claims)

	// Sign the token using the private key
	token, err := unsignedToken.SignedString(keys.privateKey)
	if err != nil {
		zap.S().Debugf("Error while signing token: %v", err)
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"message": "Unable to sign new token!",
		})
	}

	zap.S().Debugln("User logged in successfully!", zap.Any("id", id))
	return c.Status(fiber.StatusOK).JSON(&fiber.Map{
		"token": token,
	})
}

func registrationRouter(c *fiber.Ctx) error {
	var form AuthRequest

	if err := c.BodyParser(&form); err != nil {
		zap.S().Debugf("Invalid request: %v", err)
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": "Invalid request. Please provide valid username and password.",
		})
	}

	// Validating password
	if len(form.HashPassword) < 8 {
		zap.S().Debug("Password too short!")
		return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
			"message": "Password too short!",
		})
	}
	// Choosing registration method
	var (
		id  uint
		err error
	)
	if form.Email != "" {
		id, err = database.CreateUserByEmail(form.Email, form.HashPassword, form.FirstName)
		if err != nil {
			zap.S().Debug("Unable to create user with such email!", zap.String("email", form.Email), zap.Any("err", err))
			return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
				"message": "Unable to create user with such email!",
			})
		}
	} else if form.Phone != "" {
		id, err = database.CreateUserByPhone(form.Phone, form.HashPassword, form.FirstName)
		if err != nil {
			zap.S().Debug("Unable to create user with such phone!", zap.String("phone", form.Phone), zap.Any("err", err))
			return c.Status(fiber.StatusBadRequest).JSON(&fiber.Map{
				"message": "Unable to create user with such phone!",
			})
		}
	}

	zap.S().Debugln("User registered successfully!", zap.Any("user", id))
	return c.Status(200).JSON(&fiber.Map{
		"message": "User registered successfully!",
		"user_id": id,
	})
}
