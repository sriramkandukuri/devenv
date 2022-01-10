local ts = require("telescope.builtin")
local tr = require("trouble")

local tsshow = function(cmd)
    return ts.quickfix()
end
local trshow = function(cmd)
    return tr.open("quickfix")
end

local show = function(cmd)
    local mode = "ts"
    if mode == "ts" then
        tsshow(cmd)
    else
        trshow(cmd)
    end
end

local M = {}
local x = function(c,word)
    local srcfile = vim.api.nvim_buf_get_name(0)
    vim.fn.setqflist({})
    local cmd = "cs find ".." "..c.." "..word
    vim.cmd([[normal! mY]])
    -- local view = vim.fn.winsaveview()
    vim.cmd(cmd)
    vim.cmd([[cclose]])
    local curfile = vim.api.nvim_buf_get_name(0)
    if curfile ~= srcfile then
        -- vim.api.nvim_buf_delete(0, {force = true})
        vim.cmd([[normal! `Y]])
        -- vim.fn.winrestview( view )
    end
    show(cmd)
end

M.cscopefn = function(c)
    local word = vim.fn.expand "<cword>"
    return x(c, word)
end

M.cscopefilefn = function(c)
    local word = vim.fn.expand "<cfile>:t"
    return x(c, word)
end

M.symbols = function()
    M.cscopefn("s")
end
M.callers = function()
    M.cscopefn("c")
end
M.files = function()
    M.cscopefilefn("f")
end
M.functions = function()
    M.cscopefn("d")
end
M.includes = function()
    M.cscopefilefn("i")
end
M.assignments = function()
    M.cscopefn("a")
end

return M
