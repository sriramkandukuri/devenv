-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

local packer = require 'packer'
local use = packer.use
packer.startup{function()
    -- PLUGINS
    use 'wbthomason/packer.nvim'

-- ===========================================
-- Color schemes.................
-- ===========================================
-- use 'marko-cerovac/material.nvim'
-- use 'shaunsingh/nord.nvim'

-- use 'EdenEast/nightfox.nvim'
-- use 'ChristianChiarulli/nvcode-color-schemes.vim'
-- use 'Mofiqul/dracula.nvim'
-- use 'sainnhe/sonokai'
--dracula themes
--   https://github.com/dracula/vim.git
    use 'norcalli/nvim-colorizer.lua'
    use {'dracula/vim', as = 'dracula',
        config = function()
            require("devenv.colors").init()
        end
    }

-- https://github.com/rafi/awesome-vim-colorschemes
-- use 'rafi/awesome-vim-colorschemes'
-- use 'morhetz/gruvbox'

    --Code completers
    -- use 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install'}
    -- use 'neoclide/coc.nvim', {'branch': 'release'}

    -- Directory diff plugin aalternative for meld
    --Fast file grep from vim command :Rg
    use {'sriramkandukuri/vim-ripgrep', branch = 'hotfix' }
    --Git helpers :Git
    --   https://github.com/tpope/vim-fugitive
    use 'tpope/vim-fugitive'
    -- Some good toggle and paris configutions. help :
    use 'tpope/vim-unimpaired'
    -- Better automated and command based autofilling of braces and surround pairs
    use 'tpope/vim-surround'
    -- Easy commenting
    -- use 'tpope/vim-commentary'

    use { "nvim-lua/popup.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use {
        "terrortylor/nvim-comment",
        event = "BufRead",
        config = function()
            require("devenv.comment")
        end
    }

    use  { "tamago324/nlsp-settings.nvim" }
    use  { "antoinemadec/FixCursorHold.nvim",
        config = function()
            vim.g.cursorhold_udpatetime = '100'
        end
    } -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
    use { "nvim-lua/lsp-status.nvim",
        config = function()
            require("devenv.lsp.status")
        end
    }
    use { "neovim/nvim-lspconfig",
        config = function()
            require("devenv.lsp")
        end,
    }
    -- Telescope
    use{"nvim-telescope/telescope.nvim",
        config = function()
            require("devenv.tscope")
        end
    }
    use{"nvim-telescope/telescope-fzf-writer.nvim"}
    use{"nvim-telescope/telescope-packer.nvim"}
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use { "nvim-telescope/telescope-hop.nvim" }

    -- Install nvim-cmp, and buffer source as a dependency
    use {
        "hrsh7th/nvim-cmp",
        as = "nvim-cmp",
        config = function()
            require("devenv.completions")
        end,
        requires = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-calc",
            "ray-x/lsp_signature.nvim",
        }
    }
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use {
        "rafamadriz/friendly-snippets",
        -- event = "InsertCharPre",
        -- disable = not lvim.builtin.compe.active,
    }

    -- `.` repeats all plugin actions instead of native commands only
    use 'tpope/vim-repeat'
    -- Some additional help to netrw
    --   https://github.com/tpope/vim-vinegar
    -- use 'tpope/vim-vinegar'
    -- Some good defaults but overwriting some custome settings. Currently disabled.
    -- use 'tpope/vim-sensible'
    -- taglist side bar for C/C++
    -- TODO check lua for below two

    --Beautiful manpages for vim. K or :Man
    use 'vim-utils/vim-man'
    use 'lyuts/vim-rtags'

    --Undo tree with good history.
    use 'mbbill/undotree'

    -- multi cursor some times very usefull
    --   https://github.com/terryma/vim-multiple-cursors
    use 'terryma/vim-multiple-cursors'

    --   https://github.com/junegunn/gv.vim
    use 'junegunn/gv.vim'
    -- fzf with ripgrep
    --   https://github.com/junegunn/fzf
    use { "junegunn/fzf", run = "./install --all" }
    --   https://github.com/junegunn/fzf.vim
    use 'junegunn/fzf.vim'

    -- Beautiful tables in vim
    use 'dhruvasagar/vim-table-mode'
    -- RFC helper for vim
    use 'mhinz/vim-rfc'

    -- helper for key mappings
    --   https://github.com/liuchengxu/vim-which-key
    -- use 'liuchengxu/vim-which-key'

    -- helper for quickly go to a word in a line
    --   https://github.com/unblevable/quick-scope
    use 'unblevable/quick-scope'

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        -- event = "InsertEnter",
        after = "nvim-cmp",
        config = function()
            require("devenv.autopairs")
        end,
    }


    -- UML syntax and refresh plugins
    use 'aklt/plantuml-syntax'
    use 'weirongxu/plantuml-previewer.vim'

    -- Markdown preview plugin
    --   https://github.com/iamcco/markdown-preview.nvim
    use { "iamcco/markdown-preview.nvim", ft = "markdown", run = "cd app && yarn install" }
    -- toml plugin used for hugo sites
    --   https://github.com/cespare/vim-toml
    use 'cespare/vim-toml'

    use 'vim-scripts/DoxygenToolkit.vim'

    -- Fade inactive buffers
    --   https://github.com/TaDaa/vimade
    use 'TaDaa/vimade'

    -- Tmux focus events to vim properly
    --   https://github.com/tmux-plugins/vim-tmux-focus-events
    use 'tmux-plugins/vim-tmux-focus-events'

    -- Some usefull snippets
    --   https://github.com/honza/vim-snippets
    use 'honza/vim-snippets'

    -- Split single block statements or join multiline statements to single line.
    --   https://github.com/AndrewRadev/splitjoin.vim
    use 'AndrewRadev/splitjoin.vim'

    -- clang formatting plugin
    --   https://github.com/rhysd/vim-clang-format
    use 'rhysd/vim-clang-format'

    -- https://github.com/dbeniamine/cheat.sh-vim
    use 'dbeniamine/cheat.sh-vim'

    -- Google Plugin for vim
    --   https://github.com/szw/vim-g
    use 'szw/vim-g'

    -- Cscope helper
    use 'ronakg/quickr-cscope.vim'

    -- Format changers and some grammer fixers
    -- https://github.com/tpope/vim-abolish
    use 'tpope/vim-abolish'

    -- uncrustify plugin
    --   https://github.com/embear/vim-uncrustify
    use 'embear/vim-uncrustify'

    -- use 'tpope/vim-sleuth'

    -- Handle ansi color escases
    use 'powerman/vim-plugin-AnsiEsc'

    use { 'lewis6991/gitsigns.nvim',
        config = function()
            require("devenv.gitsigns")
        end
    }
    use {'kyazdani42/nvim-web-devicons',
        config = function()
            require("devenv.web-devicons")
        end
    }
    use {'akinsho/bufferline.nvim',
        config = function()
            require("devenv.bufline")
        end
    }
    -- use 'tjdevries/colorbuddy.vim'
    -- use 'tjdevries/gruvbuddy.nvim'

    use 'glepnir/lspsaga.nvim'
    --  use 'nvim-lua/completion-nvim'
    --  use 'nvim-lua/diagnostic-nvim'
    --  use 'tjdevries/nlua.nvim'
     use 'nvim-lua/lsp_extensions.nvim'

    --  Neovim Tree sitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = function()
            require("devenv.treesitter")
        end
    }
    use {"nvim-treesitter/playground", requires = "nvim-treesitter/nvim-treesitter"}
    use {"vigoux/architext.nvim",requires = "nvim-treesitter/nvim-treesitter"}

    use {"nvim-treesitter/nvim-treesitter-textobjects", requires = "nvim-treesitter/nvim-treesitter"}
    use {"JoosepAlviste/nvim-ts-context-commentstring", requires = "nvim-treesitter/nvim-treesitter"}
    use {
        "mfussenegger/nvim-ts-hint-textobject",
        requires = "nvim-treesitter/nvim-treesitter",
        config = function()
            vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
            vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
        end,
    }

    use {'shadmansaleh/lualine.nvim',
        config = function()
            require("devenv.lualine")
        end
    }
    use {'kyazdani42/nvim-tree.lua',
        config = function()
            require("devenv.nvimtree")
        end
    }
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'junegunn/vim-easy-align'
    -- use 'junegunn/goyo.vim'
    -- use 'junegunn/limelight.vim'
    use { 'simrat39/symbols-outline.nvim',
        config = function()
            require("devenv.symbols")
        end
    }

    use { 'rcarriga/nvim-notify',
        config = function()
            require("devenv.notify")
        end
    }
    use {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
    }

-- ===========================================
-- Plugins only for vim
-- ===========================================
--Vim status line themes
-- use 'vim-airline/vim-airline-themes'
-- use 'https://github.com/vim-airline/vim-airline.git'
-- Devicons for vim
-- use 'ryanoasis/vim-devicons'
end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}
}

--VH |F5|Refresh plugins|
vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
augroup end
""VH |Function key F5|Refresh all plugins|
command! PUNC PackerSync
nnoremap <F5> :PUNC<CR>
]])
