set colorcolumn=100
set cursorline
set cursorcolumn

" Example config in Vim-Script

colorscheme dracula
" let g:material_style = "deep ocean"
" colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""
" Common color scheme settings
"
" use the dark theme
set background=dark
set termguicolors

"""""""""""""""""""""""""""""""""""""""""""""""""
" Dracula customizations.
function SetColors()
    hi DraculaComment ctermfg=75  guifg=#7a7f40
    hi DraculaSubtle ctermbg=235  guibg=#10141d

    hi ColorColumn ctermbg=234 guibg=#383a46
    hi CursorLine ctermbg=234 guibg=#383a46
    hi CursorColumn ctermbg=234 guibg=#383a46
    hi LineNr ctermfg=237 guifg=#8f8faf ctermbg=235 guibg=#282a36
    hi SignColumn ctermfg=237 guifg=#8f8f8f ctermbg=235 guibg=#282a36
    " hi CursorLineNr guibg=#ffe5b9 guifg=#000000
    hi CursorLineNr guibg=#282a36 guifg=yellow
    hi DiffAdd guibg=#4f8f33 guifg=#0f0f0f
    hi DiffChange guibg=#af8700 guifg=#0f0f0f
    hi DiffDelete guibg=#ae0808 guifg=#f0f0f0
    hi Pmenu ctermbg=gray guibg=#5e456e
    hi CocFloating guibg=#4a2661
    hi CocErrorFloat guibg=#8f1c1c
    hi PmenuSel guibg=#a05000
    " hi Normal ctermbg=None  guibg=None ctermfg=None guifg=#282a36
endfunction
let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_inverse = 1
let g:dracula_colorterm = 1
call SetColors()
function SetDiffColors()
    colorscheme gruvbox
    set background=dark
    set termguicolors
    " call SetColors()
    " hi DiffAdd guibg=#0f380f
    " hi DiffChange guibg=#3f2f0f
    " hi DiffDelete guibg=#3f0f0f guifg=#30000f
    :AirlineTheme gruvbox
    " let g:airline_theme='gruvbox'
endfunction
autocmd FileType dirdiff :call SetDiffColors()

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gruvbox customizations

" let g:gruvbox_italic = 1
" let g:gruvbox_improved_warnings = 1
" let g:gruvbox_improved_strings = 1

" let g:airline_theme='dracula'
" let g:airline_theme='gruvbox'
