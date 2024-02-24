package database

import (
	"context"

	"go.uber.org/zap"
)

func AddDonationPlan(userId uint, donationPlan DonationPlan) (uint, error) {
	row := database.QueryRow(context.Background(), "INSERT INTO donation_plan (user_id, blood_station_id, city_id, donate_at, blood_class, payment_type) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id",
		userId, donationPlan.BloodStationID, donationPlan.CityID, donationPlan.DonateAt, donationPlan.BloodClass, donationPlan.PaymentType)
	err := row.Scan(&donationPlan.ID)
	if err != nil {
		zap.S().Warnln("ERROR while inserting donationPlan", zap.Error(err))
		return 0, err
	}

	zap.S().Debugln("donationPlan inserted successfully", zap.Any("id", donationPlan.ID))
	return donationPlan.ID, nil
}

func DeleteDonationPlan(id uint) error {
	_, err := database.Exec(context.Background(), "DELETE FROM donation_plan WHERE id = $1", id)
	if err != nil {
		zap.S().Warnln("ERROR while deleting donationPlan", zap.Error(err))
		return err
	}

	return nil
}
