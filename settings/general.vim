set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands
" Required for operations modifying multiple buffers like rename.
set hidden
" Resolves ./ or ./src
set path=.,src

" use osx clipboard as default register
set clipboard=unnamed

" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab


" Switch syntax highlighting on
syntax on

" Also switch on highlighting the last used search pattern.
set hlsearch

augroup vimrcEx
  autocmd!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

autocmd FileType markdown setlocal wrap linebreak nolist textwidth=0 wrapmargin=0

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

let g:python_host_prog = '/Users/vancelongwill/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/vancelongwill/.pyenv/versions/neovim3/bin/python'

" Helps with hang on escape
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Support for comments in jsonc files
autocmd FileType json syntax match Comment +\/\/.\+$+
