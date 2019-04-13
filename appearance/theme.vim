" TODO: remove this  as theme overrides?
set background=dark

" VimR specific settings 
"if has("gui_vimr")
" Here goes some VimR specific settings like
"  color xyz
" endif

if (has("termguicolors"))
 set termguicolors
endif


" Theme
syntax on
" colorscheme OceanicNext
" colorscheme monokai
colorscheme gruvbox
" let g:airline_theme='molokai'
let g:airline_theme='gruvbox'
