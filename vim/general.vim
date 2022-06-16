let mapleader = " "
set hidden
set noerrorbells
set autoread

set nowrap
set smartcase
set noswapfile
set nobackup

set scrolloff=15
set incsearch
set hlsearch

"menu and tab rotate for commandline mode
set wildmenu
set wildignorecase

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

""VH |Space+v+r|Reload vimrc|
nnoremap <Leader>vr :call devenv#save_and_exec()<CR>

""VH |Space+T|Enter timestamp at cursor position|
nmap <Leader>T i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

""VH |Space,g,f|Open file under cursor, create if not exist"
noremap <leader>gf :e <cfile><cr>

" Better split line

set encoding=utf8
set fillchars=vert:│
highlight VertSplit cterm=NONE ctermfg=237 guifg=#5f5f9f ctermbg=NONE

""VH |Space+T|Enter timestamp at cursor position|
nmap <Leader>T i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
"Remember line position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

""{{{
"" ccls nvim inbuild lsp configuration
"" Register ccls C++ lanuage server.
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
""}}}
" Doxygen customizations
let g:DoxygenToolkit_authorName="Sriram.K"

" Show all ctags by default
nnoremap <C-]> g<C-]>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ripgrep plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
    let g:rg_derive_root='true'
endif
let g:sleuth_automatic = 0

""VH |Space+8|Add doxygen style comments before current line|
nnoremap <leader>8 :Dox<cr>
""VH |Space+`\`|Append line end comments Use only for c style doxygen comments for structure or parameter variables.|
nnoremap <leader>\ :set paste <ESC>:norm A/**<  */<ESC>:set nopaste<ESC><Left><Left><ESC>i
" Automatically update copyright notice with current year
command UPDATECOPYRIGHT
  \  exe "g#\\cCOPYRIGHT \\(".strftime("%Y")."\\)\\@![0-9]\\{4\\}\\(-".strftime("%Y")."\\)\\@!#s#\\([0-9]\\{4\\}\\)\\(-[0-9]\\{4\\}\\)\\?#\\1-".strftime("%Y") |
" autocmd BufWritePre *
"   \ if &modified | exe "UPDATECOPYRIGHT" |
"   \ endif
au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=150}
