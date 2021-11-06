" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" Improved motion in Vim
" Plug 'easymotion/vim-easymotion'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" TOML syntax
Plug 'cespare/vim-toml'

" === Git Plugins === "
" Enable git changes to be shown in sign column
" Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" File explorer
Plug 'scrooloose/nerdtree'

" Colorscheme
" Plug 'mhartington/oceanic-next'
Plug 'lifepillar/vim-solarized8'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } 

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'editorconfig/editorconfig-vim'
  let g:EditorConfig_exclude_patterns = ['fugitive://.*']

Plug 'tpope/vim-surround'

Plug 'mileszs/ack.vim'
  let g:ackprg = 'rg --vimgrep'

Plug 'vimwiki/vimwiki'

" terraform syntax + commands
Plug 'hashivim/vim-terraform'

" Plug 'tpope/vim-tbone'

Plug 'ojroques/vim-oscyank', { 'branch': 'main' }

Plug 'tpope/vim-abolish'

call plug#end()
