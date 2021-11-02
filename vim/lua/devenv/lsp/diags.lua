local utils = require("devenv.utils")
local border = utils.border
-- show diagnostic line with custom border and styling
local flopts = { scope = "cursor", focusable = false, border = border}
local M = {}
M.show = function()
  vim.diagnostic.open_float(0, flopts)
end
M.gprv = function()
  vim.diagnostic.goto_prev({float =flopts})
end
M.gnxt = function()
  vim.diagnostic.goto_next({float =flopts})
end

return M
