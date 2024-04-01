"------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------

" General properties

let g:ctrlp_dont_split = 'NERD'

let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1
let NERDTreeShowHidden = 1

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>

" Toogle on/off
nmap <leader>o :NERDTreeToggle<cr>

"------------------------------------------------------------------------------
" CTRLP
"------------------------------------------------------------------------------
let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cmd = 'CtrlPCurWD'

"------------------------------------------------------------------------------
" ale
"------------------------------------------------------------------------------
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'go': ['goimports'],
\}
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
map gd :ALEGoToDefinition<cr>
map gr :ALEFindReferences<cr>

"------------------------------------------------------------------------------
" rust.vim
"------------------------------------------------------------------------------
let g:rustfmt_autosave = 1
nmap <F8> :TagbarToggle<CR>

" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})
