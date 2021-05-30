"{{{ Vimade fading level
"
let g:vimade = {}
let g:vimade.fadelevel = 0.6
let g:vimade.enablesigns = 1
au! FocusLost * VimadeFadeActive
au! FocusGained * VimadeUnfadeActive
"
"}}}


