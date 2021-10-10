require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = "dracula"
  },
  sections = {lualine_x = {"os.data('%a')", 'data', require'lsp-status'.status, 'encoding', 'fileformat', 'filetype'}},
  extensions={'fugitive','fzf','quickfix','nvim-tree'}
}
