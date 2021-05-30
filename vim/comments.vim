""VH |Space+//|Comment out current line or visual selection|
nnoremap <leader>// :Commentary<cr>
vnoremap <leader>// :Commentary<cr>
""VH |Space+8|Add doxygen style comments before current line|
nnoremap <leader>8 :Dox<cr>
""VH |Space+`\`|Append line end comments Use only for c style doxygen comments for structure or parameter variables.|
nnoremap <leader>\ :set paste <ESC>:norm A/**<  */<ESC>:set nopaste<ESC><Left><Left><ESC>i

""VH |Space+\<TAB\>|Goto next buffer opened|
map <leader><Tab> :bn<cr>
""VH |Space+Shift+\<TAB\>|Goto previous buffer opened|
map <leader><S-Tab> :bp<cr>


