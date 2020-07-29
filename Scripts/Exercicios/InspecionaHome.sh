#!/bin/bash

for user in /home/*
do
	echo $user
	echo "Usuário: $(basename $user )"
	echo "Arquivos JPG: $(find $user -name '*.jpeg' |wc -l)"
	echo "Arquivos PNG: $(find $user -name '*.png' |wc -l)"
	echo "Arquivos MP3: $(find $user -name '*.mp3'| wc -l)"
	echo "Aquivos MP4: $(find $user -name '*.mp3'|wc -l)"
done
