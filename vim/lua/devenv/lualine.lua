require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = "dracula"
  },
  extensions={'fugitive','fzf','quickfix','nvim-tree'}
}
