local M = {}

function M.getrgb(str)
    local num = tonumber(string.sub(str,2),16)
    local red = bit.rshift( num, 16 )
    local green = bit.band(bit.rshift(num,8),0xff)
    local blue = bit.band(num,0xff)
    return red, green, blue
end

function M.getcolor(r, g, b)
    return bit.lshift(r, 16) + bit.lshift(g, 8) + b
end

function M.bitmap24to8(str)
    if str ~= nil then
        local red, green, blue = M.getrgb(str)
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

local function adjust(color, factor)
    local ret
    ret = color + math.floor((color * factor) / 100)
    if ret >= 255 then
        ret = 255
    else if ret < 0 then
            ret = 0
        end
    end
    return ret
end

local function adjustrgb(str, factor)
    local ret
    if str then
        local red, green, blue = M.getrgb(str)
        ret = M.getcolor(adjust(red, factor), adjust(green, factor), adjust(blue, factor))
        ret = string.format("#%x", ret)
        return ret
    end
end

function M.dark(str, factor)
    return adjustrgb(str,factor and -factor or -5)
end

function M.light(str, factor)
    return adjustrgb(str,factor and factor or 5)
end

function M.hcolor(group, hinfo)
    DVDBG(group)
    local cmd, fg, bg, style, sp
    if hinfo[1] or hinfo[2] or hinfo[3] or hinfo[4] then
        fg = hinfo[1]
        bg = hinfo[2]
        style = hinfo[3]
        sp = hinfo[4]
    else
        fg = hinfo["fg"]
        bg = hinfo["bg"]
        style = hinfo["style"]
        sp = hinfo["sp"]
    end

    DVDBG(bg,fg,style,sp)

    bg = bg and "guibg=" .. bg .. " ctermbg=" .. M.bitmap24to8(bg) or "guibg=NONE ctermbg=NONE"
    fg = fg and "guifg=" .. fg .. " ctermfg=" .. M.bitmap24to8(fg) or "guifg=NONE ctermfg=NONE"
    style = style and "gui=" .. style .." cterm=" .. style or "gui=NONE cterm=NONE"
    sp = sp and "guisp=" .. sp or "guisp=NONE"

    cmd = table.concat({
        "highlight",
        group,
        bg,
        fg,
        style,
        sp,
    }, " ")
    DVDBG(cmd)

    vim.cmd(cmd)
    -- local acmd = "autocmd ColorScheme * "..cmd
    -- vim.cmd(acmd)
end

function M.hlink(group, link)
    if type(link) == "table" then
        link = link["link"]
    end
    local cmd = table.concat({
        "highlight",
        "link",
        group,
        link,
    }, " ")
    DVDBG(cmd)
    vim.cmd(cmd)
end

local function check_hilg(group)
    if not _G.devenv_err then
        return
    end
    local g = _G.HILG
    if g[group] ~= nil then
        DVERR (group .. " is already configured")
    else
        g[group] = true
    end
end

function M.colors(colors)
    DVDBG("Entered hiltable")
    for group, hinfo in pairs(colors) do
        check_hilg(group)
        M.hcolor(group, hinfo)
    end
end

function M.links(colors)
    for group, link in pairs(colors) do
        check_hilg(group)
        M.hlink(group, link)
    end
end
return M
