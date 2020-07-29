#!/bin/bash

FILE=../arquivos/alunos2.txt

if [ $# -gt 0 ]; then
	ALUNOCOMPLETO=$(grep -i  "$1" "$FILE")
	echo "O nome completo do aluno é: "$ALUNOCOMPLETO""
else
	echo "Informe o nome do aluno como parâmetro"
fi

echo
echo "Fim do Script"
