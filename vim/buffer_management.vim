
" {{{ Buffer management
""VH |Ctrl+w|Close opened current buffer|
nnoremap <C-w> :bd!<cr>

""VH |Ctrl+s|Save file and go to Normal mode|
noremap <C-s> :w<cr>
inoremap <C-s> <ESC>:w<cr>
""VH |Ctrl+Alt+s|Save all files opened and go to Normal mode|
noremap <C-M-s> :wa<cr>
inoremap <C-M-s> <ESC>:wa<cr>

""VH |Ctrl+Enter|Save file and be in current mode|
inoremap <M-Enter> <C-o>:w<cr>

""VH |Ctrl+q|quit all files opened|
noremap <C-q> :qa!<cr>
inoremap <C-q> <C-o>:qa!<cr>

" }}}

