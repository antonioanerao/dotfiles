### Escutar determinada porta
customNetstat() { sudo netstat -tulpn | grep --color :$@; }
alias eporta='customNetstat'

### Adiciona permissões necessárias para rodar um projeto Laravel de forma segura
alias lpermissao="sudo chgrp -R www-data storage bootstrap/cache && sudo chmod -R ug+rwx storage bootstrap/cache"

### Ignora alterações no CHMOD de projetos git (não recomendado para projetos em produção)
alias gchmod="git config core.fileMode false"

### Git log legal
alias glog="git log --decorate --oneline --color --graph"

### Abre o nvim ao invés do vim
alias vim="nvim"

### Fecha PHPSTORM
alias kphpstorm="kill -9 $(pgrep -f phpstorm)"

alias py="python3"
alias python="python3"
