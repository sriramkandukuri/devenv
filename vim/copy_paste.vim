set mouse=a
set number
set relativenumber

""VH |FnKey F9|Toggle mouse
map <F9> <ESC>:exec &mouse!="" ? "set mouse=" : "set mouse=a"<CR>
""VH |Shift+FnKey F9|Toggle mouse and number sign columns this is usefull for copying using mouse selection
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=yes
        let b:signcolumn_on=1
    endif
endfunction
function ToggleNUSCL()
    set rnu!
    set nu!
    call ToggleSignColumn()
endfunction
function ToggleMouseCopying()
    if &mouse != ""
        set mouse=
    else
        set mouse=a
    endif

    set rnu!
    set nu!
    call ToggleSignColumn()
endfunction
noremap <S-F9> :call ToggleMouseCopying()<CR>
noremap <F21> :call ToggleMouseCopying()<CR>
""VH |Ctrl + FnKey F9|Toggle number and sign columns without changing mouse state
noremap <C-F9> :call ToggleNUSCL()<CR>
noremap <F33> :call ToggleNUSCL()<CR>
" noremap <F33> :call ToggleNUSCL()<CR>
function! g:ToggleNuMode()
    if(&relativenumber == 1)
        set number
        set norelativenumber
    else
        set number
        set relativenumber
    endif
endfunc

""VH |Ctrl + l|Toggle line number format from relative to absolute and vice versa
noremap <C-l> :call g:ToggleNuMode()<CR>

"File base clipboard
""VH |Space+y|Copy selected text to some temporary file, use this for copy pasting between files opened in different shells|
vmap <leader>y :w! /tmp/vitmp<CR>
""VH |Space+p|Paste copied(using Space+y) text, use this for copy pasting between files opened in different shells|
nmap <leader>p :r! cat /tmp/vitmp<CR>

""VH |Space+d|Delete a selection or line to black hole buffer so that it wont stored in clipboard
nmap <leader>d "_dd
vmap <leader>d "_d

set clipboard=unnamedplus
"set clipboard=exclude:.*
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

