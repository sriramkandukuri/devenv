local colors = require("devenv.colors").colors()
require('nvim-treesitter.configs').setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {"rust" },  -- list of language that will be disabled
  },
  indent = {
      enable = true,
  },
  autotag = {
    enable = true,
    filetypes = { "html" , "xml" },
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
    colors = {colors.violet, colors.blue, colors.green, colors.yellow, colors.orange, colors.red}
  },
}
