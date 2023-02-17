#!/bin/bash
converte_imagem(){
    local caminho_imagem=$1
    
    local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
    convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png

}

rastreio_diretorio(){
    cd $1
        for arquivo in *
        do
            local caminho_arquivo=$(find ~/Downloads/imagens-novos-livros -name $arquivo)
            if [-d $caminho_arquivo ]
                rastreio_diretorio $caminho_arquivo
            else 
                converte_imagem $caminho_arquivo
            fi        
        done    
}

rastreio_diretorio ../imagens-livros
if [ $? -eq 0 ]
then 
    echo "Conversao realizada com sucesso!!"
else 
    echo "Houve uma falha no processo!!"
fi
