#!/bin/bash

clear
read -p "Informe o início da sequência: " INICIO
read -p "Informe o final da sequência: " FIM
read -p "Informe o incremento: " INCREMENTO

e=1

for i in $(seq $INICIO $INCREMENTO $FIM)
do
	echo "Exibindo elemento $e: $i"
	e=$(expr $e + 1)
done
