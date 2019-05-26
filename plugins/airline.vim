let g:airline_extensions = ['branch', 'coc']
" 
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
" 
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
" 
" " Configure error/warning section to use coc.nvim
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
" " Define custom airline symbols
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" 
" " unicode symbols
" let g:airline_left_sep = '❮'
" let g:airline_right_sep = '❯'
" 
" " Don't show git changes to current file in airline
" let g:airline#extensions#hunks#enabled=0
