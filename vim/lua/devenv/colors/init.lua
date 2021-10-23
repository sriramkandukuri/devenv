local M = {}

M.colors = {
	selection = "#44475A",
	menu = "#21222C",
	visual = "#3E4452",
	gutter_fg = "#4B5263",
	nontext = "#3B4048",

    bg = "#181a26",
    CurrentLine = "#44475a",
    subtle = "#10141d",
    ruler = "#282a36",
    fg	= "#cfcfcf",
    skyblue = "#6272a4",
    comment = "#7f7f7f",
    cyan = "#8be9fd",
    green = "#50fa7b",
    green1 = "#31b53e",
    orange = "#ffb86c",
    orange1 = "#d4843e",
    orange2 = "#f16529",
    red = "#ff5555",
    pink = "#ff79c6",
    pink1 = "#834f79",
    magenta = "#c678dd",
    yellow = "#f1fa8c",
    aqua = "#3affdb",
    beige = "#f5c06f",
    dblue = "#51afef",
    brown = "#905532",
    darkblue = "#081633",
    blue = "#5fd7ff",
    purple = "#bd93f9",
    salmon = "#ee6e73",
    violet = "#a9a1e1",
    violet1 = "#8f8faf",
    white = "#eff0f1",
    black = "#1b1f2a",
    grey = "#8c979a",
    grey1 = "#3b3f4a",
	bright_red = "#FF6E6E",
	bright_green = "#69FF94",
	bright_yellow = "#FFFFA5",
	bright_blue = "#D6ACFF",
	bright_magenta = "#FF92DF",
	bright_cyan = "#A4FFFF",
	bright_white = "#FFFFFF",
}

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

    -- vim.cmd("colorscheme dracula")
    require('devenv.colors.dracula')
    require("colorizer").setup()

    vim.cmd([[autocmd FileType dirdiff :lua require("devenv.colors").SetDiffColors()<CR>]])
end
return M
