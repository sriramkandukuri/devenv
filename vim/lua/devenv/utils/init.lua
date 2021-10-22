local api = vim.api
local fn = vim.fn
local utils = {}

-- thanks to
-- https://github.com/akinsho/dotfiles/blob/main/.config/nvim/lua/as/globals.lua
-- for inspiration
local function make_keymap_fn(mode, o)
  -- copy the opts table as extends will mutate opts
  local parent_opts = vim.deepcopy(o)
  return function(combo, mapping, opts)
    assert(combo ~= mode, string.format("The combo should not be the same as the mode for %s", combo))
    local _opts = opts and vim.deepcopy(opts) or {}

    if type(mapping) == "function" then
      local fn_id = globals._create(mapping)
      mapping = string.format("<cmd>lua globals._execute(%s)<cr>", fn_id)
    end

    if _opts.bufnr then
      local bufnr = _opts.bufnr
      _opts.bufnr = nil
      _opts = vim.tbl_extend("keep", _opts, parent_opts)
      api.nvim_buf_set_keymap(bufnr, mode, combo, mapping, _opts)
    else
      api.nvim_set_keymap(mode, combo, mapping, vim.tbl_extend("keep", _opts, parent_opts))
    end
  end
end

local map_opts = {noremap = false, silent = true}
utils.nmap = make_keymap_fn("n", map_opts)
utils.xmap = make_keymap_fn("x", map_opts)
utils.imap = make_keymap_fn("i", map_opts)
utils.vmap = make_keymap_fn("v", map_opts)
utils.omap = make_keymap_fn("o", map_opts)
utils.tmap = make_keymap_fn("t", map_opts)
utils.smap = make_keymap_fn("s", map_opts)
utils.cmap = make_keymap_fn("c", map_opts)

local noremap_opts = {noremap = true, silent = true}
utils.nnoremap = make_keymap_fn("n", noremap_opts)
utils.xnoremap = make_keymap_fn("x", noremap_opts)
utils.vnoremap = make_keymap_fn("v", noremap_opts)
utils.inoremap = make_keymap_fn("i", noremap_opts)
utils.onoremap = make_keymap_fn("o", noremap_opts)
utils.tnoremap = make_keymap_fn("t", noremap_opts)
utils.cnoremap = make_keymap_fn("c", noremap_opts)

function utils.has_map(map, mode)
  mode = mode or "n"
  return fn.maparg(map, mode) ~= ""
end

function utils.has_module(name)
  if
    pcall(
      function()
        require(name)
      end
    )
   then
    return true
  else
    return false
  end
end

function utils.termcodes(str)
  return api.nvim_replace_termcodes(str, true, true, true)
end

function utils.bitmap24to8(str)
    if str ~= nil then
        local num = tonumber(string.sub(str,2),16)
        local red = bit.lshift( math.floor( bit.rshift( num, 16 )/32 ), 5)
        local green = bit.lshift( math.floor( bit.band(bit.rshift(num,8),0xff)/32 ), 2)
        local blue = math.floor( bit.band(num,0xff)/64 )
        local res = red + green + blue
        if res == 0 then
            return "1"
        else
            return res
        end
    end
end

function utils.hil(group, properties)
    local bg = ""
    local cbg = ""
    local fg = ""
    local cfg = ""
    local style = ""
    local cstyle = ""
    if properties.bg ~= nil then
        bg = "guibg=" .. properties.bg
        cbg = "ctermbg=" .. utils.bitmap24to8(properties.bg)
    end
    if properties.fg ~= nil then
        fg = "guifg=" .. properties.fg
        cfg = "ctermfg=" .. utils.bitmap24to8(properties.fg)
    end
    if properties.style ~= nil then
        style = "gui=" .. properties.style
        cstyle = "cterm=" .. properties.style
    end

  local cmd = table.concat({
    "highlight",
    group,
    cbg,
    cfg,
    bg,
    fg,
    style,
    cstyle,
  }, " ")

  vim.api.nvim_command(cmd)
end

utils.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

return utils
