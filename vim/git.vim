""VH |GG|Enter Git status page|
nnoremap GG :Git<CR>
""VH |cc|in fugitive buffer commit the changes
autocmd FileType fugitive          nnoremap <buffer> cc :Git commit -s<CR>
