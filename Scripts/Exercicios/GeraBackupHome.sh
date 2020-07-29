#!/bin/bash

PATH_BACKUP=$HOME/Backup

# Verifica se o diretório já existe, se não existir cria um novo
if [ ! -d $PATH_BACKUP ]; then
	mkdir -p $PATH_BACKUP
	echo "Novo diretório criado: "$PATH_BACKUP""
fi

DAYS7=$(find $PATH_BACKUP -ctime -7 -name *tgz)

if [ "$DAYS7" ]; then
	echo "Já foi gerado um backup nos últimos 7 dias"
	read -p "Deseja continuar?(N/s) " -n1 CONT
	echo
	case "$CONT" in
		[Nn] | "")
			echo "Backup abortado!"
			exit 1
			;;
		[Ss])
			echo "Será criado mais um backup para a mesma semana"
			;;
		*)
			echo "Opção inválida"
			exit 2
			;;
	esac
fi

FILE="backup_Imagens_$(date +%Y%m%d%H%M).tgz"

echo
echo "Criando Backup..."

tar zcvpf "$PATH_BACKUP"/"$FILE" --absolute-names ~/Imagens # > /dev/null

if [ "$?" -eq 0 ]; then
	echo
	echo ""$FILE" criado com sucesso!"
else
	echo
	echo "Erro ao criar arquivo!"
	echo "Operação Finalizada!"
	exit 3
fi

echo
echo "Backup concluído!"
