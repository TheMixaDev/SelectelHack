package api

import (
	"github.com/gofiber/fiber/v2"
	"go.uber.org/zap"

	v1 "github.com/kxrxh/selectel_hack/api/v1"
)

type Api struct {
	appAddress string
	appPort    string
	app        *fiber.App
}

// CreateApi creates a new API instance with the given address and port
func CreateApi(address, port string) *Api {
	if port == "" {
		zap.L().Sugar().Panic("app port is not provided")
	}

	app := fiber.New()

	return &Api{appAddress: address, appPort: port, app: app}
}

// ConfigureApp sets up the routes for the API
func (api *Api) ConfigureApp() *Api {
	apiGroup := api.app.Group("/api")
	apiGroup.Get("/", func(c *fiber.Ctx) error {
		zap.L().Sugar().Debugln("GET /api")
		return c.JSON(fiber.Map{
			"message": "Selectel Hack API",
		})
	})
	v1.SetupRoutesV1(&apiGroup)
	return api
}

// Run starts the API server on the given address and port
func (api *Api) Run() {
	zap.L().Sugar().Debugln("Listening on " + api.appAddress + ":" + api.appPort)
	api.app.Listen(api.appAddress + ":" + api.appPort)
}
