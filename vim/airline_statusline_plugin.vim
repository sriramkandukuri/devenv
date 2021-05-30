"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Airline plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
if $USE_PWR_FONTS == 1
    let g:airline_powerline_fonts = 1
endif
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.dirty=' !'
let g:airline_symbols.whitespace = ''


