""VH |Space + G|Enter Git status page|
nnoremap <leader>G :Git<CR>
""VH |cc|in fugitive buffer commit the changes
autocmd FileType fugitive          nnoremap <buffer> cc :Git commit -s<CR>
