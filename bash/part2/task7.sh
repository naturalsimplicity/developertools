#!/usr/bin/env bash
source .env
CHAT_ID=$1
MESSAGE=$2

curl -X POST \
     -H 'Content-Type: application/json' \
     -d "{\"chat_id\": $CHAT_ID, \"text\": \"$MESSAGE\", \"disable_notification\": true}" \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
