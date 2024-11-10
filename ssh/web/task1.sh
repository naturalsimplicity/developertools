#!/usr/bin/env bash
# preliminary step
# ssh-copy-id -p 2222 -i ~/.ssh/id_ed25519 root@localhost

SOURCE_PATH="./somedir"
REMOTE_USER="root"
REMOTE_HOST="localhost"
REMOTE_PATH="/root"
ARCHIVE_NAME="backup_$(date +%Y%m%d%H%M%S).tar.gz"
MAX_ARCHIVES=3

tar -czf "$ARCHIVE_NAME" -C "$(dirname $SOURCE_PATH)" "$(basename $SOURCE_PATH)"
scp -i ~/.ssh/id_ed25519 -P 2222 $ARCHIVE_NAME "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"
rm $ARCHIVE_NAME
ssh "$REMOTE_USER@$REMOTE_HOST" bash -s << EOF
    cd "$REMOTE_PATH"
    ARCHIVE_COUNT=$(ls -1tr backup_*.tar.gz | wc -l)
    if [ "$ARCHIVE_COUNT" -gt "$MAX_ARCHIVES" ]; then
        ls -1tr backup_*.tar.gz | tail -n $MAX_ARCHIVES | xargs rm
    fi EOF
