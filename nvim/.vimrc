set number
set noswapfile
set hlsearch 
set ignorecase
set incsearch
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set showmatch
set encoding=UTF-8

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'shawncplus/phpcomplete.vim'
Plug 'ryanoasis/vim-devicons'
call plug#end()
