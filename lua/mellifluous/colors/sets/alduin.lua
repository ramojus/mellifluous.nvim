local lush = require('lush')
local hsl = lush.hsl

local M = {}

function M.get_bg_dark()
    return hsl('#1c1c1c')
end

function M.get_colors_dark(bg)
    local fg = hsl('#dfdfaf')

    local orange = hsl('#af875f')
    local soft_orange = hsl('#dfaf87')
    local dark_orange = hsl('#af5f00')
    local soft_red = hsl('#af8787')
    local red = hsl('#af5f5f')
    local dark_red = hsl('#875f5f')
    local cyan = hsl('#87afaf')
    local grey = hsl('#878787')
    local green = hsl('#87875f')
    local soft_yellow = hsl('#dfdfaf')
    local strings = hsl('#ffdf87')

    return {
        main_keywords = red,
        other_keywords = grey,
        types = orange,
        operators = grey,
        strings = strings,
        functions = dark_red,
        constants = dark_orange,
        special_comments = green,
        comments = green,

        fg = fg,
        shades_fg = bg.li(80),
        bg = bg,

        red = red, -- errors, deletes, bad spellings
        orange = soft_orange, -- warnings, changes, other (strange) spellings
        green = green, -- staged, additions
        blue = grey, -- information, new files
        purple = cyan, -- hints, merge

        -- optional (for better terminal highlights)
        cyan = cyan,
    }
end

return M

