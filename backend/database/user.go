package database

import (
	"context"
	"time"
)

type User struct {
	Id                   string    `json:"id"`
	DateJoined           time.Time `json:"date_joined"`
	Username             string    `json:"username"`
	FirstName            string    `json:"first_name"`
	LastName             string    `json:"last_name"`
	MiddleName           string    `json:"middle_name"`
	MaidenName           string    `json:"maiden_name"`
	BirthDate            string    `json:"birth_date"`
	Gender               string    `json:"gender"`
	Email                string    `json:"email"`
	Phone                string    `json:"phone"`
	LoginViaPhone        bool      `json:"login_via_phone"`
	About                string    `json:"about"`
	CityId               string    `json:"city_id"`
	City                 string    `json:"city"`
	IsPin20              bool      `json:"is_pin_20"`
	IsPin100             bool      `json:"is_pin_100"`
	DonationAgg          string    `json:"donation_agg"`
	Socials              string    `json:"socials"`
	Photo                string    `json:"photo"`
	PhotoId              uint      `json:"photo_id"`
	NextDonationDate     time.Time `json:"next_donation_date"`
	NextDonation         time.Time `json:"next_donation"`
	BloodGroup           string    `json:"blood_group"`
	HashPassword         string    `json:"hash_password"`
	IsEmailVerified      bool      `json:"is_email_verified"`
	IsPhoneVerified      bool      `json:"is_phone_verified"`
	EmailReconfirmedAt   string    `json:"email_reconfirmed_at"`
	PhoneReconfirmedAt   string    `json:"phone_reconfirmed_at"`
	LegacyAvatar         string    `json:"legacy_avatar"`
	StartDonorYear       time.Time `json:"start_donor_year"`
	ReferalCode          string    `json:"referal_code"`
	ParentUser           string    `json:"parent_user"`
	InvitedUsers         string    `json:"invited_users"`
	DonorStatus          string    `json:"donor_status"`
	ManagedOrganizations string    `json:"managed_organizations"`
	JoinedEvents         string    `json:"joined_events"`
	JoinedOrganizations  time.Time `json:"joined_organizations"`
	DonorCertificate     bool      `json:"donor_certificate"`
}

func NewUser(email, password, firstName string) *User {
	user := &User{
		Email:        email,
		HashPassword: password,
		FirstName:    firstName,
	}
	return user
}

func AddUser(user *User) error {
	var userId uint
	row := database.QueryRow(context.Background(), "INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING id", user.FirstName, user.Email, user.HashPassword)
	err := row.Scan(&userId)
	if err != nil {
		return err
	}
	return nil
}

func GetUserIdByEmail(email string) (uint, error) {
	var userId uint
	row := database.QueryRow(context.Background(), "SELECT id FROM users WHERE email = $1", email)
	err := row.Scan(&userId)
	if err != nil {
		return 0, err // Return 0 as user ID and the error
	}
	return userId, nil
}

// GetUserById retrieves a user from the database by user ID
func GetUserById(id uint) (*User, error) {
	var user User
	row := database.QueryRow(context.Background(), "SELECT  username,  first_name,  last_name,  middle_name,  maiden_name,  birth_date,  gender,  login_via_phone,  about,  city_id,  is_pin_20,  is_pin_100,  photo_id,  email_reconfirmed_at,  phone_reconfirmed_at,  donor_certificate, FROM users WHERE id = $1", id)
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
