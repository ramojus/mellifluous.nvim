local lush = require('lush')
local hsl = lush.hsl

local get = function(bg)
    local fg_basic = bg.li(80)
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

        fg = fg,
        fg2 = fg_basic.da(16),
        fg3 = fg_basic.da(32),
        fg4 = fg_basic.da(55),
        fg5 = fg_basic.da(64),
        comments = green,

        dark_bg = bg.da(12),
        bg = bg,
        bg2 = bg.li(3),
        bg3 = bg.li(6),
        bg4 = bg.li(8),
        bg5 = bg.li(10),

        red = red, -- errors, deletes, bad spellings
        orange = orange, -- warnings, changes, other (strange) spellings
        green = green, -- staged, additions
        blue = grey, -- information, new files
        purple = cyan, -- hints, merge
    }
end

return get

