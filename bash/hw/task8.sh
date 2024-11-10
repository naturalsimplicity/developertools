#!/usr/bin/env bash
DIRPATH=$1
LOG_FILE_PATH=backup.log

echo "Backup of files in $DIRPATH has been started" >> $LOG_FILE_PATH
for FILE in "$DIRPATH"/*; do
    if [ -f $FILE ]; then
        cp $FILE "$(dirname $FILE)/$(date +%Y%m%d%H%M%S)_$(basename $FILE)"
        echo "Backup of $FILE created" >> $LOG_FILE_PATH
    fi;
done;
echo "Backup completed" >> $LOG_FILE_PATH
echo "Backup completed"

