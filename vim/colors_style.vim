set colorcolumn=100
set cursorline
set cursorcolumn

colorscheme dracula

""""""""""""""""""""""""""""""""""""""""""""""""""
" Common color scheme settings
"
" use the dark theme
set background=dark
set termguicolors

"""""""""""""""""""""""""""""""""""""""""""""""""
" Dracula customizations.
function SetColors()
    hi ColorColumn ctermbg=234 guibg=#2f2f2f
    hi CursorLine ctermbg=234 guibg=#2f2f2f
    hi CursorColumn ctermbg=234 guibg=#2f2f2f
    hi DraculaComment ctermfg=75  guifg=#7a7f40
    hi LineNr ctermfg=237 guifg=#8f8f8f ctermbg=235 guibg=#2f2f2f
    hi CursorLineNr guibg=#ffe5b9 guifg=#000000
    hi DraculaSubtle ctermbg=235  guibg=#2f2f2f
    hi DiffAdd guibg=#8fff33 guifg=#0f0f0f
    hi DiffChange guibg=#ffb700 guifg=#0f0f0f
    hi DiffDelete guibg=#fe0808 guifg=#f0f0f0
    hi Pmenu ctermbg=gray guibg=#5e456e
    hi CocFloating guibg=#4a2661
    hi CocErrorFloat guibg=#8f1c1c
    hi PmenuSel guibg=#a05000
    hi Normal ctermbg=NONE  guibg=NONE
endfunction
let g:dracula_bold = 1
let g:dracula_italic = 1
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_inverse = 1
let g:dracula_colorterm = 1
call SetColors()
function SetDiffColors()
    colorscheme dracula
    set background=dark
    set termguicolors
    call SetColors()
    hi DiffAdd guibg=#0f380f
    hi DiffChange guibg=#3f2f0f
    hi DiffDelete guibg=#3f0f0f guifg=#30000f
endfunction
autocmd FileType dirdiff :call SetDiffColors()

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gruvbox customizations

let g:gruvbox_italic = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_improved_strings = 1

