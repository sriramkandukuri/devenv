vim.cmd([[
call cyclist#add_listchar_option_set('devenv', {
        \ 'eol': '↲',
        \ 'tab': '»·',
        \ 'space': '␣',
        \ 'trail': '-',
        \ 'extends': '☛',
        \ 'precedes': '☚',
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ })
call cyclist#add_listchar_option_set('default', {})
call cyclist#activate_listchars('devenv')

""VH |Space+`c|Toggle list chars for invisible characters like tabs spaces etc...|
nnoremap <leader>`c :call cyclist#next_listchar()<CR>
]])
