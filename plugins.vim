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
Plug 'easymotion/vim-easymotion'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" TOML syntax
Plug 'cespare/vim-toml'

" === Git Plugins === "
" Enable git changes to be shown in sign column
" Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'

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

Plug 'neovim/nvim-lspconfig'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }  " We recommend updating the parsers on update

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Telescopr + deps
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'

" Plug 'williamboman/nvim-lsp-installer'

Plug 'windwp/nvim-autopairs'

" Plug 'github/copilot.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


call plug#end()
