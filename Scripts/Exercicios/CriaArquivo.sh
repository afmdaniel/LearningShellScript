#!/bin/bash

clear
read -p "Informe o nome do arquivo a ser criado: " arquivo
read -p "Informe o conjunto de caracteres que será usado para preencher o arquivo: " carac
read -p "Informe o tamanho final do arquivo (em bytes): " tam_max

cat /dev/null > $arquivo

while [ $(stat --printf=%s "$arquivo") -lt $tam_max ]
do
	echo -n "$carac" >> "$arquivo"
	tam_atual=$(stat --printf=%s "$arquivo")
	perc=$(expr "$tam_atual" \* 100 / "$tam_max")
	if [ $(expr $perc % 10) -eq 0 ]; then
		echo "Concluído: $perc% - Tamanho do Arquivo: $tam_atual"
	fi
done

