package utils

import (
	"bytes"
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/spf13/viper"
)

const (
	API_URL = "https://api.telegram.org/%s:%s/sendMessage"
)

func getUrl() string {
	return fmt.Sprintf(API_URL, viper.GetString("bot.bot_id"), viper.GetString("bot.api_key"))
}

func SendMessage(chatID int64, message string) error {
	client := &http.Client{}

	messageData := map[string]interface{}{
		"chat_id": chatID,
		"text":    message,
	}

	jsonValue, err := json.Marshal(messageData)
	if err != nil {
		return err
	}

	req, err := http.NewRequest("POST", getUrl(), bytes.NewBuffer(jsonValue))
	if err != nil {
		return err
	}
	req.Header.Set("Content-Type", "application/json")

	resp, err := client.Do(req)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	if resp.StatusCode != 200 {
		return fmt.Errorf("Unexpected status code: %d", resp.StatusCode)
	}

	return nil
}
