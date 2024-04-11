call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree',
Plug 'dense-analysis/ale'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'kien/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/csapprox'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'rust-lang/rust.vim'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

set digraph
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

" :w!! to save a readonly file
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

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
