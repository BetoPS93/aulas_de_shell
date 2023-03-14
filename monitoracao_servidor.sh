#!/bin/bash

respostaHTTP=$(curl --write-out %{http_code} --silent  --output /dev/null http://localhost)
if [ $respostaHTTP -eq 200 ]
then
    echo "Tudo bem com o servidor."
else
    echo "Houve um problema com o servidor. Tentando reinicializa-lo"
    systemctl restart apache2
    echo "...Servidor reiniciado"
fi