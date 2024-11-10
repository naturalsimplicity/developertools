#!/usr/bin/env bash
ssh -i ~/.ssh/id_ed25519 -p 2222 root@localhost 'cd /root; tar -czvf somearchive.tar.gz somedir'
scp -i ~/.ssh/id_ed25519 -P 2222 root@localhost:/root/somearchive.tar.gz somearchive.tar.gz
tar -xzvf somearchive.tar.gz
