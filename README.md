### Instalador dos meus arquivos dotfiles

<img alt="Neovim" src="nvim-ide.png" width="100%">

<hr>

#### Como rodar

Clone este repositório
  
``` bash
$ git clone https://github.com/antonioanerao/dotfiles.git
```
    
Acesse a pasta do repositório, atribua permissão de execução para o arquivo _install_ e execute-o

``` bash
$ cd dotfile
$ chmod +x install
$ ./install
```

#### LSP a serem instalados

    #PHP
    $ npm install -g intelephense

    # Vue e JS
    $ npm install -g @volar/vue-language-server

    #Json
    $ npm i -g vscode-langservers-extracted

    #Dockerfile
    $ npm install -g @microsoft/compose-language-service
    $ npm install -g dockerfile-language-server-nodejs

* [Lista de LSP disponíveis](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
* Você pode testar minha configuração usando minha imagem docker de teste: https://hub.docker.com/r/antonioanerao/nvim-ide
