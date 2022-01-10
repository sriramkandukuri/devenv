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

M.findsymbol = function()
    local srcfile = vim.api.nvim_buf_get_name(0)
    vim.fn.setqflist({})
    local word = vim.fn.expand "<cword>"
    local cmd = "silent keepjumps execute \"cs f s "..word.."\""
    -- vim.cmd([[normal! mY]])
    -- local view = vim.fn.winsaveview()
    vim.cmd(cmd)
    vim.cmd([[cclose]])
    local curfile = vim.api.nvim_buf_get_name(0)
    if curfile ~= srcfile then
        vim.api.nvim_buf_delete(0, {force = true})
        -- vim.cmd([[normal! `Y]])
        -- vim.fn.winrestview( view )
    end
    show(cmd)
end
return M
