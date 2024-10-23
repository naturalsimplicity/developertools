#!/usr/bin/env bash
filepath=$1
prev_mtime=$(stat -f %m $filepath)

while true    
do
   mtime=$(stat -f %m $filepath)

   if [[ $prev_mtime != $mtime ]]
   then    
       echo "File has been changed"
       prev_mtime=$mtime
   fi
   sleep 5
done
