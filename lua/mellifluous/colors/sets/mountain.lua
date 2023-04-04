local lush = require('lush')
local hsl = lush.hsl

local M = {}

function M.get_bg_dark()
    return hsl('#0f0f0f')
end

function M.get_colors_dark(bg)
    local fg = bg.li(80)

    local red = hsl('#AC8A8C')
    local dark_red = hsl('#AC8A8C')
    local orange = hsl('#C6A679')
    local yellow = hsl('#ACA98A')
    local blue = hsl('#8F8AAC')
    local cyan = hsl('#8AABAC')
    local green = hsl('#8AAC8B')
    local magenta = hsl('#ac8aac')

    return {
        main_keywords = magenta,
        other_keywords = yellow,
        types = yellow,
        operators = dark_red,
        strings = green,
        functions = blue,
        constants = orange,
        special_comments = green,
        comments = fg.da(60),

        fg = fg,
        bg = bg,

        red = red, -- errors, deletes, bad spellings
        orange = orange, -- warnings, changes, other (strange) spellings
        green = green, -- staged, additions
        blue = blue, -- information, new files
        purple = magenta, -- hints, merge

        -- optional (for better terminal highlights)
        cyan = cyan,
        yellow = yellow,
    }
end

return M

