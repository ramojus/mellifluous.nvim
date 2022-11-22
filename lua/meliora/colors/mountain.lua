local lush = require('lush')
local hsl = lush.hsl

local get = function(bg)
    local fg = bg.li(80)

    local red = hsl("#AC8A8C")
    local dark_red = hsl("#AC8A8C")
    local orange = hsl("#C6A679")
    local yellow = hsl("#ACA98A")
    local blue = hsl("#8F8AAC")
    local cyan = hsl("#8AABAC")
    local green = hsl("#8AAC8B")
    local magenta = hsl("#ac8aac")

    return {
        main_keywords = magenta,
        other_keywords = yellow,
        types = yellow,
        operators = dark_red,
        strings = green,
        functions = blue,
        constants = orange,
        special_comments = green,

        fg = fg,
        fg2 = fg.da(16),
        fg3 = fg.da(32),
        fg4 = fg.da(55),
        fg5 = fg.da(64),
        comments = fg.da(60),

        dark_bg = bg.da(12),
        bg = bg,
        bg2 = bg.li(3),
        bg3 = bg.li(6),
        bg4 = bg.li(8),
        bg5 = bg.li(10),

        red = red, -- errors, deletes, bad spellings
        orange = orange, -- warnings, changes, other (strange) spellings
        green = green, -- staged, additions
        blue = blue, -- information, new files
        purple = magenta, -- hints, merge
    }
end

return get

