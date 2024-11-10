#!/usr/bin/env bash
DIR_PATH=$1
IMAGES_DIR=Images
DOCUMENTS_DIR=Documents
LOG_FILE=/Users/matthew/hse/developertools/bash/hw/file_sort.log

echo "File sorting has been started at $(date +%Y-%m-%dT%H:%M:%S)" >> $LOG_FILE
if [ ! -d "$DIR_PATH/$IMAGES_DIR" ]; then
    mkdir "$DIR_PATH/$IMAGES_DIR"
    echo "Created $IMAGES_DIR directory" >> $LOG_FILE
fi;

if [ ! -d "$DIR_PATH/$DOCUMENTS_DIR" ]; then
    mkdir "$DIR_PATH/$DOCUMENTS_DIR"
    echo "Created $DOCUMENTS_DIR directory" >> $LOG_FILE
fi;

for FILE in "$DIR_PATH"/*; do
    FILE_NAME=$(basename $FILE)
    EXTENSION=${FILE_NAME#*.}
    case $EXTENSION in
        ('jpg' | 'png' | 'gif') mv $FILE "$(dirname $FILE)/$IMAGES_DIR/$FILE_NAME";
       				echo "File $FILE moved to $IMAGES_DIR" >> $LOG_FILE;;
        'txt' | 'pdf' | 'docx') mv $FILE "$(dirname $FILE)/$DOCUMENTS_DIR/$FILE_NAME";
				echo "File $FILE moved to $DOCUMENTS_DIR" >> $LOG_FILE;;
    esac;
done;
echo "File sorting ended" >> $LOG_FILE

# create cron job
# (crontab -l ; echo "55 0 * * * /Users/matthew/hse/developertools/ssh/hw/task10.sh /Users/matthew/hse/developertools/ssh/hw/somedir4") | crontab
