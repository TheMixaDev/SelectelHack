package auth

import (
	"encoding/json"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v5"
	"go.uber.org/zap"

	"github.com/invalidteam/selectel_hack/database"
	"github.com/invalidteam/selectel_hack/utils"
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
	// (*api).Use(jwtware.New(jwtware.Config{
	// 	SigningKey: jwtware.SigningKey{
	// 		JWTAlg: jwtware.RS256,
	// 		Key:    keys.publicKey,
	// 	},
	// }))
	zap.S().Debugln("JWT auth enabled successfully!")
}

func loginRouter(c *fiber.Ctx) error {
	utils.Redirect(c)

	if c.Response().StatusCode() == 200 {
		var user database.User

		json.Unmarshal(c.Response().Body(), &user)

		_, err := database.GetUserById(user.Id)
		if err != nil {
			zap.S().Errorf("Failed to get user: %v", err)
			err := database.AddUser(&user)
			if err != nil {
				zap.S().Errorf("Failed to add user: %v", err)
				return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
					"message": "Failed to add user",
				})
			}
		}
		claims := jwt.MapClaims{
			"user_id": user.Id,
			"exp":     time.Now().Add(time.Hour * 24 * 30).Unix(),
		}
		unsignedToken := jwt.NewWithClaims(jwt.SigningMethodRS256, claims)

		// Sign the token using the private key
		token, err := unsignedToken.SignedString(Keys.PrivateKey)
		if err != nil {
			zap.S().Debugf("Error while signing token: %v", err)
			return c.Status(fiber.StatusInternalServerError).JSON(&fiber.Map{
				"message": "Unable to sign new token!",
			})
		}

		c.Response().Header.Add("Access-Control-Expose-Headers", "*")
		c.Response().Header.Add("token", token)

		return c.SendStatus(fiber.StatusOK)
	}

	return c.SendStatus(c.Response().StatusCode())
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
