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


# Start // $1 é o nome do repositorio passado via paramentro ao chamaer o arquivo no terminal.
# ex.: file.sh repoName
criarRepositorio $1

