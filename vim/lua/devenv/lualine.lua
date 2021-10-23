local lltheme = require("devenv.colors.lualine")
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = lltheme
  },
  sections = {lualine_x = {"os.data('%a')", 'data', require'lsp-status'.status, 'encoding', 'fileformat', 'filetype'}},
  extensions={'fugitive','fzf','quickfix','nvim-tree'}
}
