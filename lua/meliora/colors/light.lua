local lush = require('lush')
local hsl = lush.hsl

local get = function(bg)
    local fg = bg.da(80)

    local red = hsl(0, 52, 44)
    local orange = hsl(30, 56, 41)
    local khaki = hsl(28, 32, 41)
    local yellow = hsl(40, 56, 41)

    local blue = hsl(255, 32, 39)
    local purple = hsl(309, 32, 39)
    local green = hsl(60, 32, 24)

    local dark_green = hsl(60, 16, 48)

    local basic_red = hsl(05, 50, 39)
    local basic_orange = hsl(35, 50, 39)
    local basic_blue = hsl(215, 30, 39)
    local basic_purple = hsl(270, 30, 39)

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
        fg2 = fg.li(16),
        fg3 = fg.li(32),
        fg4 = fg.li(48),
        fg5 = fg.li(64),

        dark_bg2 = bg.da(10),
        dark_bg = bg.da(3),
        bg = bg,
        bg2 = bg.li(32),
        bg3 = bg.li(64),
        bg4 = bg.li(88),

        red = basic_red, -- errors, deletes, bad spellings
        orange = basic_orange, -- warnings, changes, other (strange) spellings
        green = green, -- staged, additions
        blue = basic_blue, -- information, new files
        purple = basic_purple, -- hints, merge
    }
end

return get
