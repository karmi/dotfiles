set nocompatible

set background=dark 

" Syntax
syntax enable
syntax on

" Encoding
set encoding=utf8

" Line numbering
set number

" Formatting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set expandtab
set smarttab
set backspace=start,indent
set cinwords=if,else,while,do,for,switch,case
set cindent

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Case only matters with mixed case expressions
set ignorecase
set smartcase

" Show other possibilites at tab completion
set wildmenu

" Maps autocomplete to tab
imap <Tab> <C-N>

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" MacVim
if has("gui_macvim")
  " Fullscreen takes up entire screen
  set fuoptions=maxhorz,maxvert
endif
