require('nvim-autopairs').setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
    require("nvim-autopairs.completion.cmp").setup({
        map_cr = true, --  map <CR> on insert mode
        map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
        auto_select = true, -- automatically select the first item
        insert = false, -- use insert confirm behavior instead of replace
        map_char = { -- modifies the function or method delimiter by filetypes
        all = '(',
        tex = '{'
    }
})
})
local npairs = require'nvim-autopairs'
local Rule   = require'nvim-autopairs.rule'

npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function (opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '[]', '{}' }, pair)
    end),
  Rule('( ', ' )')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%)') ~= nil
      end)
      :use_key(')'),
  Rule('{ ', ' }')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%}') ~= nil
      end)
      :use_key('}'),
  Rule('[ ', ' ]')
      :with_pair(function() return false end)
      :with_move(function(opts)
          return opts.prev_char:match('.%]') ~= nil
      end)
      :use_key(']')
}
