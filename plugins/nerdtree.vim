" Starts up NERDTREE file explorer
" autocmd vimenter * NERDTree
"

" augroup nerdtreestartup
"   autocmd!
"   autocmd vimenter * NERDTree | only
" augroup END

" call NERDTreeAddKeyMap({
"         \ 'key': 'yy',
"         \ 'callback': 'NERDTreeYankCurrentNode',
"         \ 'quickhelpText': 'put full path of current node into the default register' })
" 
" function! NERDTreeYankCurrentNode()
"     let n = g:NERDTreeFileNode.GetSelected()
"     if n != {}
"         call setreg('"', n.path.str())
"     endif
" endfunction
