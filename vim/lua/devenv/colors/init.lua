local nnoremap = require("devenv.utils").nnoremap
local M = {}

M.colors = require("devenv.colors.palette").dracula

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
return M
