# Todas funções começam com underline
#=====FUNÇÕES======
function _login_interativo(){
    read -rp "Login: " login_usuario
    read -srp $'Senha: \n' login_senha
    read -rp "CPF: " login_cpf
}

function _login_cli(){
    local login_usuario="$2"
    local login_senha="$3"
    local login_cpf="$4"
}

function _verificar_login(){
    if [[ "$login_usuario" = "$usuario" ]] && [[ "$login_senha" = "$senha" ]] && [[ "$login_cpf" = "$cpf" ]]
    then
        echo -e "\nUsuario logado, verificando ambiente..."
        sleep 0.5s
	return 0
    else
        echo -e "\nLogin ou senha incorretos"
	return 1
    fi
}

function _ajuda(){
    echo -e "
        \rlogin.sh [Opção]

        \r-h, --help    Exibe o menu de ajuda
        \r-l, --login   Abre o login interativo
        \r-L            Login por linha de comando [nome] [senha] [CPF]
    "
    exit 0
}

function _menu(){
    clear
    echo -e "
    \r================
    \r#1) Abrir Dillo
    \r#2) Abrir Biblia
    \r#3) Abrir Xterm
    \r#================
    "

    # Pode não funcionar caso não tenha os seguintes programas instalados. a
    # biblia é um script de uma linha que fiz para conseguir abrir ela 
    # rapidamente
    read -rp "Selecione uma opção: " opcao
    case "$opcao" in
        1) surf2 & ;;
        2) biblia & ;;
        3) xterm & ;;
        *) echo "Opção invalida, saindo..."; exit 1 ;;
    esac
}
#==================
