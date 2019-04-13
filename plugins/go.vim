call plug#begin('~/.local/share/nvim/plugged')
  " Colorscheme/theme
  Plug 'morhetz/gruvbox'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " Left side gutter showing modified lines etc
  Plug 'airblade/vim-gitgutter'
  " Language support
  Plug 'sheerun/vim-polyglot' 
  Plug 'editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']
  Plug 'tpope/vim-fugitive'
    let g:fugitive_no_maps = 1
	Plug 'tpope/vim-surround'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
   let g:deoplete#enable_at_startup = 1
  Plug 'junegunn/fzf'
  Plug 'Shougo/denite.nvim'
  " Better searching with regex
  Plug 'haya14busa/incsearch.vim'
  " Adds fuzzy search too
  Plug 'haya14busa/incsearch-fuzzy.vim'
  " Nerdtree
  Plug 'scrooloose/nerdtree'
  " Silver searcher
  Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
  " Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
  Plug 'raimondi/delimitmate'

  Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

