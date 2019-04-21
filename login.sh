#!/usr/bin/env bash

#=====BIBLIOTECAS======
source login.conf # Contem os dados do usuário
source lib.sh  # Contem as funções usadas no programa
#======================

#=====COMEÇO======
tentativa="1"
limite="5"

case "$1" in
    -l|--login) 

	# No login interativo enquanto o limite não for atingido o usuário pode
	# tentar fazer o login caso contrario ele sai
	while [[ "$tentativa" -le "$limite" ]] || exit; do
	    echo "Tentativas    $tentativa/$limite"
	    _login_interativo
	    _verificar_login && break 
	    let tentativa++
	done
    ;;

    -L) _login_cli "$@" && _verificar_login ;;
    -h|--help|*) _ajuda ;;
esac

# Após validar o login o menu do usuário é aberto
_menu
#=================
