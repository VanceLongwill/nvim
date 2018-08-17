call plug#begin('~/.local/share/nvim/plugged')
  " Colorscheme/theme
  Plug 'mhartington/oceanic-next'
  " Run test for current file etc
  Plug 'janko-m/vim-test'
  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Fuzzy file/buffer search
  Plug 'kien/ctrlp.vim'
  " Language support
  Plug 'sheerun/vim-polyglot' 
  " Bracket autocompletion
  Plug 'raimondi/delimitmate'
  " Typescript syntax highlighting
  Plug 'HerringtonDarkholme/yats.vim'
  " Typescript IDE features
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh', 'for': ['typescript', 'typescriptreact', 'ts', 'tsx', 'typescript.tsx'] }
    let g:nvim_typescript#type_info_on_hold = 1
    let g:nvim_typescript#signature_complete = 1
  " Tern
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  " JSON formatting
  Plug 'leshill/vim-json'
  " Highlight color codes
  Plug 'ap/vim-css-color'
  " Left side gutter showing modified lines etc
  Plug 'airblade/vim-gitgutter'
  " Emmet
	Plug 'mattn/emmet-vim'
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,js,jsx,javascript,javascript.jsx,tsx,typescript,typescriptreact,ts EmmetInstall
    " Javascript syntax
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
    " let g:javascript_plugin_flow = 1
    " Git plugin
  Plug 'tpope/vim-fugitive'
    let g:fugitive_no_maps = 1

    " EditorConfig
  Plug 'editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']
  " (Optional) Multi-entry selection UI.
  " Fuzzy finder dependency for LanguageClient-neovim
  Plug 'junegunn/fzf'

  " Linting
	Plug 'w0rp/ale'
  " Show errors
  " Manipulate brackets/tags/punctuation surrounding text
	Plug 'tpope/vim-surround'
  " Aync autocompletion
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1

  " Nerdtree
  Plug 'scrooloose/nerdtree'
  " Silver searcher
  Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep'
  " Highlight template strings contents in other FileType syntax rule
  Plug 'Quramy/vim-js-pretty-template'
  " Clear up hidden buffers
  Plug 'Asheq/close-buffers.vim'

  " LanguageClient (including tsserver)
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

  " FZF Unite all interfaces
  Plug 'Shougo/denite.nvim'
call plug#end()
