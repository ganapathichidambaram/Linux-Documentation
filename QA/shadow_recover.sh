#!/bin/bash
# Script to update user password in batch mode
# You must be a root user to use this script
# /root is good place to store clear text password
FILE="/root/batch.passwd"
 
# get all non-root user account
# By default on most linux non-root uid starts
# from 1000
USERS=$(awk -F: '{ if ( $3 > 1000 ) print $1}' /etc/passwd)
 
# create file with random password
echo "Generating file, please wait..."
 
# overwrite file, this is bash specific a better solution is cat > $FILE
>$FILE
 
for u in $USERS
do
   p=$(pwgen -1 -n 8) # create random password
   echo "$u:$p" >> $FILE # save USERNAME:PASSWORD pair
done
echo ""
echo "Random password and username list stored in $FILE file"
echo "Review $FILE file, once satisfied execute command: "
echo "chpasswd < $FILE"
 
# Uncomment following line if you want immediately update all users password,
# be careful with this option, it is recommended that you review $FILE first
# chpasswd < $FILE