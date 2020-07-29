#!/bin/bash

#HORA=$1
HORA=$(date +%H)
MINUTO=$(date +%M)

if [ "$HORA" -ge 12 ]; then
	HORA=$(expr "$HORA" - 12 % "$HORA" )
	AMPM=PM
else 
	AMPM=AM
fi

if [ "$AMPM" = "AM" -a "$HORA" -ge 6 -a "$HORA" -lt 12 ]; then
	echo "Bom dia!"
elif [ \( "$AMPM" = "PM" -a "$HORA" -ge 1 -a "$HORA" -lt 6 \) -o "$HORA" -eq 12 ]; then
	echo "Boa tarde!"
else 
	echo "Boa noite!"
fi

echo "A hora atual é: "$HORA":"$MINUTO" "$AMPM""
	
