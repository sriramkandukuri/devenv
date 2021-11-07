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

    require('devenv.colors.theme').apply()
    require('devenv.focusev')
    nnoremap( '<F3>',"<cmd>TSHighlightCapturesUnderCursor<CR>")
    nnoremap( '<leader>c~',"<cmd>ColorizerToggle<CR>")


    vim.cmd([[autocmd FileType dirdiff :lua require("devenv.colors").SetDiffColors()<CR>]])
end
local colorscheme = "dracula"

function M.colors()
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
    local clrnames = palette[colorscheme]
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

function M.hslist(step, s, l)
    local cbu = require("colorbuddy.util")

    for h=0,359,step do
        local str = cbu.hsl_to_rgb_string(h, s, l)
        print("\""..str.."\"")
    end
end

vim.cmd([[
    command! DVCLRS lua require('devenv.colors').debugclrs()<CR>
    command! DCLR Redir DVCLRS | ColorizerToggle
]])

return M
