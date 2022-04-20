local ts = require("telescope.builtin")
local tr = require("trouble")

local tsshow = function()
    return ts.quickfix()
end
local trshow = function()
    return tr.open("quickfix")
end

local show = function()
    local mode = "ts"
    if mode == "ts" then
        tsshow()
    else
        trshow()
    end
end

local findaddcscope = function()
    file = vim.fn.findfile("cscope.out", ".;")
    vim.cmd("silent! cs add "..file)
    vim.go.cscopequickfix = "s-,c-,d-,i-,t-,e-,a-"
    vim.go.cscopeverbose = false
end

local M = {}
local word = nil
local file = nil
local x = function(c,w)
    findaddcscope()
    local srcfile = vim.api.nvim_buf_get_name(0)
    vim.fn.setqflist({})
    local cmd = "execute \"cs find ".." "..c.." "..w.."\""
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
    show()
end

local cscopefn = function(c)
    return x(c, word)
end

local cscopefilefn = function(c)
    return x(c, file)
end

M.symbols = function()
    word = vim.fn.expand "<cword>"
    cscopefn("s")
end
M.callers = function()
    word = vim.fn.expand "<cword>"
    cscopefn("c")
end
M.files = function()
    file = vim.fn.expand "<cfile>:t"
    cscopefilefn("f")
end
M.definitions = function()
    word = vim.fn.expand "<cword>"
    cscopefn("d")
end
M.includes = function()
    file = vim.fn.expand "<cfile>:t"
    cscopefilefn("i")
end
M.assignments = function()
    word = vim.fn.expand "<cword>"
    cscopefn("a")
end

local pickers = require("telescope.pickers")
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
M.cscope = function(opts)
    opts = opts or {}
    local fns = {}
    for k,_ in pairs(M) do
        if k ~= "cscope" then
            table.insert(fns,k);
        end
    end
    pickers.new(opts, {
        prompt_title = "Cscope",
        finder = finders.new_table {
            results = fns,
            entry_maker = function(entry)
                return {
                    value = entry,
                    ordinal = entry,
                    display = entry,
                }
            end,
        },
        -- previewer = conf.qflist_previewer(opts),
        previewer = nil,
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(pbuf)
            actions.select_default:replace(function(_)
                local selection = action_state.get_selected_entry()
                if not selection then
                    print "[telescope] Nothing currently selected"
                    return
                end
                actions.close(pbuf)
                M[selection.value]()
            end)
            return true
        end,
    }):find()
end

--VH |Space+c+o|Connect to cscope db using already existing cscope.out file
--VH |Space+tcs|open cscope interactively in telescope
--VH |Space+c+s|cscope Find this C symbol
--VH |Space+c+d|cscope Find global definition
--VH |Space+c+c|cscope Find functions calling this function
--VH |Space+c+f|cscope Find this file
--VH |Space+c+i|cscope Find files #including this file
--VH |Space+c+a|cscope Find assignments of a variable this file

local nnoremap = require("devenv.utils").nnoremap
nnoremap( '<leader>co',      "<cmd>cs a cscope.out<CR>")
nnoremap( '<leader>tcs',      "<cmd>lua require('devenv.cscope').cscope()<CR>")

nnoremap( '<Leader>cs', "<cmd>lua require('devenv.cscope').symbols()<CR>")
nnoremap( '<Leader>cd', "<cmd>lua require('devenv.cscope').definitions()<CR>")
nnoremap( '<Leader>cc', "<cmd>lua require('devenv.cscope').callers()<CR>")
nnoremap( '<Leader>cf', "<cmd>lua require('devenv.cscope').files()<CR>")
nnoremap( '<Leader>ca', "<cmd>lua require('devenv.cscope').assignments()<CR>")
nnoremap( '<Leader>ci', "<cmd>lua require('devenv.cscope').includes()<CR>")

-- Setting project specific ctags
vim.cmd ([[
if $VIM_CSF_DIRS != ""
    :set tags=$PWD/tags
endif
]])
return M
