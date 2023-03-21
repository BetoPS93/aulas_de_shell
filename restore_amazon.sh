#!/bin/bash

CAMINHO_RESTORE=/home/beto/Documentos/Cursos/Fundamentos_de_Programacao/Aulas_de_shell/backup_mutillidae_amazon
aws s3 sync s3://curso-shell-script/$(date +%F) $CAMINHO_RESTORE

cd $CAMINHO_RESTORE
if [ -f $1.sql ]
then
    mysql -u root mutillidae < $1.sql
    if [ $? -eq 0 ]
    then
        echo "O restore foi realizado com sucesso"
    fi
else
    echo "O arquivo não existe!"
fi