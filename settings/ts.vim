" Resolve something.(js|jsx)...
set suffixesadd=.js,.jsx,.tsx,.ts

" set runtimepath+=~/.config/nvim/after/ts.vim

" Sort out tab for standard javascript
" filetype plugin indent on

augroup filetypedetect
    " au BufRead,BufNewFile,BufReadPost *.tsx setlocal filetype=typescript
    "
    " Use typescript NOT typescript.tsx as syntax bc it's currently broken
    au BufRead,BufNewFile,BufReadPost *.tsx setlocal syntax=typescript

    " au BufRead,BufNewFile,BufReadPost *.ts setlocal filetype=typescript
    " au BufRead,BufNewFile,BufReadPost *.ts setlocal syntax=typescript
augroup END
