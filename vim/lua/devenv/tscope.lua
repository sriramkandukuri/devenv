-- Reference from https://github.com/awesome-streamers/awesome-streamerrc/blob/master/ThePrimeagen/lua/theprimeagen/telescope.lua
local actions = require('telescope.actions')
local action_state = require "telescope.actions.state"
local themes = require "telescope.themes"
local utils = require("devenv.utils")

local set_prompt_to_entry_value = function(prompt_bufnr)
  local entry = action_state.get_selected_entry()
  if not entry or not type(entry) == "table" then
    return
  end

  action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

require('telescope').setup {
    defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        winblend = 0,
        selection_strategy = "reset",
        sorting_strategy = "descending",

        layout_strategy = "horizontal",
        layout_config = {
            width = 0.95,
            height = 0.85,
            -- preview_cutoff = 120,
            -- prompt_position = "top",

            horizontal = {
                preview_width = function(_, cols, _)
                    if cols > 200 then
                        return math.floor(cols * 0.4)
                    else
                        return math.floor(cols * 0.6)
                    end
                end,
            },

            vertical = {
                width = 0.9,
                height = 0.95,
                preview_height = 0.5,
            },

            flex = {
                horizontal = {
                    preview_width = 0.9,
                },
            },
        },

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-n>"] = "move_selection_next",

                ["<C-y>"] = set_prompt_to_entry_value,

                ["<C-space>"] = function(prompt_bufnr)
                    local opts = {
                        callback = actions.toggle_selection,
                        loop_callback = actions.send_selected_to_qflist,
                    }
                    require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
                end,
            },
        },

        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,

        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    },
    extensions = {
        hop = {
            -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
            keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }, -- ... and more

            -- Highlight groups to link to signs and lines; the below configuration refers to demo
            -- sign_hl typically only defines foreground to possibly be combined with line_hl
            sign_hl = { "WarningMsg", "Title" },

            -- optional, typically a table of two highlight groups that are alternated between
            line_hl = { "CursorLine", "Normal" },

            -- options specific to `hop_loop`
            -- true temporarily disables Telescope selection highlighting
            clear_selection_hl = false,
            -- highlight hopped to entry with telescope selection highlight
            -- note: mutually exclusive with `clear_selection_hl`
            trace_entry = true,
            -- jump to entry where hoop loop was started from
            reset_selection = true,
        },
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

function M.lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require("telescope.builtin").lsp_code_actions(opts)
end

--VH |Space+Space|Search through git files, enter to open selected file|
--VH |Space+g+f|Search through files, enter to open selected file|
--VH |Space+f|Search files having current word|
--VH |Space+fl|Invoke ripgrep|
--VH |Space+<ENTER>|Search through available buffers and enter to open selected one|
--VH |Spacevh|Search through available help tags|
--VH |Spacedv|Search through devenv files|
local nnoremap = require("devenv.utils").nnoremap

nnoremap( '<leader><leader>',"<cmd>lua require('telescope.builtin').find_files( {search_dirs = require('devenv.tscope').csfiles() } )<CR>")
nnoremap( '<Leader>gf',"<cmd>lua require('telescope.builtin').git_files( {search_dirs = require('devenv.tscope').csfiles() } )<CR>")
nnoremap( '<leader>f',       "<cmd>lua require('telescope.builtin').grep_string( { search = vim.fn.expand('<cword>'), search_dirs = require('devenv.tscope').csfiles() } )<CR>")
nnoremap( '<leader>gl',      "<cmd>lua require('telescope.builtin').live_grep( { search_dirs = require('devenv.tscope').csfiles() } )<CR>")
nnoremap( '<leader><enter>', "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap( '<leader>vh',      "<cmd>lua require('telescope.builtin').help_tags()<CR>")
nnoremap( '<leader>dv',      "<cmd>lua require('devenv.tscope').search_devenv()<CR>")
nnoremap( '<leader>ca',      "<cmd>lua require('devenv.tscope').lsp_code_actions()<CR>")
return M
