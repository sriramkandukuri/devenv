lua require("devenv")

""VH |Space+t+Space+g|Search through git files, enter to open selected file|
nnoremap <leader>tg :lua require('telescope.builtin').git_files( {search_dirs = require('devenv.tscope').csfiles() } )<CR>
""VH |Space+t+Space|Search through files, enter to open selected file|
nnoremap <Leader>t<leader> :lua require('telescope.builtin').find_files( {search_dirs = require('devenv.tscope').csfiles() } )<CR>

""VH |Space+tf|Invoke ripgrep|
nnoremap <leader>tf :lua require('telescope.builtin').grep_string( { search = vim.fn.expand("<cword>"), search_dirs = require('devenv.tscope').csfiles() } )<CR>
nnoremap <leader>tl :lua require('telescope.builtin').live_grep( { search_dirs = require('devenv.tscope').csfiles() } )<CR>
""VH |Space+t+<ENTER>|Search through available buffers and enter to open selected one|
nnoremap <leader>t<enter> :lua require('telescope.builtin').buffers()<CR>
""VH |Space+tvh|Search through available help tags|
nnoremap <leader>tvh :lua require('telescope.builtin').help_tags()<CR>
""VH |Space+tdv|Search through devenv files|
nnoremap <leader>tdv :lua require('devenv.tscope').search_devenv()<CR>
