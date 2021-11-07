local ct = require("devenv.colors.theme")
function FL()
    vim.cmd([[VimadeFadeActive]])
    ct.vimade_focus_lost()
end

function FG()
    vim.cmd([[VimadeUnfadeActive]])
    ct.vimade_focus_gain()
end

vim.cmd ([[
let g:vimade = {}
let g:vimade.fadelevel = 0.5
let g:vimade.enablesigns = 1

au! FocusLost * :lua FL()
au! FocusGained * :lua FG()
]])
