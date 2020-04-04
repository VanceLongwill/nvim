" set filetypes as typescript.tsx

augroup tsxfiles
    autocmd!
    au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
augroup END
