#!/bin/bash

CAMINHO_BACKUP=/home/beto/Documentos/Cursos/Fundamentos_de_Programacao/Aulas_de_shell/backup_mutillidae_amazon
cd $CAMINHO_BACKUP
data=$(date +%F)

if [ ! -d $data ]
then
    mkdir $data
fi

tabelas=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
    mysqldump -u root mutillidae $tabela > $CAMINHO_BACKUP/$data/$tabela.sql
done

aws s3 sync $CAMINHO_BACKUP s3://curso_shell_script