local lush = require('lush')
local hsl = lush.hsl

local M = {}

function M.get_bg_dark()
    return hsl('#282828')
end

function M.get_colors_dark(bg)
    local fg = hsl('#eeeeee')
    local red1 = hsl('#f43753')
    local red2 = hsl('#c5152f')
    local red3 = hsl('#79313c')

    local blue1 = hsl('#b3deef')
    local blue2 = hsl('#73cef4')
    local blue3 = hsl('#44778d')
    local blue4 = hsl('#335261')
    local blue5 = hsl('#293b44')

    local green1 = hsl('#c9d05c')
    local green2 = hsl('#9faa00')
    local green3 = hsl('#6a6b3f')
    local green4 = hsl('#464632')

    local yellow1 = hsl('#d3b987')
    local yellow2 = hsl('#ffc24b')
    local yellow3 = hsl('#715b2f')

    return {
        main_keywords = green1,
        other_keywords = blue2,
        types = blue2,
        operators = blue1,
        strings = yellow1,
        functions = blue1,
        constants = yellow2,
        special_comments = red3,
        comments = fg.da(50),

        fg = fg,
        bg = bg,

        red = red1.li(40), -- errors, deletes, bad spellings
        orange = yellow2, -- warnings, changes, other (strange) spellings
        green = green1, -- staged, additions
        blue = blue1, -- information, new files
        purple = blue2, -- hints, merge

        -- optional (for better terminal highlights)
        yellow = yellow2,
    }
end

return M
