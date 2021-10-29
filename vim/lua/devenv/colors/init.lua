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
        retcolors[c] = v
        retcolors["dark_"..c] = mods.dark(v, 0.05)
        retcolors["darker_"..c] = mods.dark(v, 0.15)
        retcolors["bright_"..c] = mods.bright(v, 0.05)
        retcolors["brighter_"..c] = mods.bright(v, 0.15)
    end
    return retcolors
end

function M.debugclrs()
    local palette = require("devenv.colors.palette")
    local clrnames = palette["dracula"]
    local clrs = M.colors()
    print("color | darker | dark | orig |bright |brighter ")
    for c, _ in pairs(clrnames) do
        print(c.." | ",
            clrs["darker_"..c].." | ",
            clrs["dark_"..c].." | ",
            clrs[c].." | ",
            clrs["bright_"..c].." | ",
            clrs["brighter_"..c].." | "
            )
    end
end

function M.hslist()
    local cbu = require("colorbuddy.util")

    local s, l = 0.75, 0.6

    for h=0,360,10 do
        local str = cbu.hsl_to_rgb_string(h, s, l)
        print(str)
    end
end

vim.cmd([[
    command! DVCLRS lua require('devenv.colors').debugclrs()<CR>
    command! DCLR Redir DVCLRS | ColorizerToggle
    command! DVHSLST lua require('devenv.colors').hslist()<CR>
    command! HSLST Redir DVHSLST | ColorizerToggle
]])

return M
