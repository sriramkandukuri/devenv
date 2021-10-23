local M = {}
function M.bitmap24to8(str)
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

function M.hcolor(group, hinfo)
    DVDBG(group)
    local cmd = ""
    local fg = hinfo[1]
    local bg = hinfo[2]
    local style = hinfo[3]
    local sp = hinfo[4]
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
    local cmd = table.concat({
        "highlight",
        "link",
        group,
        link,
    }, " ")
    DVDBG(cmd)
    vim.cmd(cmd)
end


function M.colors(colors)
    DVDBG("Entered hiltable")
    for group, hinfo in pairs(colors) do
        DVDBG(group)
        M.hcolor(group, hinfo)
    end
end

function M.links(colors)
    for group, link in pairs(colors) do
        M.hcolor(group, link)
    end
end
return M

