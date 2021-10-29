vim.o.completeopt = 'menuone,noselect'
-- load snippets from runtimepath, eg. friendly-snippets.
require("luasnip.loaders.from_vscode").lazy_load()
local utils = require("devenv.utils")
local colors = require("devenv.colors").colors()
local hil = require("devenv.colors.hil")
vim.opt.shortmess:append "c"

local cmp = require("cmp")
local cmpcfg = {}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")

local function tab(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    elseif has_words_before() then
        cmp.complete()
    else
        -- F("<Tab>")
        fallback()
    end
end

local function shtab(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        -- F('<S-Tab>')
        fallback()
    end
end

local function enterit(fallback)
    if cmp.visible() and cmp.get_selected_entry() then
        cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false  })
    else
        -- F("<CR>")
        fallback()
    end
end

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
        Tabnine = " ",
        Text = " ",
        TypeParameter = " ",
        Unit = "塞",
        Value = " ",
        Variable = " ",
      },
      format = function(entry, vim_item)
        vim_item.kind = cmpcfg.formatting.kind_icons[vim_item.kind] .. vim_item.kind
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          nvim_lua = "[nvim]",
          emoji = "[emoji]",
          path = "[path]",
          calc = "[calc]",
          cmp_tabnine = "[tab9]",
          vsnip = "[snip]",
          luasnip = "[snip]",
          buffer = "[buf]",
          fzy_buffer = "[fzbuf]",
          cmdline = "[cmd]",
          cmdline_history = "[cmd-hist]",
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
            luasnip.lsp_expand(args.body)

            -- For `ultisnips` user.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp.mapping(tab, {'i', 's', 'c'}),
        ['<S-Tab>'] = cmp.mapping(shtab, { 'i', 's', 'c'}),
        ['<CR>'] = cmp.mapping(enterit, {"i", "s"}),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "nvim_lua" },
        { name = 'buffer' },
        { name = 'fzy_buffer' },
        { name = "path" },
        { name = 'calc' },
        { name = 'cmp_tabnine' },
        { name = 'emoji' },
        -- For vsnip user.
        -- { name = 'vsnip' },
        -- For luasnip user.
        -- For ultisnips user.
        -- { name = 'ultisnips' },
        { name = "crates" },
    },
}
cmp.setup(cmpcfg)

-- Use cmdline & path source for ':'.
for _, cmd_type in ipairs({':', '/', '?', '@', '='}) do
    cmp.setup.cmdline(cmd_type, {
        sources = {
            { name = 'cmdline' },
            { name = 'fzy_buffer' },
            { name = 'path' },
            { name = 'cmdline_history' },
        }
    })
end


local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_lines = 1000;
    max_num_results = 20;
    sort = true;
    run_on_every_keystroke = true;
    snippet_placeholder = '..';
})

local cmpcolors = {
    CmpItemAbbr = { colors.fg, nil, nil, nil },
    CmpItemAbbrMatch = { colors.aqua, nil, nil, nil },
    CmpItemAbbrMatchFuzzy = { colors.magenta, nil, nil, nil },
    CmpItemKind = { colors.dark_beige, nil, "italic", nil },
    CmpItemMenu = { colors.paleblue, nil, "italic", nil }
}
hil.colors(cmpcolors)
