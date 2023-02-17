#!/bin/bash

#MODELO 1

CAMINHO_IMAGENS=../imagens-livros

for imagem in $@
do
    convert $CAMINHO_IMAGENS/$imagem.jpg $CAMINHO_IMAGENS/$imagem.png
done

#MODELO 2

cd ../imagens-livros

for imagem in *.jpg
do
    imagem_sem_extensao =$(ls $imagem | awk -F . '{print $1}')
    convert $imagem_sem_extensao $imagem_sem_extensao.png
done

