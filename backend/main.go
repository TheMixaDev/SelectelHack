package main

import (
	"os"

	"github.com/spf13/viper"
	"go.uber.org/zap"

	"github.com/invalidteam/selectel_hack/api"
	"github.com/invalidteam/selectel_hack/database"
)

func main() {
	if err := viperSetup(); err != nil {
		zap.S().Panic(err)
	}

	// Setting up logger
	if viper.GetBool("dev") {
		zap.ReplaceGlobals(zap.Must(zap.NewDevelopment()))
	} else {
		zap.ReplaceGlobals(zap.Must(zap.NewProduction()))
	}
	defer zap.L().Sync()

	config := database.PostgresConfig{
		Host:        viper.GetString("db.host"),
		Port:        viper.GetString("db.port"),
		User:        viper.GetString("db.user"),
		Password:    viper.GetString("db.password"),
		DbName:      viper.GetString("db.dbname"),
		SSLMode:     viper.GetString("db.sslmode"),
		SSLRootCert: viper.GetString("db.sslrootcert"),
		SSLKey:      viper.GetString("db.sslkey"),
		SSLCert:     viper.GetString("db.sslcert"),
	}
	err := database.PostgresInit(&config)
	if err != nil {
		zap.S().Panic(err)
	}

	file, err := os.ReadFile(viper.GetString("db.schema"))
	if err != nil {
		zap.S().Panic(err)
	}

	err = database.CreateSchema(string(file))
	if err != nil {
		zap.S().Panic(err)
	}
	zap.L().Info("Schema created")

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
