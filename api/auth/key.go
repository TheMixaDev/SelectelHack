package auth

import (
	"crypto/rand"
	"crypto/rsa"
	"crypto/x509"
	"encoding/pem"
	"errors"
	"os"

	"go.uber.org/zap"

	"github.com/kxrxh/selectel_hack/utils"
)

type KeyPair struct {
	privateKey *rsa.PrivateKey
	publicKey  *rsa.PublicKey
}

var keys KeyPair

// generateOrLoadRsaKeyPair checks for existing RSA key pair files and
// loads them. If they do not exist, it generates a new RSA key pair.
//
// Returns KeyPair and error. On success, KeyPair contains the RSA keys
// and error is nil. On failure, KeyPair is empty and error contains
// the failure details.
func GenerateOrLoadRsaKeyPair() error {
	if utils.IsFileExists("private.pem") && utils.IsFileExists("public.pem") {
		privateKey, err := readPEMKey[*rsa.PrivateKey]("private.pem")
		if err != nil {
			return err
		}

		publicKey, err := readPEMKey[*rsa.PublicKey]("public.pem")
		if err != nil {
			return err
		}

		keys = KeyPair{
			privateKey: privateKey,
			publicKey:  publicKey,
		}

		zap.L().Sugar().Debugln("RSA key pair loaded successfully!")

		return nil
	} else {
		keyPair, err := generateNewRsaKeyPair()
		if err == nil {
			keys = keyPair
			zap.L().Sugar().Debugln("Generated new RSA key pair!")
			savePEMKey("private.pem", keyPair.privateKey)
			savePEMKey("public.pem", keyPair.publicKey)
		}
		return err
	}
}

// readPEMKey reads a PEM encoded file and returns the key.
//
// It supports *rsa.PrivateKey and *rsa.PublicKey types.
// Takes a filename as input and returns the key and an error.
func readPEMKey[KeyType *rsa.PrivateKey | *rsa.PublicKey](filename string) (KeyType, error) {
	// Reading given file as bytes and parsing it as PEM
	content, readErr := os.ReadFile(filename)
	if readErr != nil {
		return nil, readErr
	}

	block, _ := pem.Decode(content)
	if block == nil {
		return nil, errors.New("PEM decode error")
	}

	// For a private key, use x509.ParseECPrivateKey, x509.ParsePKCS1PrivateKey, or x509.ParsePKCS8PrivateKey
	// depending on the key type.
	var (
		parsedKey any
		keyType   KeyType
	)
	switch any(keyType).(type) {
	case *rsa.PublicKey:
		parsedKey, readErr = x509.ParsePKCS1PublicKey(block.Bytes)
	case *rsa.PrivateKey:
		parsedKey, readErr = x509.ParsePKCS1PrivateKey(block.Bytes)
	}
	if readErr != nil {
		return nil, readErr
	}

	return parsedKey.(KeyType), nil
}

// savePEMKey saves an RSA key to a PEM-formatted file.
//
// savePEMKey accepts a filename as a string and an RSA key of type
// *rsa.PrivateKey or *rsa.PublicKey.
// It returns an error if the file cannot be created or if there
// is an error during PEM encoding.
func savePEMKey[KeyType *rsa.PrivateKey | *rsa.PublicKey](filename string, key KeyType) error {
	file, err := os.Create(filename) // Create the file
	if err != nil {
		return err
	}
	defer file.Close() // Close the file at the end of the function

	var keyType KeyType
	// Determine the type of the key and encode it accordingly
	switch any(keyType).(type) {
	case *rsa.PublicKey:
		err = pem.Encode(file, &pem.Block{
			Type:  "RSA PUBLIC KEY",
			Bytes: x509.MarshalPKCS1PublicKey(any(key).(*rsa.PublicKey)),
		})
	case *rsa.PrivateKey:
		err = pem.Encode(file, &pem.Block{
			Type:  "RSA PRIVATE KEY",
			Bytes: x509.MarshalPKCS1PrivateKey(any(key).(*rsa.PrivateKey)),
		})
	}

	return err
}

// generateNewRsaKeyPair creates a new RSA key pair with a size of 2048 bits.
//
// Returns a KeyPair struct containing the newly generated private and
// public keys and an error if key generation fails.
func generateNewRsaKeyPair() (KeyPair, error) {
	rng := rand.Reader
	privateKey, err := rsa.GenerateKey(rng, 2048)
	if err != nil {
		return KeyPair{}, err
	}

	return KeyPair{
		privateKey: privateKey,
		publicKey:  &privateKey.PublicKey,
	}, nil
}
