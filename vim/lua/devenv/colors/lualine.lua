local lltheme = {}

local colors = require("devenv.colors").colors

lltheme.normal = {
  b = {fg = colors.purple, bg = colors.grey1},
  a = {fg = colors.black, bg = colors.purple, gui = 'bold'},
  c = {fg = colors.white, bg = colors.dark_grey;}
}

lltheme.visual = {
  a = {fg = colors.black, bg = colors.yellow, gui = 'bold'},
  b = {fg = colors.yellow, bg = colors.grey1},
}

lltheme.inactive = {
  b = {fg = colors.black, bg = colors.grey1},
  a = {fg = colors.white, bg = colors.grey, gui = 'bold'}
}

lltheme.replace = {
  b = {fg = colors.red, bg = colors.grey1},
  a = {fg = colors.black, bg = colors.red, gui = 'bold'},
  c = {fg = colors.white, bg = colors.dark_grey}
}

lltheme.insert = {
  a = {fg = colors.black, bg = colors.green, gui = 'bold'},
  b = {fg = colors.green, bg = colors.grey1},
  c = {fg = colors.white, bg = colors.dark_grey}
}

lltheme.command = {
  a = {fg = colors.black, bg = colors.orange, gui = 'bold'},
  b = {fg = colors.orange, bg = colors.grey1},
  c = {fg = colors.white, bg = colors.dark_grey}
}
return lltheme
