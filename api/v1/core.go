package v1

import (
	"github.com/gofiber/fiber/v2"

	"github.com/kxrxh/selectel_hack/api/auth"
)

func SetupRoutesV1(root *fiber.Router) {
	v1 := (*root).Group("/v1")

	auth.SetupAuth(&v1)
}
