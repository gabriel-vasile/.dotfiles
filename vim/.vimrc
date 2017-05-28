call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree',
Plug 'fatih/vim-go'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/csapprox'

call plug#end()

set nocp
set history=700
set clipboard=unamedplus
set autoread
let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 1

filetype plugin on
filetype indent on

let mapleader = ","
let g:mapleader = ","

" Fast saving
map <Leader>w :w<CR>
imap <Leader>w <ESC>:w<CR>
vmap <Leader>w <ESC><ESC>:w<CR>

" Exit insert with jj
inoremap jj <esc>
nnoremap JJJJ <nop>

" Center the cursor
set so=999

" Ruler
set colorcolumn=80,120

set wildmenu
set ruler
set number
set showcmd
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set nowrap
set textwidth=0 wrapmargin=0

" Use mouse
if has('mouse')
	set mouse=a
endif

set infercase
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

set encoding=utf8

set t_Co=256
syntax on
source ~/.vim/plugins.vim
colorscheme foursee
