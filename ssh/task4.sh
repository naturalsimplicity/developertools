#!/usr/bin/env bash
THREASHOLD=10
read SIZE USED <<< $(ssh -i ~/.ssh/id_ed25519 -p 2222 root@localhost 'df /' | awk '{ if ($1 == "overlay") print $2 " " $3 }')
USED_PRC=$((USED*100/SIZE))
if [[ $USED_PRC -ge $THREASHOLD ]]; then
    source .env
    MESSAGE="Disc space usage exceeded $THREASHOLD%"
    curl -X POST \
         -H 'Content-Type: application/json' \
         -d "{\"chat_id\": $CHAT_ID, \"text\": \"$MESSAGE\", \"disable_notification\": true}" \
         https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
fi
