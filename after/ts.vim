" set filetypes as typescript.jsx

" augroup filetypedetect
"     autocmd!
"     au BufRead,BufNewFile,BufReadPost *.tsx set filetype=typescript
"     au BufRead,BufNewFile,BufReadPost *.tsx setlocal filetype=typescript
"     au BufRead,BufNewFile,BufReadPost *.tsx set syntax=typescript
" 
"     au BufRead,BufNewFile,BufReadPost *.ts set filetype=typescript
"     au BufRead,BufNewFile,BufReadPost *.ts setlocal filetype=typescript
"     au BufRead,BufNewFile,BufReadPost *.ts set syntax=typescriptreact
" augroup END
