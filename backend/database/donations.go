package database

import (
	"context"

	"go.uber.org/zap"
)

func GetDonations(id uint) ([]Donation, error) {
	zap.S().Debug(id)
	rows, err := database.Query(context.Background(), "SELECT * FROM donation WHERE user_id = $1", id)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var donations []Donation = make([]Donation, 0)

	for rows.Next() {
		var donation Donation
		err = rows.Scan(&donation.ID, &donation.BloodStationID, &donation.ImageID, &donation.CityID, &donation.DonateAt, &donation.BloodClass, &donation.PaymentType, &donation.WithImage, &donation.UserID)
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
