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
" Plug 'elixir-lang/vim-elixir'
" Plug 'slashmili/alchemist.vim'
Plug 'shougo/neocomplete.vim'
Plug 'Shougo/echodoc.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set shortmess+=A
set noswapfile
set nocp
set history=700
set autoread
set cursorline
au CursorHold * checktime


let mapleader = ","
let g:mapleader = ","

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Fast saving
map <Leader>w :StripWhitespace<CR>:w<CR>
imap <Leader>w <ESC>:StripWhitespace<CR>:w<CR>
vmap <Leader>w <ESC><ESC>:StripWhitespace<CR>:w<CR>

" Don't yank and paste
xnoremap p pgvy

" Exit insert with jj
inoremap jj <esc>
nnoremap JJJJ <nop>

" Preserve selection after indenting
vnoremap < <gv
vnoremap > >gv

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
set clipboard=unnamedplus
set t_Co=256
syntax on
source ~/.vim/plugins.vim
colorscheme foursee
set autoread
