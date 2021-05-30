" ============================================================================
" QUICK SCOPE {{{
" ============================================================================
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
""VH |Space+q|Toggle quick scope plugin which enables visual marking while using `t` shortcut to go to any position of line|
nmap <leader>q <plug>(QuickScopeToggle)
xmap <leader>q <plug>(QuickScopeToggle)
let g:qs_enable=1
" }}}


