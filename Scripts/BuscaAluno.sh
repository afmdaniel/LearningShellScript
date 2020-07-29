#!/bin/bash

FILE=../arquivos/alunos2.txt

clear
read -p "Qual o primeiro nome do aluno que você deseja procurar? " NOME
grep $NOME $FILE
