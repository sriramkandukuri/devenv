"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"split window movement mappings
""VH |Space+h|Goto left window|
nnoremap <leader>h :wincmd h<CR>
""VH |Space+j|Goto below window|
nnoremap <leader>j :wincmd j<CR>
""VH |Space+k|Goto above window|
nnoremap <leader>k :wincmd k<CR>
""VH |Space+l|Goto right window|
nnoremap <leader>l :wincmd l<CR>
""VH |Space+`+`|Increase vertical width of window by 5 points|
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
""VH |Space+`-`|Decrease vertical width of window by 5 points|
nnoremap <silent> <Leader>- :vertical resize -5<CR>

""VH |Space+\<TAB\>|Goto next buffer opened|
map <leader><Tab> :bn<cr>
""VH |Space+Shift+\<TAB\>|Goto previous buffer opened|
map <leader><S-Tab> :bp<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

