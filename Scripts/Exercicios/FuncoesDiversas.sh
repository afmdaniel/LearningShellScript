#!/bin/bash

DATA=$(echo $2 |tr -d "/")
VAL1=$(echo $DATA |cut -c-2)
VAL2=$(echo $DATA |cut -c3-4)
ANO=$(echo $DATA |cut -c5-8)

ajuda () {
	echo "Uso: ./FuncoesDiversas.sh OPCAO DATA"
	echo 
	echo "DATA nos formatos DDMMYYYY ou MMDDYYYY, com ou sem /"
	echo
	echo "OPCAO:"
	echo "-f = Retorna 0 para BR, 1 para US e 2 quando é impossível determinar, 3 Inválido"
	echo "-i = Inverte o formato BR para US e US para BR. Inclui as barras"
	echo "-b = Inclui barras de data. Exemplo: de 13081981 para 13/08/1981"
	echo "-e = Exibe a data em formato extenso. Exemplo de 13081981 para 13 de Agosto de 1981"
}

menosf () {
	if [ $VAL1 -gt 12 -a $VAL2 -le 12 ]; then
		return 0
	elif [ $VAL1 -le 12 -a $VAL2 -gt 12 ]; then
		return 1
	elif [ $VAL1 -le 12 -a $VAL2 -le 12 ]; then
		return 2
	else
		return 3
	fi
}

menosi () {
	menosf $1
	local FORMATO=$?
	if [ $FORMATO -ne 3 ]; then
		echo $VAL2/$VAL1/$ANO
	else
		echo "Formato de Data Inválido"
	fi
}

menosb () {
	menosf $1
	local FORMATO=$?
	if [ $FORMATO -ne 3 ]; then
		echo "$VAL1/$VAL2/$ANO"
	else
		echo "Formato de Data Inválido"
	fi
}

menose () {
	menosf $1
	local FORMATO=$?
	case $FORMATO in
		0)
			local DIA=$VAL1
			local MES=$VAL2
			;;
		1)
			local DIA=$VAL2
			local MES=$VAL1
			;;
		2)
			local OPCAO=0
			until [ "$OPCAO" = 1 -o "$OPCAO" = 2 ]
			do
				echo
				echo "Impossível determinar o padrão da data."
				echo "1 - BR (DD/MM/YYYY)"
				echo "2 - US (MM/DD/YYYY)"
				read -p "Informe o formato (1 ou 2): " OPCAO
				case $OPCAO in
					1) 
						local DIA=$VAL1
						local MES=$VAL2
						;;
					2)
						local DIA=$VAL2
						local MES=$VAL1
						;;
					*)
						echo "Opção Inválida"
						;;
				esac
			done
			echo
			;;
		3)
			echo "Formato de Data Inválido"
			;;
	esac

	case $MES in
		01)
			local MESEXT=Janeiro
			;;
		02)
			local MESEXT=Fevereiro
			;;
		03)
			local MESEXT=Marco
			;;
		04)
			local MESEXT=Abril
			;;
		05)
			local MESEXT=Maio
			;;
		06)
			local MESEXT=Junho
			;;
		07)
			local MESEXT=Julho
			;;
		08)
			local MESEXT=Agosto
			;;
		09)
			local MESEXT=Setembro
			;;
		10)
			local MESEXT=Outubro
			;;
		11)
			local MESEXT=Novembro
			;;
		12)
			local MESEXT=Janeiro
			;;
	esac
	echo "$DIA de $MESEXT de $ANO"
}

case "$1" in
	"--help")
		ajuda
		;;
	"-f")
		menosf $2
		echo $?
		;;
	"-i")
		menosi $2
		;;
	"-b")
		menosb $2
		;;
	"-e")
		menose $2
		;;
	*)
		echo "Opcão inválida. Utilize $0 --help"
		exit 4
esac
