#!/bin/bash

teste () {
	local NOME
	read -p "Qual seu nome? " NOME
	echo $NOME
}

teste 
echo $NOME
