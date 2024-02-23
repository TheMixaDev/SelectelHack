package database

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v5"
)

var database *pgx.Conn

func GetDB() *pgx.Conn {
	return database
}

type PostgresConfig struct {
	Host        string
	User        string
	Password    string
	DbName      string
	Port        string
	SSLMode     string
	SSLRootCert string
	SSLCert     string
	SSLKey      string
}

// PostgresInit initializes the Postgres database connection.
//
// Parameters:
// - cfg: the configuration for the Postgres connection.
//
// Returns:
// - error: an error if the initialization fails.
func PostgresInit(cfg *PostgresConfig) error {
	if database != nil {
		return fmt.Errorf("database already initialized")
	}

	var err error

	connConfig := fmt.Sprintf("postgresql://%s:%s@%s:%s/%s?sslmode=%s&sslrootcert=%s&sslcert=%s&sslkey=%s",
		cfg.User, cfg.Password, cfg.Host, cfg.Port, cfg.DbName, cfg.SSLMode, cfg.SSLRootCert, cfg.SSLCert, cfg.SSLKey)

	database, err = pgx.Connect(context.Background(), connConfig)
	if err != nil {
		return err
	}

	return nil
}

func CreateSchema(schema string) error {
	_, err := database.Exec(context.Background(), schema)
	return err
}
