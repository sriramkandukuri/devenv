"{{{ Vimade fading level
"
let g:vimade = {}
let g:vimade.fadelevel = 0.5
let g:vimade.enablesigns = 1

function! FL()
    :VimadeFadeActive
    " hi Normal ctermbg=NONE  guibg=NONE
endfunction

function! FG()
    :VimadeUnfadeActive
    " hi Normal ctermbg=NONE  guibg=#181a26
endfunction

au! FocusLost * :call FL()
au! FocusGained * :call FG()
"
"}}}
