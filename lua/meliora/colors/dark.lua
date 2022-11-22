local lush = require('lush')
local hsl = lush.hsl

local get = function(bg)
    local fg = bg.li(80)

    local red = hsl(0, 44, 70)
    local orange = hsl(30, 40, 67)
    local khaki = hsl(28, 20, 67)
    local yellow = hsl(40, 30, 67)

    local blue = hsl(255, 18, 65)
    local purple = hsl(309, 18, 65)
    local green = hsl(60, 18, 65)

    local dark_green = hsl(60, 24, 36)

    local basic_red = hsl(05, 50, 69)
    local basic_orange = hsl(35, 50, 69)
    local basic_blue = hsl(215, 30, 69)
    local basic_purple = hsl(270, 30, 69)

    return {
        main_keywords = red,
        other_keywords = orange,
        types = khaki,
        operators = khaki,
        strings = yellow,
        functions = blue,
        constants = purple,
        comments = dark_green,
        special_comments = green,

        fg = fg,
        fg2 = fg.da(16),
        fg3 = fg.da(32),
        fg4 = fg.da(48),
        fg5 = fg.da(64),

        dark_bg = bg.da(12),
        bg = bg,
        bg2 = bg.li(3),
        bg3 = bg.li(6),
        bg4 = bg.li(8),
        bg5 = bg.li(10),

        red = basic_red, -- errors, deletes, bad spellings
        orange = basic_orange, -- warnings, changes, other (strange) spellings
        green = green, -- staged, additions
        blue = basic_blue, -- information, new files
        purple = basic_purple, -- hints, merge
    }
end

return get

