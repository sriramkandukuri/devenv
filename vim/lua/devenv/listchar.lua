local lcharset = {
    devenv = {
        eol= '↲',
        tab= '»·',
        space= '␣',
        trail= '-',
        extends= '☛',
        precedes= '☚',
        conceal= '┊',
        nbsp= '☠',
    }
}
local M = {}

M.setlist = function(name)
    if name == nil then
        name = "devenv"
    end
    local lstr="set lcs="
    for k, v in pairs(lcharset[name]) do
        lstr = lstr .. k .. ":" .. v .. ","
    end
    -- print (lstr)
    vim.cmd(lstr)
    vim.cmd("nnoremap <leader>`c :lua require('devenv.listchar').togglelist()<CR>")
end

M.togglelist = function()
    vim.cmd("set list!")
end

return M
