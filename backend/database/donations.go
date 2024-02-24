package database

import (
	"context"

	"go.uber.org/zap"
)

type DonationWithCity struct {
	ID             uint   `json:"id"`
	BloodStationID uint   `json:"blood_station_id"`
	ImageID        uint   `json:"image_id"`
	CityID         uint   `json:"city_id"`
	DonateAt       string `json:"donate_at"`
	BloodClass     string `json:"blood_class"`
	PaymentType    string `json:"payment_type"`
	WithImage      bool   `json:"with_image"`
	UserID         uint   `json:"user_id"`
	CityTitle      string `json:"city_title"`
	CityRegion     string `json:"city_region"`
	CityCountry    string `json:"city_country"`
}

func GetDonations(id uint) ([]DonationWithCity, error) {
	zap.S().Debug(id)
	// Adjusted to join Donation table with City table
	rows, err := database.Query(context.Background(), `
        SELECT d.*, c.title, c.region, c.country
        FROM donation d
        JOIN city c ON d.city_id = c.id
        WHERE d.user_id = $1`, id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var donations []DonationWithCity = make([]DonationWithCity, 0)

	for rows.Next() {
		var donation DonationWithCity
		// Adjusted to scan city information as well
		err = rows.Scan(&donation.ID, &donation.BloodStationID, &donation.ImageID, &donation.CityID, &donation.DonateAt, &donation.BloodClass, &donation.PaymentType, &donation.WithImage, &donation.UserID, &donation.CityTitle, &donation.CityRegion, &donation.CityCountry)
		if err != nil {
			zap.S().Warnln("ERROR while scanning donation", zap.Error(err))
		}
		donations = append(donations, donation)
	}

	return donations, nil
}
func AddDonation(userId uint, donation Donation) (int, error) {
	row := database.QueryRow(context.Background(), "INSERT INTO donation (user_id, blood_station_id, image_id, city_id, donate_at, blood_class, payment_type, with_image) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id",
		userId, donation.BloodStationID, donation.ImageID, donation.CityID, donation.DonateAt, donation.BloodClass, donation.PaymentType, donation.WithImage)
	err := row.Scan(&donation.ID)
	if err != nil {
		zap.S().Warnln("ERROR while inserting donation", zap.Error(err))
		return -1, err
	}

	zap.S().Debugln("Donation inserted successfully", zap.Any("id", donation.ID))
	return donation.ID, nil
}

func UpdateDonation(update Donation) error {
	rows, err := database.Query(context.Background(), "UPDATE donation SET blood_station_id = $1, image_id = $2, city_id = $3, payment_type = $4, donate_at = $5, blood_class = $6, with_image = $7, user_id = $8 WHERE id = $9",
		update.BloodStationID, update.ImageID, update.CityID, update.PaymentType, update.DonateAt, update.BloodClass, update.WithImage, update.UserID, update.ID)
	if err != nil {
		return err
	}
	defer rows.Close()
	return nil
}
