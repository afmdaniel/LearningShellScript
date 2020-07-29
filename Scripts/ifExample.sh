#!/bin/bash

USUARIO=$(grep "$1" /etc/passwd)

if [ -n "$USUARIO" ]
then 
	echo "O Usuario existe"
else
	echo "O usuario não existe"
fi
