require("notify").setup({
  -- Animation style (see below for details)
  stages = "fade_in_slide_out",

  -- Default timeout for notifications
  timeout = 5000,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  background_colour = "Normal",

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})

local colors = require("devenv.colors").colors
local hil = require("devenv.colors.hil")

local notifyColors = {
    NotifyERRORBorder = { colors.red, nil, nil, nil },
    NotifyWARNBorder = { colors.brown, nil, nil, nil },
    NotifyINFOBorder = { colors.aqua, nil, nil, nil },
    NotifyDEBUGBorder = { colors.grey, nil, nil, nil },
    NotifyTRACEBorder = { colors.violet, nil, nil, nil },
    NotifyERRORIcon = { colors.red, nil, nil, nil },
    NotifyWARNIcon = { colors.orange, nil, nil, nil },
    NotifyINFOIcon = { colors.aqua, nil, nil, nil },
    NotifyDEBUGIcon = { colors.grey, nil, nil, nil },
    NotifyTRACEIcon = { colors.violet, nil, nil, nil },
    NotifyERRORTitle  = { colors.red, nil, nil, nil },
    NotifyWARNTitle = { colors.orange, nil, nil, nil },
    NotifyINFOTitle = { colors.aqua, nil, nil, nil },
    NotifyDEBUGTitle  = { colors.grey, nil, nil, nil },
    NotifyTRACETitle  = { colors.violet, nil, nil, nil },
}
local notifylinks = {
    NotifyERRORBody = "Normal",
    NotifyWARNBody = "Normal",
    NotifyINFOBody = "Normal",
    NotifyDEBUGBody = "Normal",
    NotifyTRACEBody = "Normal",
}
hil.colors(notifyColors)
hil.links(notifylinks)
