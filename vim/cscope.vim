"{{{ cscope shortcuts
"
let g:quickr_cscope_keymaps = 0
let g:quickr_cscope_use_qf_g = 1

" let g:quickr_cscope_debug_mode = 1

""VH |Space+c+o|Connect to cscope db using already existing cscope.out file
nnoremap <Leader>co :cs a cscope.out<CR>

""VH |Space+c+s|cscope Find this C symbol
nmap <Leader>cs <plug>(quickr_cscope_symbols)
vmap <Leader>cs <plug>(quickr_cscope_symbols)
""VH |Space+c+d|cscope Find global definition
nmap <Leader>cd <plug>(quickr_cscope_global)
vmap <Leader>cd <plug>(quickr_cscope_global)
""VH |Space+c+c+b|cscope Find functions called by this function
nmap <Leader>ccb <plug>(quickr_cscope_functions)
vmap <Leader>ccb <plug>(quickr_cscope_functions)
""VH |Space+c+c|cscope Find functions calling this function
nmap <Leader>cc <plug>(quickr_cscope_callers)
vmap <Leader>cc <plug>(quickr_cscope_callers)
""VH |Space+c+t|cscope Find this text string
nmap <Leader>ct <plug>(quickr_cscope_text)
vmap <Leader>ct <plug>(quickr_cscope_text)
""VH |Space+c+e|cscope Find this egrep pattern
nmap <Leader>ce <plug>(quickr_cscope_egrep)
vmap <Leader>ce <plug>(quickr_cscope_egrep)
""VH |Space+c+f|cscope Find this file
nmap <Leader>cf <plug>(quickr_cscope_files)
vmap <Leader>cf <plug>(quickr_cscope_files)
""VH |Space+c+i|cscope Find files #including this file
nmap <Leader>ci <plug>(quickr_cscope_includes)
vmap <Leader>ci <plug>(quickr_cscope_includes)
""VH |Space+c+a|cscope Find assignments of a variable this file
nmap <Leader>ca <plug>(quickr_cscope_assignments)
vmap <Leader>ca <plug>(quickr_cscope_assignments)

" Setting project specific ctags
if $VIM_CSF_DIRS != ""
    :set tags=$PWD/tags
endif

"}}}


