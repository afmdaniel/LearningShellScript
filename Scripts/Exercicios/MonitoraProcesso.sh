#!/bin/bash

clear 

if [ $# -eq 0 ]; then
	echo "Favor informar um processo como argumento"
	echo "./MonitoraProcesso.sh <processo>"
	exit 1
fi

while true
do
    until ps aux | grep "$1" | grep -v grep | grep -v $0 >> /dev/null
    do
	    echo "Atenção! O processo $1 NÃO está em execução"
	    sleep 3
    done
done
