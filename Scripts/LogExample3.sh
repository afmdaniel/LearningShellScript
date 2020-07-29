#!/bin/bash

DATAHORA=$(date +%H:%M)
ALUNOS_FILE="/home/daniel/Documentos/Cursos/Linux/ShellScript/arquivos/alunos2.txt"


# Reads date and hours
echo "Iniciando o Script..." | logger -p local0.warn -t [$0]
echo "==== MEU PRIMEIRO SCRIPT ===="
echo ""
echo "Exibir data e hora atual: $DATAHORA"
echo ""

# Read and sort student list
echo "============================"
echo "Listagem dos Alunos: "
sort $ALUNOS_FILE | tee -a >(logger -p local0.warn -t [$0])
echo "============================"
echo "PID: $$"
echo "============================"

logger -p local0.warn -t [$0] "Fim do Script!"
