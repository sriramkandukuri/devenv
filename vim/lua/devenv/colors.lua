local utils = require("devenv.utils")

local M = {}

function M.SetDiffColors()
    vim.g.colors_name = 'gruvbox'
    vim.o.background = 'dark'
    vim.o.termguicolors = true
end

local devenvcolors = {

    DraculaComment = { fg='#7f7f7f', style = "italic"},
    DraculaSubtle = { bg='#10141d',fg='#10141d'},

    ColorColumn = {bg = "#282a36"},
    CursorLine = {bg = "#282a36"},
    CursorColumn = {bg = "#282a36"},
    LineNr = { fg = "#8f8faf", bg="#1b1f2a" },
    SignColumn = { fg = "#8f8f8f", bg = "#1b1f2a" },
    CursorLineNr = { bg = "#282a36", fg = "#f1fa8c" },
    CocFloating = { bg = "#4a2661" },
    CocErrorFloat = { bg = "#8f1c1c" },
    Pmenu = { bg = "#3b3f4a", fg = '#cfcfcf' },
    PmenuSel = { bg = "#8f8faf", fg = '#403060' , style='bold'},
    Normal = { bg = "#1b1f2a", fg = "#cfcfcf" },
}

function M.init()
    vim.wo.colorcolumn = '100'
    vim.wo.cursorline = true
    vim.wo.cursorcolumn = true

    vim.o.background = 'dark'
    vim.o.termguicolors = true

    vim.g.colors_name = 'dracula'
    vim.cmd("colorscheme dracula")

-- Common color scheme settings
--
    -- use the dark theme

    -- Dracula customizations.
    vim.g.dracula_bold = 1
    vim.g.dracula_italic = 1
    vim.g.dracula_underline = 1
    vim.g.dracula_undercurl = 1
    vim.g.dracula_inverse = 1
    vim.g.dracula_colorterm = 1

    for group, properties in pairs(devenvcolors) do
        utils.hil(group, properties)
    end

    vim.cmd([[autocmd FileType dirdiff :lua require("devenv.colors").SetDiffColors()<CR>]])
    require("colorizer").setup()
end
return M
