local M = {}

local mods = require("devenv.colors.mods")

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

    bg = bg and "guibg=" .. bg .. " ctermbg=" .. mods.bitmap24to8(bg) or "guibg=NONE ctermbg=NONE"
    fg = fg and "guifg=" .. fg .. " ctermfg=" .. mods.bitmap24to8(fg) or "guifg=NONE ctermfg=NONE"
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
        if type(hinfo) == "string" or (type(hinfo) == "table" and hinfo["link"] ~= nil) then
            M.hlink(group,hinfo)
        else
            M.hcolor(group, hinfo)
        end
    end
end

return M
