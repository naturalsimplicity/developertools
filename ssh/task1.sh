#!/usr/bin/env bash
# preliminary step
ssh-copy-id -p 2222 -i ~/.ssh/id_ed25519 root@localhost
# task
tar -czf somearchive.tar.gz somedir
scp -i ~/.ssh/id_ed25519 -P 2222 somearchive.tar.gz root@localhost:/root/somearchive.tar.gz

