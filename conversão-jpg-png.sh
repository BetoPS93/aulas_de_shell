#!/bin/bash

cd ~/Downloads/imagens-livros
if [ ! -d png ]
then
	mkdir png
fi

for imagem in  *.jpg
do
	imagem_se=$(ls $imagem | awk -F. '{ print $1 }')
	convert $imagem_se.jpg png/$imagem_se.png
done
