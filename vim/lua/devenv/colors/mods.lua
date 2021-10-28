local M = {}

require("colorbuddy").setup()

local cmods = require("colorbuddy.modifiers").modifiers
local cuti = require("colorbuddy.util")

function M.dark(str, factor)
    local h, s, l = cuti.rgb_string_to_hsl(str)
    h, s, l = unpack(cmods.dark(h, s, l, factor))
    return cuti.hsl_to_rgb_string(h, s, l)
end

function M.bright(str, factor)
    local h, s, l = cuti.rgb_string_to_hsl(str)
    h, s, l = unpack(cmods.light(h, s, l, factor))
    return cuti.hsl_to_rgb_string(h, s, l)
end

M.rgb_string_to_rgb = function(str)
  return
    tonumber(str:sub(2, 3), 16),
    tonumber(str:sub(4, 5), 16),
    tonumber(str:sub(6, 7), 16)
end

function M.bitmap24to8(str)
    if str ~= nil then
        local red, green, blue = M.rgb_string_to_rgb(str)
        red = bit.lshift( math.floor( red/32 ), 5)
        green = bit.lshift( math.floor( green/32 ), 2)
        blue = math.floor( blue/64 )
        local res = red + green + blue
        if res == 0 then
            return "1"
        else
            return res
        end
    end
end

return M
