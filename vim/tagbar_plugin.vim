" {{{ Tag bar configuration
""VH |FnKey F8|Toggle right side tagbar for all *.c,*.cpp,*.h,*.hpp files|
nmap <F8> :TagbarToggle<CR>
let g:tagbar_show_linenumbers = 2
let g:tagbar_show_data_type = 1
let g:tagbar_sort = 0
" augroup TAGBar
"     autocmd FileType c,cpp,h,hpp :TagbarOpen
" augroup END
" }}}


