#!/bin/bash

#############################################
#
# PrimeiroScript.sh - Example of Linux classes
# 
# Author: Daniel Melo (danielfarias380@gmail.com)
# Date: 06/04/2020 (DD/MM/YYYY)
#
# Description: reads date and hour and prints the student list
#
# Sintax:
# ./PrimeiroScript.sh
# source ./PrimeiroScript.sh
# . PrimeiroScript.sh
# bash PrimeiroScript.sh
#
# Changes:
#
#############################################

DATAHORA=$(date +%H:%M)
ALUNOS_FILE="/home/daniel/Documentos/Cursos/Linux/ShellScript/arquivos/alunos2.txt"

# Reads date and hours
clear
echo "==== MEU PRIMEIRO SCRIPT ===="
echo ""
echo "Exibir data e hora atual: $DATAHORA"
echo ""

# Read and sort student list
echo "============================"
echo "Listagem dos Alunos: "
sort -b $ALUNOS_FILE
echo ""
echo "PID: $$"
