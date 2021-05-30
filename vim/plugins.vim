"{{{
" PLUGINS
"
" its a simple plugin manager for vim
"   https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
"Code completers
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

if has('nvim')

"     " Plug 'neovim/nvim-lspconfig'
"     " Plug 'nvim-lua/completion-nvim'
"     " Plug 'nvim-lua/diagnostic-nvim'
"     " Plug 'tjdevries/nlua.nvim'
"     " Plug 'tjdevries/lsp_extensions.nvim'

"     " Neovim Tree shitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/playground'
endif
"dracula themes
"   https://github.com/dracula/vim.git
Plug 'https://github.com/dracula/vim.git', {'as':'dracula'}

" https://github.com/rafi/awesome-vim-colorschemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rainglow/vim', {'as':'rg-colors'}
Plug 'morhetz/gruvbox'
"Vim status line themes
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/vim-airline/vim-airline.git'
" Directory diff plugin aalternative for meld
Plug 'will133/vim-dirdiff'
"Fast file grep from vim command :Rg
Plug 'jremmen/vim-ripgrep'
"Git helpers :Git
"   https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" Some good toggle and paris configutions. help :
Plug 'tpope/vim-unimpaired'
" Better automated and command based autofilling of braces and surround pairs
Plug 'tpope/vim-surround'
" Easy commenting
Plug 'tpope/vim-commentary'
" `.` repeats all plugin actions instead of native commands only
Plug 'tpope/vim-repeat'
" Some additional help to netrw
"   https://github.com/tpope/vim-vinegar
Plug 'tpope/vim-vinegar'
" Some good defaults but overwriting some custome settings. Currently disabled.
" Plug 'tpope/vim-sensible'
" taglist side bar for C/C++
Plug 'yegappan/taglist'

Plug 'preservim/tagbar'

" Copied
Plug 'leafgarland/typescript-vim'
"Beautiful manpages for vim. K or :Man
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'

"Undo tree with good history.
Plug 'mbbill/undotree'

" multi cursor some times very usefull
"   https://github.com/terryma/vim-multiple-cursors
Plug 'terryma/vim-multiple-cursors'

"   https://github.com/junegunn/gv.vim
Plug 'junegunn/gv.vim'
" fzf with ripgrep
"   https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"   https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim'

" Beautiful tables in vim
Plug 'dhruvasagar/vim-table-mode'
" RFC helper for vim
Plug 'mhinz/vim-rfc'

" helper for key mappings
"   https://github.com/liuchengxu/vim-which-key
" Plug 'liuchengxu/vim-which-key'

" helper for quickly go to a word in a line
"   https://github.com/unblevable/quick-scope
Plug 'unblevable/quick-scope'

" Automatic pairing of branckets and quotes
"   https://github.com/jiangmiao/auto-pairs
Plug 'jiangmiao/auto-pairs'

" UML syntax and refresh plugins
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'

" Markdown preview plugin
"   https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" toml plugin used for hugo sites
"   https://github.com/cespare/vim-toml
Plug 'cespare/vim-toml'

Plug 'vim-scripts/DoxygenToolkit.vim'

" Fade inactive buffers
"   https://github.com/TaDaa/vimade
Plug 'TaDaa/vimade'

" Tmux focus events to vim properly
"   https://github.com/tmux-plugins/vim-tmux-focus-events
Plug 'tmux-plugins/vim-tmux-focus-events'

" Some usefull snippets
"   https://github.com/honza/vim-snippets
Plug 'honza/vim-snippets'

" Split single block statements or join multiline statements to single line.
"   https://github.com/AndrewRadev/splitjoin.vim
Plug 'AndrewRadev/splitjoin.vim'

" clang formatting plugin
"   https://github.com/rhysd/vim-clang-format
Plug 'rhysd/vim-clang-format'

" https://github.com/dbeniamine/cheat.sh-vim
Plug 'dbeniamine/cheat.sh-vim'

" Google Plugin for vim
"   https://github.com/szw/vim-g
Plug 'szw/vim-g'

" Cscope helper
Plug 'ronakg/quickr-cscope.vim'

" Format changers and some grammer fixers
" https://github.com/tpope/vim-abolish
Plug 'tpope/vim-abolish'

" uncrustify plugin
"   https://github.com/embear/vim-uncrustify
Plug 'embear/vim-uncrustify'

" Plug 'tpope/vim-sleuth'

" Handle ansi color escases
Plug 'powerman/vim-plugin-AnsiEsc'


call plug#end()
"
"}}}

