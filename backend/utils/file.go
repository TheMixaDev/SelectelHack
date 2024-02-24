package utils

import "os"

// IsFileExists checks if the file represented by filename exists.
//
// filename is the name of the file to check.
// Returns true if the file exists, and false otherwise.
func IsFileExists(filename string) bool {
	info, err := os.Stat(filename)
	if os.IsNotExist(err) {
		return false
	}

	if err != nil {
		return false // Return the error for other cases (e.g., permission issues)
	}

	return !info.IsDir()
}
