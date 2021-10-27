local nnoremap = require("devenv.utils").nnoremap
local M = {}

function M.SetDiffColors()
    vim.g.colors_name = 'gruvbox'
    vim.o.background = 'dark'
    vim.o.termguicolors = true
end

function M.init()
    vim.wo.colorcolumn = '100'
    vim.wo.cursorline = true
    vim.wo.cursorcolumn = true

    vim.o.background = 'dark'
    vim.o.termguicolors = true

    require('devenv.colors.theme')
    nnoremap( '<F3>',"<cmd>TSHighlightCapturesUnderCursor<CR>")

    vim.cmd([[autocmd FileType dirdiff :lua require("devenv.colors").SetDiffColors()<CR>]])
end

function M.colors()
    local colorscheme = "dracula"
    local palette = require("devenv.colors.palette")
    local mods = require('devenv.colors.mods')

    local retcolors = {}

    local clrs = palette[colorscheme]
    for c, v in pairs(clrs) do
        -- automatically add bright and dark variants of colors to palette
        if c ~= "name" then
            retcolors[c] = v
            retcolors["dark_"..c] = mods.dark(v)
            retcolors["bright_"..c] = mods.light(v)
        end
    end
    return retcolors
end
return M
