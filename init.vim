
" An example for a vimrc file.
"
" To use it, copy it to
"     for Unix:     $HOME/.config/nvim/init.vim
"     for Windows:  %LOCALAPPDATA%\nvim\init.vim

set backup             " keep a backup file (restore to previous version)
set undofile           " keep an undo file (undo changes after closing)
set ruler              " show the cursor position all the time
set showcmd            " display incomplete commands

" VANCE's CONFIG

" Line Numbers (show relative in current buffer, absolute when not, and
" absolute on selected line)
set number relativenumber

"Colors
set background=dark

" VimR specific settings 
"if has("gui_vimr")
" Here goes some VimR specific settings like
"  color xyz
" endif

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
"Prettier
"<Ctrl-l> redraws the screen and removes any search highlighting.
"remap <silent> <C-l> :nohl<CR><C-l>
" autocmd FileType javascript set formatprg=prettier\ --stdin
"Format on save
"autocmd BufWritePre *.js :normal gggqG
"autocmd bufwritepost *.js *.jsx silent !standard --fix %
"set autoread
" REMAP jk TO CAPS LOCK
imap jk <esc>
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" SET LEADER
let g:mapleader = ","
" let @" = expand("%")
" Starts up NERDTREE file explorer
" autocmd vimenter * NERDTree
let NERDTreeShowHidden=1
nmap ,n :NERDTreeFind<CR>
nmap ,N :NERDTreeClose<CR>
call plug#begin('~/.local/share/nvim/plugged')
"	Plug 'tpope/vim-sensible'
  Plug 'mhartington/oceanic-next'
  Plug 'morhetz/gruvbox'
  Plug 'crusoexia/vim-monokai'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'kien/ctrlp.vim'
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
  Plug 'sheerun/vim-polyglot' 
  " Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'ts', 'tsx'] }
  Plug 'mhartington/nvim-typescript'
    let g:nvim_typescript#type_info_on_hold = 1
    let g:nvim_typescript#signature_complete = 1
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  "Plug 'wincent/command-t'
  " Plug 'othree/html5.vim'
  " Plug 'hail2u/vim-css3-syntax'
  Plug 'leshill/vim-json'
  Plug 'ap/vim-css-color'
  Plug 'airblade/vim-gitgutter'
  " Plug 'othree/javascript-libraries-syntax.vim'
  " let g:used_javascript_libs = 'react, vue, d3, chai, underscore'
	Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
    let g:jsx_ext_required = 0
" Reason React 
  " Plug 'reasonml-editor/vim-reason-plus'
	Plug 'mattn/emmet-vim'
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,js,jsx,javascript,javascript.jsx EmmetInstall
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
    let g:javascript_plugin_flow = 1
  Plug 'tpope/vim-fugitive'
  Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ 'tag': 'binary-*-x86_64-apple-darwin'
        \ }

  Plug 'editorconfig/editorconfig-vim'
  " (Optional) Multi-entry selection UI.
  Plug 'junegunn/fzf'
	Plug 'w0rp/ale'
		" let g:ale_fixers = {'javascript': ['prettier_standard'], 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']}
		" let g:ale_linters = {'javascript': ['standard']}
		" let g:ale_fix_on_save = 1

    let g:ale_fixers = { 'typescript': ['trim_whitespace', 'tslint', 'prettier'], 'javascript': ['eslint', 'prettier-eslint'], 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines']}
		let g:ale_linters = {'javascript': ['eslint', 'tslint', 'trim_whitespace']}
		let g:ale_fix_on_save = 0
    let g:ale_completion_enabled = 1
    let g:airline#extensions#ale#enabled = 1
    nmap <silent> <C-k> <Plug>(ale_previous_wrap)
    nmap <silent> <C-j> <Plug>(ale_next_wrap)
	Plug 'tpope/vim-surround'
	" Plug 'whatyouhide/vim-gotham'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
  " Plug 'flowtype/vim-flow'
  Plug 'scrooloose/nerdtree'
  "Plug 'rust-lang/rust.vim'
  Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep'
  Plug 'tpope/vim-rhubarb'
  Plug 'Quramy/vim-js-pretty-template'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

" Required for operations modifying multiple buffers like rename.
set hidden

" let g:LanguageClient_serverCommands = {
    " \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    " \ 'javascript': ['javascript-typescript-stdio'],
 "\ }

    " \ 'reason': ['ocaml-language-server', '--stdio'],
    " \ 'ocaml': ['ocaml-language-server', '--stdio'],
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
" nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
" nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>
set path=.,src
set suffixesadd=.js,.jsx

set showtabline=2 " always show tabs in gvim, but not vim
" set up tab labels with tab number, buffer name, number of windows
function! GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
set guitablabel=%{GuiTabLabel()}

" set up tab tooltips with every buffer name
function! GuiTabToolTip()
  let tip = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  for bufnr in bufnrlist
    " separate buffer entries
    if tip!=''
      let tip .= " \n "
    endif
    " Add name of buffer
    let name=bufname(bufnr)
    if name == ''
      " give a name to no name documents
      if getbufvar(bufnr,'&buftype')=='quickfix'
        let name = '[Quickfix List]'
      else
        let name = '[No Name]'
      endif
    endif
    let tip.=name
    " add modified/modifiable flags
    if getbufvar(bufnr, "&modified")
      let tip .= ' [+]'
    endif
    if getbufvar(bufnr, "&modifiable")==0
      let tip .= ' [-]'
    endif
  endfor
  return tip
endfunction
set guitabtooltip=%{GuiTabToolTip()}

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)

" set rtp+=/Users/vlongwill/.opam/system/share/merlin/vim

" Theme
syntax on
colorscheme OceanicNext
" colorscheme monokai
" colorscheme gruvbox
" let g:airline_theme='molokai'
let g:airline_theme='molokai'

"Sort out tab for standard javascript
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab
set clipboard=unnamed


" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

"End of VANCE's CONFIG

" Don't use Ex mode, use Q for formatting
noremap Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on
syntax on

" Also switch on highlighting the last used search pattern.
set hlsearch

" I like highlighting strings inside C comments.
let c_comment_strings=1

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'textwidth' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
" filetype plugin indent on


"filetype plugin indent on
" Put these in an autocmd group, so that we can delete them easily.
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

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')
"
"let s:opam_configuration = {}

" function! OpamConfOcpIndent()
" execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
  " execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" " let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
" 
" function! OpamConfMerlin()
  " let l:dir = s:opam_share_dir . "/merlin/vim"
  " execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')
" 
" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
  " " Respect package order (merlin should be after ocp-index)
  " if count(s:opam_available_tools, tool) > 0
    " call s:opam_configuration[tool]()
  " endif
" endfor
" " ## end of OPAM user-setup addition for vim / base ## keep this line
" 
