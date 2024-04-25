nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap <leader>o :Neotree toggle float reveal_force_cwd<cr>

"------------------------------------------------------------------------------
" ale
"------------------------------------------------------------------------------
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'go': ['goimports'],
" \}
" let g:ale_fix_on_save = 1
" let g:ale_completion_enabled = 1
" map gd :ALEGoToDefinition<cr>
" map gr :ALEFindReferences<cr>


" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', {
\ '_': ['ale'],
\})

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" List code actions available for the current buffer
nmap <leader>ca  <Plug>(coc-codeaction)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
