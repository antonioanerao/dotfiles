### Escutar determinada porta
customNetstat() { sudo netstat -tulpn | grep --color :$@; }
alias eporta='customNetstat'

### Mata um processo com base no nome do programa
kill_process() {
    process_name="$1"
    if [ -z "$process_name" ]; then
        echo "Informe o nome do processo"
    else
        kill -9 "$(pgrep -f "$1")"
    fi
}
alias matar="kill_process $1"

### Adiciona permissões necessárias para rodar um projeto Laravel de forma segura
alias lpermissao="sudo chgrp -R www-data storage bootstrap/cache && sudo chmod -R ug+rwx storage bootstrap/cache"

### Ignora alterações no CHMOD de projetos git (não recomendado para projetos em produção)
alias gchmod="git config core.fileMode false"

### Git log legal
alias glog="git log --decorate --oneline --color --graph"

### Abre o nvim ao invés do vim
alias vim="nvim"

### Atalho para chamar o python3
alias py="python3"
alias python="python3"

### Atalho para fazer um "attach" em sessão específica tmux
alias tmux-s="tmux attach-session -t $1"

### Iniciar steam com placa de vídeo dedicada
alias steam="DRI_PRIME=1 steam"

### Trocar placa de vídeo entre nvidia ou intel
alias nvidia="sudo prime-select nvidia"
alias intel="sudo prime-select intel"


### Atalhos para Laravel

# Artisan
alias a="php artisan"
