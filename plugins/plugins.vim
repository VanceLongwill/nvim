call plug#begin('~/.local/share/nvim/plugged')
  Plug 'mhartington/oceanic-next'
  " Run test for current file etc
  Plug 'janko-m/vim-test'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kien/ctrlp.vim'
  Plug 'sheerun/vim-polyglot' 
  Plug 'raimondi/delimitmate'
  " Typescript syntax highlighting
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh', 'for': ['typescript', 'typescriptreact', 'ts', 'tsx', 'typescript.tsx'] }
    let g:nvim_typescript#type_info_on_hold = 1
    let g:nvim_typescript#signature_complete = 1
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  Plug 'leshill/vim-json'
  Plug 'ap/vim-css-color'
  Plug 'airblade/vim-gitgutter'
	Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
    let g:jsx_ext_required = 0
	Plug 'mattn/emmet-vim'
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,js,jsx,javascript,javascript.jsx EmmetInstall
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
    let g:javascript_plugin_flow = 1
  Plug 'tpope/vim-fugitive'
    let g:fugitive_no_maps = 1

  Plug 'editorconfig/editorconfig-vim'
    let g:EditorConfig_exclude_patterns = ['fugitive://.*']
  " (Optional) Multi-entry selection UI.
  Plug 'junegunn/fzf'
	Plug 'w0rp/ale'
    let g:ale_fixers = { 
      \'typescript': ['trim_whitespace', 'tslint', 'prettier'],
      \'javascript': ['eslint', 'prettier-eslint'], 
      \'typescriptreact': ['trim_whitespace', 'tslint', 'prettier', 'tsserver'],
      \'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'],
    \}
		let g:ale_linters = {
      \'javascript': ['eslint', 'tslint', 'tsserver', 'trim_whitespace', 'typecheck'],
    \'typescript': ['trim_whitespace', 'tslint', 'tsserver', 'typecheck', 'prettier'], 
    \'typescriptreact': ['trim_whitespace', 'tslint', 'prettier']
  \}
  let g:ale_linter_aliases = {'jsx': 'css', 'tsx': 'css'}
  let g:ale_fix_on_save = 0
  let g:ale_completion_enabled = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#buffer_nr_show = 1
	Plug 'tpope/vim-surround'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
  Plug 'scrooloose/nerdtree'
  Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'Asheq/close-buffers.vim'
call plug#end()
