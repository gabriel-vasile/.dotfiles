call plug#begin('~/.vim/plugged')

" Plug 'flazz/vim-colorschemes'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Plug 'godlygeek/csapprox'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
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
set background=dark " or light if you want light mode
colorscheme gruvbox
set autoread
