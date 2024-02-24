package database

import (
	"context"
	"fmt"
	"time"

	"github.com/invalidteam/selectel_hack/utils"
)

func NewUser(email, password, firstName string) *User {
	user := &User{
		Username:     utils.GenerateRandomString(16),
		DateJoined:   time.Now(),
		Email:        email,
		HashPassword: password,
		FirstName:    firstName,
	}
	return user
}

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

func CheckUserAuthByPhone(phone, password string) (uint, error) {
	var userId uint
	row := database.QueryRow(context.Background(), `SELECT id FROM "User" WHERE phone = $1 AND hash_password = $2`, phone, password)
	err := row.Scan(&userId)
	if err != nil {
		return 0, err
	}

	return userId, nil
}

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
	row := database.QueryRow(context.Background(), `INSERT INTO "User" (first_name, email, hash_password, username, date_joined, date_joined) VALUES ($1, $2, $3, $4, $5) RETURNING id`,
		user.FirstName, user.Email, user.HashPassword, user.Username, user.DateJoined)
	err := row.Scan(&userId)
	if err != nil {
		return err
	}
	return nil
}

func GetUserIdByEmail(email string) (uint, error) {
	var userId uint
	row := database.QueryRow(context.Background(), `SELECT id FROM "User" WHERE email = $1`, email)
	err := row.Scan(&userId)
	if err != nil {
		return 0, err // Return 0 as user ID and the error
	}
	return userId, nil
}

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
	row := database.QueryRow(context.Background(), `SELECT  username,  first_name,  last_name,  middle_name,  maiden_name,  birth_date,  gender,  login_via_phone,  about,  city_id,  is_pin_20,  is_pin_100,  photo_id,  email_reconfirmed_at,  phone_reconfirmed_at,  donor_certificate, FROM "User" WHERE id = $1`, id)
	err := row.Scan(
		&user.Username,
		&user.FirstName,
		&user.LastName,
		&user.MiddleName,
		&user.MaidenName,
		&user.BirthDate,
		&user.Gender,
		&user.LoginViaPhone,
		&user.About,
		&user.CityId,
		&user.IsPin20,
		&user.IsPin100,
		&user.PhotoId,
		&user.EmailReconfirmedAt,
		&user.PhoneReconfirmedAt,
		&user.DonorCertificate)
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

func UpdateUser(id uint, update UserUpdate) error {
	if update.LastName != "" {
		_, err := database.Exec(context.Background(), `UPDATE "User" SET last_name = $1 WHERE id = $2`, update.LastName, id)
		if err != nil {
			return err
		}
	}

	if update.FirstName != "" {
		_, err := database.Exec(context.Background(), `UPDATE "User" SET first_name = $1 WHERE id = $2`, update.FirstName, id)
		if err != nil {
			return err
		}
	}

	if update.BirthDate != "" {
		_, err := database.Exec(context.Background(), `UPDATE "User" SET birth_date = $1 WHERE id = $2`, update.BirthDate, id)
		if err != nil {
			return err
		}
	}

	if update.CityID != "" {
		_, err := database.Exec(context.Background(), `UPDATE "User" SET city_id = $1 WHERE id = $2`, update.CityID, id)
		if err != nil {
			return err
		}
	}

	if update.BloodGroup != "" {
		_, err := database.Exec(context.Background(), `UPDATE "User" SET blood_group = $1 WHERE id = $2`, update.BloodGroup, id)
		if err != nil {
			return err
		}
	}

	return nil
}

// // TODO
// func GetDonorCardByUserId(userID uint) (*DonorCard, error) {
// 	var donorCard DonorCard
// 	row := database.QueryRow(context.Background(), `SELECT * FROM "DonorCard" WHERE user_id = $1`, userID)
// }

// // TODO
// func UpdateDonorCard(userID uint, donorCard *DonorCard) error {

// }
