

" ###########################
" ##   Vim configuration   ##
" ###########################

runtime! debian.vim     " Properly set various options to work with packages on debian
set nocompatible        " Compatibility with Vi
setlocal spelllang=fr

" Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif      

" Load indentation rules and plugins according to detected filetype
filetype plugin indent on 

" Editor option
set showcmd             " Show command in status line
set showmatch           " Show matching brackets.
set number              " Enable numbers in front of lines
set mouse=a             " Enable mouse usage (all modes)
set autoindent          " Automatic indentation
set shiftwidth=4        " Set tab width to 4 characters
set expandtab           " Replace tab character by spaces

" Search
set incsearch           " Incremental search
set hlsearch            " Enable highlighted words in incremental search.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching

" Stuff
set autowrite           " Automatically save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned
set scrolloff=2         " Set visible lines over or under the block
set noswapfile
set tabstop=4
set linebreak
set autochdir           " Changer automatiquement de répertoire de travail.

" Syntax highlighting
syntax on               " Syntax highlighting
set background=dark     " If using dark background
colorscheme elflord     " Color theme

" Set encoding to UTF8
set encoding=utf-8

" Fix backspace key
" fixdel

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

