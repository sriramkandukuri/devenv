lua require("devenv")

""VH |Space+Space+g|Search through git files, enter to open selected file|
nnoremap <leader><leader>g :lua require('telescope.builtin').git_files()<CR>
""VH |Space+Space|Search through files, enter to open selected file|
nnoremap <Leader><leader> :lua require('telescope.builtin').find_files()<CR>

""VH |Space+f|Invoke ripgrep|
nnoremap <leader>f :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
""VH |Space+<ENTER>|Search through available buffers and enter to open selected one|
nnoremap <leader><enter> :lua require('telescope.builtin').buffers()<CR>
""VH |Space+vh|Search through available help tags|
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
""VH |Space+vh|Search through devenv files|
nnoremap <leader>dv :lua require('devenv.tscope').search_devenv()<CR>
