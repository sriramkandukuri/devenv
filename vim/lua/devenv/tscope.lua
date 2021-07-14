-- Reference from https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/lua/theprimeagen/telescope.lua
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
    },
    extensions = {
        -- fzy_native = {
            --     override_generic_sorter = false,
            --     override_file_sorter = true,
            -- },
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = false, -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }

    -- require("telescope").load_extension("git_worktree")
    -- require('telescope').load_extension('fzy_native')
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')

    local M = {}

    M.csfiles = function()
        local t=vim.env.VIM_CSF_DIRS
        if t == nil then
            return {}
        end
        return vim.split(t, ' ')
    end

    M.search_devenv = function()
        require("telescope.builtin").find_files({
            prompt_title = "< devenv >",
            search_dirs = {"$HOME/devenv/"},
        })
    end

    -- map(mode, key, lua function to call)
    --
    -- good place to look: telescope.actions (init.lua)
    -- lua function to call:  (gets bufnr, not necessarily needed)
    --   require('telescope.actions.state').get_selected_entry(bufnr)
    --   Actions just take the bufnr and give out information
    --   require('telescope.actions').close(bufnr)
    --
    --   check out telescope.actions for _all the available_ supported
    --   actions.
    --
    --   :h telescope.setup ->
    --   :h telescope.builtin ->
    --   :h telescope.layout ->
    --   :h telescope.actions
    --
    M.git_branches = function()
        require("telescope.builtin").git_branches({
            attach_mappings = function(_, map)
                map('i', '<c-d>', actions.git_delete_branch)
                map('n', '<c-d>', actions.git_delete_branch)
                return true
            end
        })
    end

    return M
