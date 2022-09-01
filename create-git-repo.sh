#!/bin/bash


function criar() {            
    payload='{"name": "", "private": true}'
    payload=$(echo "$payload" | jq --arg cmd "$1" '.name = $cmd')
    curl -X POST -H "Accept: application/vnd.github+json" -H "Authorization: token <TOKEN>" https://api.github.com/user/repos -d "$payload"
    
}

function criarRepositorio() {
    echo "Criando repositório $1..."
    
    val=$(criar $1)
    echo "$val"
}

function deletarRepositorio() {
    echo "Deletando repositório $1..."
    curl -X DELETE -H "Accept: application/vnd.github+json" -H 'Authorization: token <TOKEN>' https://api.github.com/repos/AndreDrummer/$1
}



# $1 é o nome do repositorio passado via paramentro ao chamar o arquivo no terminal. Ex.: file.sh repoName

# Start - Descomente a função que quer utilizar. Futuramente isso pode ser melhorado programaticamente.
# criarRepositorio $1
# deletarRepositorio $1

