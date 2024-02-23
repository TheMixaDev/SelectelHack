package main

import (
	"github.com/spf13/viper"
	"go.uber.org/zap"

	"github.com/kxrxh/selectel_hack/api"
)

func main() {
	if err := viperSetup(); err != nil {
		zap.L().Sugar().Panic(err)
	}
	
	// Setting up logger
	if viper.GetBool("dev") {
		zap.ReplaceGlobals(zap.Must(zap.NewDevelopment()))
	} else {
		zap.ReplaceGlobals(zap.Must(zap.NewProduction()))
	}
	defer zap.L().Sync()

	api.CreateApi(viper.GetString("app.address"), viper.GetString("app.port")).ConfigureApp().Run()
}

func viperSetup() error {
	viper.SetConfigFile("app.json")
	viper.AddConfigPath(".")
	viper.SetDefault("app.port", "3033")
	viper.SetDefault("app.address", "")
	viper.SetDefault("dev", true)

	return viper.ReadInConfig()
}
