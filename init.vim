scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" Remap leader key to ,
let g:mapleader=','

" Disable line numbers
set nonumber

" Don't show last command
set noshowcmd

" Yank and paste with the system clipboard
" set clipboard=unnamed
set clipboard=unnamedplus

" Hides buffers instead of closing them
set hidden

" === TAB/Space settings === "
" Insert spaces when TAB is pressed.
set expandtab

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" do not wrap long lines by default
set nowrap

" Don't highlight current cursor line
set nocursorline

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=1

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$', '\.*\~$']

" Open current working dir in nerdtree
nmap .. :e.<CR>
" Open parent dir of file in current buffer in nerdtree
nmap § :e %:h<CR>

" Wrap in try/catch to avoid errors on initial install before plugin is available
try

" === Vim airline ==== "
" Enable extensions
let g:airline_extensions = ['branch', 'hunks']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

" Customize vim airline per filetype
" 'nerdtree'  - Hide nerdtree status line
" 'list'      - Only show file type plus current line number out of total
let g:airline_filetype_overrides = {
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
  \ 'list': [ '%y', '%l/%L'],
  \ }

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry

" === Signify === "
let g:signify_sign_delete = '-'

" Enable true color support
set termguicolors

" Vim airline theme
let g:airline_theme='minimalist'

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Set floating window to be slightly transparent
set winbl=10

" Editor theme
set background=dark
" let colorprofile=$ITERM_PROFILE
" if !empty(colorprofile)
"    set background=colorprofile
" endif

try
  colorscheme solarized8
  " colorscheme OceanicNext
catch
  colorscheme slate
endtry

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "
nnoremap <leader>bb :buffers<cr>:b<space>

" === Nerdtree shorcuts === "
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>N :NERDTreeClose<CR>

noremap <Space> <PageDown>
noremap - <PageUp>

" Quick window switching
" Use alt keys to navigate windows
" In terminal mode
tnoremap ˙ <C-\><C-N><C-w>h
tnoremap ∆ <C-\><C-N><C-w>j
tnoremap ˚ <C-\><C-N><C-w>k
tnoremap ¬ <C-\><C-N><C-w>l
" In normal mode
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

" Quick close buffer with alt-q
nnoremap œ <C-w>q

" Quick open tab with alt-t
nnoremap † :tabnew<CR>

" Quick open split vertical pane
nnoremap √ <C-w>v<C-w>l

" === Search shorcuts === "
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" Clear Highlighting
nmap ,c :noh<CR>

" Use alt + > / alt + < to increase/decrease window width
nnoremap ≥ <C-w>>
nnoremap ≤ <C-w><

" Automatically re-read file if a change was detected outside of vim
set autoread

" Enable line numbers
set number

" Set relative line numbers
set relativenumber

" Enable spellcheck for markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Gwip
command Gwip !git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"
" Gunwip
command Gunwip !git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1

" FZF
nnoremap <C-p> :FZF<CR>

" Python
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" Support for comments in jsonc files
autocmd FileType json syntax match Comment +\/\/.\+$+

" vim wiki use markdown
let g:vimwiki_list = [
      \ {'path': '~/projects/paddle/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/projects/paymentsense/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
      \ {'path': '~/projects/lance/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
      \ ]

" code folding
set foldmethod=syntax
" open files expanded as default
set nofoldenable

" zo opens a fold at the cursor.
" zShift+o opens all folds at the cursor.
" zc closes a fold at the cursor.
" zm increases the foldlevel by one.
" zShift+m closes all open folds.
" zr decreases the foldlevel by one.
" zShift+r decreases the foldlevel to zero -- all folds will be open.

nmap ; :b<SPACE>

" copy over SSH
vnoremap <leader>y :OSCYank<CR>
nmap <leader>y <Plug>OSCYank

" disable vim-go :GoDef short cut (gd)
" this is handled by LSP [LC]
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

" easymotion prefix space
noremap <SPACE> <Plug>(easymotion-prefix)

" Markdown preview options
let g:mkdp_open_to_the_world = 1
let g:mkdp_port = '9879'
