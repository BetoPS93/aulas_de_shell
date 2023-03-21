#!/bin/bash

caminho_home=/home/beto
cd $caminho_home

if [ ! -d backup ]
then
    mkdir backup
fi

mysqldump -u root $1 > $caminho_home/backup/$1.sql

if [ $? -eq 0 ]
then
    echo 'backup feito!'
else
    echo 'Problema no backup.'
fi

