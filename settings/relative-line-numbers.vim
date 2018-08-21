" Line Numbers (show relative in current buffer, absolute when not, and
" absolute on selected line)

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained * set relativenumber
  autocmd BufLeave,FocusLost * set norelativenumber
augroup END
