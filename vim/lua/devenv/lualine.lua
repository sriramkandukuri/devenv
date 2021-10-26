local lltheme = require("devenv.colors.lualine")
require('lualine').setup {
    options = {
        -- ... your lualine config
        theme = lltheme,
        component_separators = '|',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = {
            { 'mode', separator = { left = '', right = '' }, right_padding = 2 },
        },
        lualine_c = { "filename", "vim.b.lsp_current_function" },
        lualine_x = { "" },
        lualine_z = {
            { 'location', separator = { right = '', left = '' }, left_padding = 2 },
        },
    },
    extensions={'fugitive','fzf','quickfix','nvim-tree'}
}
