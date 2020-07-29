#!/bin/bash

clear
echo -e "USUARIO\t\tUID\t\tDIR HOME\t\tNOME OU DESCRIÇÃO"

MAX_UID=$(grep -e ^UID_MAX /etc/login.defs |tr -s "\t" |cut -f2)
MIN_UID=$(grep -e ^UID_MIN /etc/login.defs |tr -s "\t" |cut -f2)

OLDIFS=$IFS

IFS=$'\n'

for user in $(cat /etc/passwd)
do
	user_UID=$(grep "$user" /etc/passwd |cut -f3 -d:)
        if [ $user_UID -ge $MIN_UID ] && [ $user_UID -le $MAX_UID ]; then
	        user_NAME=$(echo $user |cut -f1 -d:)
		user_DIR=$(echo "$user" |cut -f6 -d:)
		user_DES=$(echo "$user" |cut -f5 -d:)
		echo -e "$user_NAME\t\t$user_UID\t\t$user_DIR\t\t$user_DES"
	fi
done

echo
IFS=$OLDIFS	
