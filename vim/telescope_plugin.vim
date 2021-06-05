lua require("devenv")

""VH |Space+Space+tg|Search through git files, enter to open selected file|
nnoremap <leader><leader>tg :lua require('telescope.builtin').git_files()<CR>
""VH |Space+Space+t|Search through files, enter to open selected file|
nnoremap <Leader><leader>t :lua require('telescope.builtin').find_files()<CR>

""VH |Space+tf|Invoke ripgrep|
nnoremap <leader>tf :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
""VH |Space+t+<ENTER>|Search through available buffers and enter to open selected one|
nnoremap <leader>t<enter> :lua require('telescope.builtin').buffers()<CR>
""VH |Space+tvh|Search through available help tags|
nnoremap <leader>tvh :lua require('telescope.builtin').help_tags()<CR>
""VH |Space+tvh|Search through devenv files|
nnoremap <leader>tdv :lua require('devenv.tscope').search_devenv()<CR>
