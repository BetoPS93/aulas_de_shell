#!/bin/bash

if [ ! -d meus_repositorios/ ]
then
    mkdir meus_repositorios/
fi
cd meus_repositorios/

repositorios=$(curl -s https://api.github.com/users/betops93/repos | awk '/ssh_url/{print $2}' | sed 's/^"//g'| sed 's/",$//g')

for repositorio in $repositorios
do
    pasta=$(echo $repositorio | awk -F/ '{print $2}' | awk -F. '{print $1}')
    mkdir $pasta
    cd ./$pasta
    git clone $repositorio
    cd ..
done