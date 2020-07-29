#!/bin/bash

clear
echo "========= SOMA VALORES ==========="
echo ""
read -p "Primeiro valor: " V1
read -p "Segundo valor: " V2

SOMA=$(expr $V1 + $V2)

echo ""
echo "A soma entre $V1 e $V2 é: $SOMA"
echo "================================="
