scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

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

" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" Wrap in try/catch to avoid errors on initial install before plugin is available
" try
" " === Denite setup ==="
" " Use ripgrep for searching current directory for files
" " By default, ripgrep will respect rules in .gitignore
" "   --files: Print each file that would be searched (but don't search)
" "   --glob:  Include or exclues files for searching that match the given glob
" "            (aka ignore .git files)
" "
" call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
"
" " Use ripgrep in place of "grep"
" call denite#custom#var('grep', 'command', ['rg'])
"
" " Custom options for ripgrep
" "   --vimgrep:  Show results with every match on it's own line
" "   --hidden:   Search hidden directories and files
" "   --heading:  Show the file name above clusters of matches from each file
" "   --S:        Search case insensitively if the pattern is all lowercase
" call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])
"
" " Recommended defaults for ripgrep via Denite docs
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
"
" " Remove date from buffer list
" call denite#custom#var('buffer', 'date_format', '')
"
" " Custom options for Denite
" "   auto_resize             - Auto resize the Denite window height automatically.
" "   prompt                  - Customize denite prompt
" "   direction               - Specify Denite window direction as directly below current pane
" "   winminheight            - Specify min height for Denite window
" "   highlight_mode_insert   - Specify h1-CursorLine in insert mode
" "   prompt_highlight        - Specify color of prompt
" "   highlight_matched_char  - Matched characters highlight
" "   highlight_matched_range - matched range highlight
" let s:denite_options = {'default' : {
" \ 'split': 'floating',
" \ 'start_filter': 1,
" \ 'auto_resize': 1,
" \ 'source_names': 'short',
" \ 'prompt': 'λ ',
" \ 'highlight_matched_char': 'QuickFixLine',
" \ 'highlight_matched_range': 'Visual',
" \ 'highlight_window_background': 'Visual',
" \ 'highlight_filter_background': 'DiffAdd',
" \ 'winrow': 1,
" \ 'vertical_preview': 1
" \ }}
"
" " Loop through denite options and enable them
" function! s:profile(opts) abort
"   for l:fname in keys(a:opts)
"     for l:dopt in keys(a:opts[l:fname])
"       call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
"     endfor
"   endfor
" endfunction
"
" call s:profile(s:denite_options)
" catch
"   echo 'Denite not installed. It should work after running :PlugInstall'
" endtry
"
" call denite#custom#map('insert', '∆', '<denite:move_to_next_line>', 'noremap')
" call denite#custom#map('insert', '˚', '<denite:move_to_previous_line>', 'noremap')

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" === NeoSnippet === "
" Map <C-k> as shortcut to activate snippet if available
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)

" Load custom snippets from snippets folder
" let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" Hide conceal markers
" let g:neosnippet#enable_conceal_markers = 0

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
let g:airline_extensions = ['branch', 'hunks', 'coc']

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

" === echodoc === "
" Enable echodoc on startup
" let g:echodoc#enable_at_startup = 1

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

" === Signify === "
let g:signify_sign_delete = '-'

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

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

" ============================================================================ "
" ===                      CUSTOM COLORSCHEME CHANGES                      === "
" ============================================================================ "
"
" Add custom highlights in method that is executed every time a colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for details
function! TrailingSpaceHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

autocmd! ColorScheme * call TrailingSpaceHighlights()

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

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

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
" nmap ; :Denite buffer<CR>
" nmap <C-p> :DeniteProjectDir file/rec<CR>
" nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
" nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>
"
" " Define mappings while in 'filter' mode
" "   <C-o>         - Switch to normal mode inside of search results
" "   <Esc>         - Exit denite window in any mode
" "   <CR>          - Open currently selected file in any mode
" "   <C-t>         - Open currently selected file in a new tab
" "   <C-v>         - Open currently selected file a vertical split
" "   <C-h>         - Open currently selected file in a horizontal split
" autocmd FileType denite-filter call s:denite_filter_my_settings()
" function! s:denite_filter_my_settings() abort
"   imap <silent><buffer> <C-o>
"   \ <Plug>(denite_filter_quit)
"   inoremap <silent><buffer><expr> <Esc>
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> <Esc>
"   \ denite#do_map('quit')
"   inoremap <silent><buffer><expr> <CR>
"   \ denite#do_map('do_action')
"   inoremap <silent><buffer><expr> <C-t>
"   \ denite#do_map('do_action', 'tabopen')
"   inoremap <silent><buffer><expr> <C-v>
"   \ denite#do_map('do_action', 'vsplit')
"   inoremap <silent><buffer><expr> <C-h>
"   \ denite#do_map('do_action', 'split')
" endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR>
"   \ denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> q
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> <Esc>
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> d
"   \ denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p
"   \ denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> i
"   \ denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <C-o>
"   \ denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <C-t>
"   \ denite#do_map('do_action', 'tabopen')
"   nnoremap <silent><buffer><expr> <C-v>
"   \ denite#do_map('do_action', 'vsplit')
"   nnoremap <silent><buffer><expr> <C-h>
"   \ denite#do_map('do_action', 'split')
" endfunction

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeFind<CR>
nmap <leader>N :NERDTreeClose<CR>
" nmap <leader>f :NERDTreeFind<CR>



"   <Space> - PageDown
"   -       - PageUp
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

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
" nmap <leader>y :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
" map <leader>w <Plug>(easymotion-bd-w)

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Clear Highlighting
nmap ,c :noh<CR>

" Use alt + > / alt + < to increase/decrease window width
nnoremap ≥ <C-w>>
nnoremap ≤ <C-w><

" === Search === "
" ignore case when searching
" set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
" set smartcase

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


" set filetypes as typescript.tsx
" augroup tsxfiles
"     autocmd!
"     au BufRead,BufNewFile *.tsx set filetype=typescript.tsx
" augroup END

" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Git status
nmap <leader>gst :Gstatus<CR>

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

source ~/.config/nvim/coc.vim

nmap ; :b<SPACE>

" Some plugin is remapping y to y$, this prevents it
nnoremap Y Y

"vnoremap <leader>y :OSCYank<CR>
nmap <leader>y <Plug>OSCYank

" Go

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

" easymotion prefix space
noremap <SPACE> <Plug>(easymotion-prefix)
" https://github.com/neoclide/coc.nvim/issues/856
if $NVM_BIN != ""
  let g:coc_node_path = '$NVM_BIN/node'
endif

nnoremap <leader>gr :GoReferrers<CR>

let g:mkdp_open_to_the_world = 1
let g:mkdp_port = '9879'
