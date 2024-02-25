package database

import (
	"context"
	"strconv"
)

// AddFeedback updates the feedback for a bonus.
func AddFeedback(id int, rating int, comment string) error {
	// Prepare the SQL statement.
	sqlStatement := `UPDATE Bonus SET rating = $1, comment = $2, has_feedback = true WHERE id = $3;`
	// Execute the SQL statement.
	_, err := database.Exec(context.Background(), sqlStatement, strconv.Itoa(rating), comment, id)
	if err != nil {
		return err
	}
	return nil
}
