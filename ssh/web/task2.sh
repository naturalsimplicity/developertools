#!/usr/bin/env bash
MESSAGE="System has been upgraded"
MAIL="matthewvasheka@gmail.com"
ssh -i ~/.ssh/id_ed25519 -p 2222 root@localhost << EOF
apt-get update
apt upgrade -y
if [ -f /var/run/reboot-required ]; then
    sudo reboot
    mail -s $MESSAGE $EMAIL
    exit 0
else
    echo "Reboot does not required"
fi
EOF
