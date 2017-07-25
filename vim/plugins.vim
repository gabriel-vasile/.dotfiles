
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

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>

" Toogle on/off
nmap <leader>o :NERDTreeToggle<cr>


"------------------------------------------------------------------------------
" BufExplorer
"------------------------------------------------------------------------------

" Shortcuts, type <leader>l to quickly navigate to necessary buffer
map <leader>l :BufExplorer<cr>
imap <leader>l <esc>:BufExplorer<cr>
vmap <leader>l <esc>:BufExplorer<cr>


"------------------------------------------------------------------------------
" Neocomplete
"------------------------------------------------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1

inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_auto_close_preview = 1


"------------------------------------------------------------------------------
" Better whitespace
"------------------------------------------------------------------------------



"------------------------------------------------------------------------------
" vim-go
"------------------------------------------------------------------------------
let g:go_fmt_command = "goimports"
