#!/bin/bash

DATAHORA=$(date +%H:%M)
ALUNOS_FILE="/home/daniel/Documentos/Cursos/Linux/ShellScript/arquivos/alunos2.txt"

LOG="$HOME/Documentos/Cursos/Linux/ShellScript/Scripts/log2.out"

exec 1> $LOG
exec 2>&1

# Reads date and hours
echo "$(date) - Iniciando o Script..."
echo "==== MEU PRIMEIRO SCRIPT ===="
echo ""
echo "Exibir data e hora atual: $DATAHORA"
echo ""

# Read and sort student list
echo "============================"
echo "Listagem dos Alunos: "
sort $ALUNOS_FILE
echo "============================"
echo "PID: $$"
echo "============================"

echo "$(date) - Fim do Script..."
