#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "Entre um argumento valido"
	exit 1       
fi

case "$1" in
	[0-9])
		echo "numero"
		;;
	[A-Z])
		echo "maiuscula"
		;;
	[a-z])
		echo "minuscula"
		;;
	?)
		echo "especial"
		;;
	*)
		echo "entre um argumento válido"
		;;
esac
