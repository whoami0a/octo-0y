#!/bin/bash

# Read Telegram bot token from secret
TELEGRAM_BOT_TOKEN=$TELEGRAM_BOT_TOKEN

# Read links file URL from secret
LINKS_FILE_URL=$LINKS_FILE_URL

# Download links.txt file
wget $LINKS_FILE_URL -O links.txt

# Loop through links and send them via Telegram bot
while IFS= read -r link; do
  # Send link via Telegram bot
  # Replace <CHAT_ID> with your group chat ID
  curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" -d "chat_id=<CHAT_ID>&text=$link"

  # Wait for 20 seconds before sending the next link
  sleep 20
done < links.txt
