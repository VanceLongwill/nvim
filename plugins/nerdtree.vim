" Starts up NERDTREE file explorer
" autocmd vimenter * NERDTree
"

augroup nerdtreestartup
  autocmd!
  autocmd vimenter * NERDTree | only
augroup END
