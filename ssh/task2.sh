#!/usr/bin/env bash
ssh -i id_ed25519 -p 2222 root@localhost << EOF
apt-get update
apt upgrade -y
EOF
source .env
MESSAGE="System has been upgraded"
curl -X POST \
     -H 'Content-Type: application/json' \
     -d "{\"chat_id\": $CHAT_ID, \"text\": \"$MESSAGE\", \"disable_notification\": true}" \
     https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage
