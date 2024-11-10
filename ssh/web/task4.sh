#!/usr/bin/env bash
THRESHOLD=10
read SIZE USED <<< $(ssh -i ~/.ssh/id_ed25519 -p 2222 root@localhost 'df /' | awk '{ if ($1 == "overlay") print $2 " " $3 }')
USED_PRC=$((USED*100/SIZE))
if [[ $USED_PRC -ge $THRESHOLD ]]; then
    source .env
    EMAIL="matthewvasheka@gmail.ru"
    MESSAGE="Disc space usage exceeded $THREASHOLD%"
    mail -s $MESSAGE $EMAIL
    # на всякий случай отправим еще в телеграм
    curl -X POST \
         -H 'Content-Type: application/json' \
         -d "{\"chat_id\": $CHAT_ID, \"text\": \"$MESSAGE\", \"disable_notification\": true}" \
         https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
fi
