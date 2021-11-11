local ct = require("devenv.colors.theme")
function FL()
    vim.cmd([[VimadeFadeActive]])
    ct.vimade_focus_lost()
end

function FG()
    vim.cmd([[VimadeUnfadeActive]])
    ct.vimade_focus_gain()
end

vim.g.vimade = {}
vim.g.vimade = vim.tbl_extend('force', vim.g.vimade,
    {
        ["fadelevel"] = 0.5,
        ["enablesigns"] = 1,
        ["enablefocusfading"] = 1,
        ["enablebasegroups"] = 1,
    }
)

vim.cmd ([[
au! FocusLost * :lua FL()
au! FocusGained * :lua FG()
]])
