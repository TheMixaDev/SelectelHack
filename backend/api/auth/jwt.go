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
	Phone        string `json:"phone"`
	HashPassword string `json:"hash_password"`
}

func SetupAuth(api *fiber.Router) {
	if err := GenerateOrLoadRsaKeyPair(); err != nil {
		zap.S().Panicf("Failed to generate or load RSA key pair: %v", err)
	}
	// Login route
	(*api).Post("/login", loginRouter)
	// Registration route
	// TODO: Prohibit registration if phone/email is the db
	(*api).Post("/registration", registrationRouter)

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
		id, err = database.GetUserIdByEmail(form.Email)
		if err != nil {
			zap.S().Debug("Invalid Email or password!", zap.String("email", form.Email))
			return c.Status(fiber.StatusUnauthorized).JSON(&fiber.Map{
				"message": "Invalid Email or password!",
			})
		}
	} else {
		id, err = database.GetUserIdByPhone(form.Phone)
		if err != nil {
			zap.S().Debug("Invalid Phone or password!", zap.String("phone", form.Phone))
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

	// todo: Add user to database
	user := database.NewUser(form.Email, form.HashPassword, form.FirstName)

	err := database.AddUser(user)
	if err != nil {
		zap.S().Debugf("Error while adding user to database: %v", err)
		return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
			"message": "Unable to register new user!",
		})
	}

	zap.S().Debugln("User registered successfully!", zap.Any("user", user.Id))
	return c.Status(200).JSON(&fiber.Map{
		"message": "User registered successfully!",
		"user_id": user.Id,
	})
}
