#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2 }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }')
memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F. '{ print $1}')

if [ $memoria_atual_total -gt 50 ]
then
#    mail - s
    echo 'Consumo elevado de memória!'
fi