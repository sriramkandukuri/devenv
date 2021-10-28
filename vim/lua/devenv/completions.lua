vim.o.completeopt = 'menuone,noselect'
-- load snippets from runtimepath, eg. friendly-snippets.
require("luasnip.loaders.from_vscode").lazy_load()
local utils = require("devenv.utils")
local colors = require("devenv.colors").colors()
local hil = require("devenv.colors.hil")
vim.opt.shortmess:append "c"

local status_cmp_ok, cmp = pcall(require, "cmp")
if not status_cmp_ok then
    print("cmp load failed")
    return
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
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
        ['<CR>'] = cmp.mapping({
            i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
            c = function(fallback)
                if cmp.visible() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end
        }),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = "nvim_lua" },
        { name = 'buffer' },
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

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer', opts = { keyword_pattern = [=[[^[:blank:]].*]=] } }
    }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
            { name = 'cmdline' }
        })
})

local cmpcolors = {
    CmpItemAbbr = { colors.fg, nil, nil, nil },
    CmpItemAbbrMatch = { colors.aqua, nil, nil, nil },
    CmpItemAbbrMatchFuzzy = { colors.magenta, nil, nil, nil },
    CmpItemKind = { colors.beige, nil, "italic", nil },
    CmpItemMenu = { colors.black, nil, "italic", nil }
}
hil.colors(cmpcolors)
