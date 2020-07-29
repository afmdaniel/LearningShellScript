#!/bin/bash

read -p "Informe o valor 1: " V1
read -p "Informe o valor2: " V2

if [ ! $V1 ] || [ ! $V2 ]; then
	echo "Nenhum dos valores pode ser nulo"
	exit 1
fi

echo
echo "Escolha uma Operação:"
echo "1 = Soma"
echo "2 = Subtração"
echo "3 = Multiplicação"
echo "4 = Divisão"
echo "Q = Sair"
echo
read -p "Opção: " OPCAO
echo

case $OPCAO in
	1)
		RESULTADO=$(expr $V1 + $V2)
		echo "$V1 + $V2 = $RESULTADO"
		;;
	2)
		RESULTADO=$(expr $V1 - $V2)
		echo "$V1 - $V2 = $RESULTADO"
		;;
	3)
		RESULTADO=$(expr $V1 \* $V2)
		echo "$V1 * $V2 = $RESULTADO"
		;;
	4)
		if [ $V2 -eq 0 ]; then
			echo "Não se pode dividir por 0"
			exit 2
		fi
		RESULTADO=$(expr $V1 / $V2)
		RESTO=$(expr $V1 % $V2)
		if [ $RESTO -ne 0 ]; then
			echo "Divisão com Resto = $RESTO"
		else
			echo "Divisão Exata"
		fi
		echo
		echo "$V1 / $V2 = $RESULTADO"
		;;
	[Qq])
		echo "Operação Encerrada" 
		exit 0
		;;
	*)
		echo "Entrada Inválida"
		exit 1
		;;
esac
