package v1

import (
	jwtware "github.com/gofiber/contrib/jwt"
	"github.com/gofiber/fiber/v2"

	"github.com/invalidteam/selectel_hack/api/auth"
	"github.com/invalidteam/selectel_hack/utils"
)

func SetupRoutesV1(v1 *fiber.Router) {

	authentication := (*v1).Group("/get").Use(jwtware.New(jwtware.Config{
		SigningKey: jwtware.SigningKey{
			JWTAlg: jwtware.RS256,
			Key:    auth.Keys.PublicKey,
		},
	}))
	// account data managent
	authentication.Get("/me", authGetMeHandler)
	authentication.Patch("/me", authPatchMeHandler)
	// authentication
	authentication.Post("/login", authPostLoginHandler)

	// donation plan management
	donationPlan := (*v1).Group("/donation_plan").Use(jwtware.New(jwtware.Config{
		SigningKey: jwtware.SigningKey{
			JWTAlg: jwtware.RS256,
			Key:    auth.Keys.PublicKey,
		},
	}))
	donationPlan.Get("/", donationPlanGetHandler)
	donationPlan.Post("/", donationPlanPostHandler)
	donationPlan.Get("/:id", donationPlanGetWithIdHandler)
	donationPlan.Put("/:id", donationPlanPutWithIdHandler)
	donationPlan.Patch("/:id", donationPlanPatchWithIdHandler)
	donationPlan.Delete("/:id", donationPlanDeleteWithIdHandler)
	donationPlan.Get("/latest", donationPlanGetLatestHandler)

	// Donation management
	donations := (*v1).Group("/donations").Use(jwtware.New(jwtware.Config{
		SigningKey: jwtware.SigningKey{
			JWTAlg: jwtware.RS256,
			Key:    auth.Keys.PublicKey,
		},
	}))
	donations.Get("/", donationsGetHandler)
	donations.Post("/", donationsPostHandler)
	donations.Get("/:id", donationsGetWithIdHandler)
	donations.Put("/:id", donationsPutWithIdHandler)
	donations.Patch("/", donationsPatchWithIdHandler)
	donations.Delete("/:id", donationsDeleteWithIdHandler)
	donations.Get("/is-exists", donationsGetIsExistsHandler)

	// picture
	picture := (*v1).Group("/picture")
	picture.Post("/", picturePostHandler)
	picture.Get("/", pictureGetHandler)

	(*v1).Use(utils.Redirect)
}
