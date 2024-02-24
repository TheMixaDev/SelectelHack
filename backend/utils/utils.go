package utils

import (
	"crypto/rand"
	"encoding/base64"
	"time"
)

func GenerateRandomString(length int) string {
	// Calculate how many random bytes we need to generate.
	// Since base64 encoding uses 4 characters for every 3 bytes,
	// we need to ensure we generate enough bytes to cover the length.
	bytesNeeded := (length * 6) / 8
	if (length*6)%8 != 0 {
		bytesNeeded++
	}

	// Generate random bytes.
	randBytes := make([]byte, bytesNeeded)
	_, err := rand.Read(randBytes)
	if err != nil {
		return ""
	}

	// Convert random bytes to a base64 string.
	randomString := base64.URLEncoding.EncodeToString(randBytes)

	// Trim the string to the desired length.
	randomString = randomString[:length]

	return randomString
}

// calculateInterval calculates the start and end time of an interval based on a template period and a timestamp.
// If the timestamp is greater than 0, it will be converted to a time.Time object.
// The start time is calculated by subtracting the template period from the end time.
// The end time is set to the current local time if the timestamp is 0.
// The start and end time are returned as a pair of time.Time objects.
func CalculateInterval(templatePeriod uint, timestamp int64) (time.Time, time.Time) {
	// Set the end time to the current local time
	intervalEnd := time.Now().Local()

	// If the timestamp is greater than 0, convert it to a time.Time object
	if timestamp > 0 {
		intervalEnd = time.Unix(0, timestamp*int64(time.Millisecond)).Local()
	}

	// Calculate the start time by subtracting the template period from the end time
	intervalStart := intervalEnd.Add(-(time.Duration(templatePeriod) * time.Millisecond))

	return intervalStart, intervalEnd
}

func SameDay(t1, t2 time.Time) bool {
	return t1.Year() == t2.Year() && t1.YearDay() == t2.YearDay()
}

func GetDate(dateString string) (time.Time, error) {
	layout := "2006-01-02"
	desiredDate, err := time.Parse(layout, dateString)
	if err != nil {
		return time.Time{}, err
	}
	return desiredDate, nil
}
