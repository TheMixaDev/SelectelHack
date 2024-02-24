package utils

import (
	"crypto/rand"
	"encoding/base64"
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
