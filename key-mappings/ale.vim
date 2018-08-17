nmap ,e :ALEEnable<CR>
" Disable ALE
nmap ,d :ALEDisable<CR>
" Autofix
nmap ,f :ALEFix<CR>
" Lint
nmap ,l :ALELint<CR>
" Go to definition in new tab
nmap ,gd :ALEGoToDefinitionInTab<CR>

nmap <silent> gd :ALEGoToDefinition<CR>

" Move between errors and markers
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
