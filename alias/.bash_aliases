### Escutar determinada porta
customNetstat() { netstat -tulpn | grep --color :$@; }
alias eporta='customNetstat'

### Adiciona permissões necessárias para rodar um projeto Laravel de forma segura
alias lpermissao="sudo chgrp -R www-data storage bootstrap/cache && sudo chmod -R ug+rwx storage bootstrap/cache"

### Ignora alterações no CHMOD de projetos git (não recomendado para projetos em produção)
alias gchmod="git config core.fileMode false"

### Git log legal
alias glog="git log --decorate --oneline --color --graph"

### Busca quem está ouvindo a porta 80

### Abre o nvim ao invés do vim
alias vim="nvim -S ~/.vimrc"
