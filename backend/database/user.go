package database

import (
	"context"
	"fmt"
	"strconv"
	"time"

	"github.com/invalidteam/selectel_hack/utils"
)

// CreateUserByEmail creates a new user in the database using the given email, password, and first name.
// It returns the user ID and any error that occurred.
func CreateUserByEmail(email, password, firstName string) (uint, error) {
	badid, _ := GetUserIdByEmail(email)
	if badid != 0 {
		return 0, fmt.Errorf("User with email %s already exists", email)
	}

	username := utils.GenerateRandomString(16)
	rows := database.QueryRow(context.Background(), `INSERT INTO "User" (email, hash_password, first_name, username, date_joined) VALUES ($1, $2, $3, $4, $5) RETURNING id`,
		email, password, firstName, username, time.Now())
	var id uint
	err := rows.Scan(&id)
	if err != nil {
		return 0, err
	}

	return id, nil
}

// CreateUserByPhone creates a new user in the database using the given phone number, password, and first name.
// It returns the user ID and any error that occurred.
func CreateUserByPhone(phone, password, firstName string) (uint, error) {
	badid, _ := GetUserIdByPhone(phone)
	if badid != 0 {
		return 0, fmt.Errorf("User with phone %s already exists", phone)
	}

	username := utils.GenerateRandomString(16)
	rows := database.QueryRow(context.Background(), `INSERT INTO "User" (phone, hash_password, first_name, username, date_joined) VALUES ($1, $2, $3, $4, $5) RETURNING id`,
		phone, password, firstName, username, time.Now())
	var id uint
	err := rows.Scan(&id)
	if err != nil {
		return 0, err
	}

	return id, nil
}

// CheckUserAuthByPhone retrieves the user ID from the database based on the phone number
func CheckUserAuthByPhone(phone, password string) (uint, error) {
	var userId uint
	row := database.QueryRow(context.Background(), `SELECT id FROM "User" WHERE phone = $1 AND hash_password = $2`, phone, password)
	err := row.Scan(&userId)
	if err != nil {
		return 0, err
	}

	return userId, nil
}

// CheckUserAuthByEmail retrieves the user ID from the database based on the email address
func CheckUserAuthByEmail(email, password string) (uint, error) {
	var userId uint
	row := database.QueryRow(context.Background(), `SELECT id FROM "User" WHERE email = $1 AND hash_password = $2`, email, password)
	err := row.Scan(&userId)
	if err != nil {
		return 0, err
	}

	return userId, nil
}
func AddUser(user *User) error {
	var userId uint
	_, err := GetUserById(user.Id)
	if err == nil {
		return nil
	}
	row := database.QueryRow(context.Background(), `INSERT INTO "User" (id, last_name, first_name, middle_name, birth_date, city_id, blood_group) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id`,
		user.Id, user.LastName, user.FirstName, user.MiddleName, time.Now(), user.CityId, user.BloodGroup)
	err = row.Scan(&userId)
	if err != nil {
		return err
	}
	return nil
}

// GetUserIdByEmail retrieves the user ID from the database based on the email address
func GetUserIdByEmail(email string) (uint, error) {
	var userId uint
	row := database.QueryRow(context.Background(), `SELECT id FROM "User" WHERE email = $1`, email)
	err := row.Scan(&userId)
	if err != nil {
		return 0, err // Return 0 as user ID and the error
	}
	return userId, nil
}

// GetUserIdByPhone retrieves the user ID from the database based on the phone number
func GetUserIdByPhone(phone string) (uint, error) {
	var userId uint
	row := database.QueryRow(context.Background(), `SELECT id FROM "User" WHERE phone = $1`, phone)
	err := row.Scan(&userId)
	if err != nil {
		return 0, err // Return 0 as user ID and the error
	}
	return userId, nil
}

// GetUserById retrieves a user from the database by user ID
func GetUserById(id uint) (*User, error) {
	var user User
	row := database.QueryRow(context.Background(), `SELECT  id, last_name, first_name, middle_name, birth_date, city_id, blood_group FROM "User" WHERE id = $1`, id)
	err := row.Scan(
		&user.Id,
		&user.LastName,
		&user.FirstName,
		&user.MiddleName,
		&user.BirthDate,
		&user.CityId,
		&user.BloodGroup,
	)
	if err != nil {
		return nil, err // Return nil user and the error
	}
	return &user, nil // Return a pointer to the user and nil error if successful
}

type UserUpdate struct {
	LastName   string `json:"last_name"`
	FirstName  string `json:"first_name"`
	MiddleName string `json:"middle_name"`
	CityID     string `json:"city_id"`
	BirthDate  string `json:"birth_date"`
	BloodGroup string `json:"blood_group"`
}

// UpdateUser updates the user with the given ID with the given update.
// It returns an error if the update failed.
func UpdateUser(id uint, update UserUpdate) error {
	var fields []string
	var values []interface{}

	if update.LastName != "" {
		fields = append(fields, "last_name")
		values = append(values, update.LastName)
	}
	if update.FirstName != "" {
		fields = append(fields, "first_name")
		values = append(values, update.FirstName)
	}
	if update.BirthDate != "" {
		fields = append(fields, "birth_date")
		values = append(values, update.BirthDate)
	}
	if update.CityID != "" {
		fields = append(fields, "city_id")
		values = append(values, update.CityID)
	}
	if update.BloodGroup != "" {
		fields = append(fields, "blood_group")
		values = append(values, update.BloodGroup)
	}

	if len(fields) == 0 {
		return nil // No fields to update
	}

	// Construct the query string
	query := `UPDATE "User" SET `
	for i, field := range fields {
		query += field + ` = $` + strconv.Itoa(i+1) + `, `
	}
	query = query[:len(query)-2] + ` WHERE id = $` + strconv.Itoa(len(fields)+1)

	// Append the ID to the values slice
	values = append(values, id)

	// Execute the query
	_, err := database.Exec(context.Background(), query, values...)
	return err
}
