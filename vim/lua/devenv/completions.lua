vim.o.completeopt = 'menuone,noselect'
-- load snippets from runtimepath, eg. friendly-snippets.
require("luasnip.loaders.from_vscode").lazy_load()
local utils = require("devenv.utils")
vim.opt.shortmess:append "c"

local status_luasnip_ok, luasnip = pcall(require, "luasnip")
if not status_luasnip_ok then
    print("luasnip load failed")
    return
end

local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
    print("cmp load failed")
    return
end

local has_words_before = function()
    if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        return false
    end
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local F = function(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), "n", true)
end

local check_back_space = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
end

local function tab(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    else
        F("<Tab>")
    end
end

local function shtab(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    else
        F('<S-Tab>')
    end
end

local function enterit(fallback)
    if cmp.visible() then
        cmp.ConfirmBehavior.Replace()
    else
        F("<CR>")
    end
end

local cmpcfg = {}

cmpcfg = {
    formatting = {
      kind_icons = {
        Class = " ",
        Color = " ",
        Constant = "C ",
        Constructor = " ",
        Enum = "練",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = "",
        Folder = " ",
        Function = " ",
        Interface = "i ",
        Keyword = " ",
        Method = " ",
        Module = " ",
        Operator = "",
        Property = " ",
        Reference = " ",
        Snippet = " ",
        Struct = " ",
        Tabnine = "",
        Text = " ",
        TypeParameter = " ",
        Unit = "塞",
        Value = " ",
        Variable = " ",
      },
      format = function(entry, vim_item)
        vim_item.kind = cmpcfg.formatting.kind_icons[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "(LSP)",
          nvim_lua = "(NLUA)",
          emoji = "(Emoji)",
          path = "(Path)",
          calc = "(Calc)",
          cmp_tabnine = "(Tabnine)",
          vsnip = "(Snippet)",
          luasnip = "(Snippet)",
          buffer = "(Buffer)",
        })[entry.source.name]
        vim_item.dup = ({
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
        })[entry.source.name] or 0
        return vim_item
      end,
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    documentation = {
        border = utils.border,
    },
    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.

            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping(tab, { "i", "s" }),
        ['<S-Tab>'] = cmp.mapping(shtab, { "i", "s" }),
        ['<CR>'] = cmp.mapping(enterit, { "i", "s" }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'calc' },
        -- For vsnip user.
        -- { name = 'vsnip' },
        -- For luasnip user.
        { name = 'luasnip' },
        -- For ultisnips user.
        -- { name = 'ultisnips' },
        { name = 'buffer' },
        { name = "path" },
        { name = "crates" },
        { name = "nvim_lua" },
        { name = 'cmp_tabnine' },
    }
}
cmp.setup(cmpcfg)

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
        max_lines = 1000;
        max_num_results = 20;
        sort = true;
	run_on_every_keystroke = true;
	snippet_placeholder = '..';
})

vim.cmd([[
    hi CmpItemMenu guifg=#8f8f8f
]])
