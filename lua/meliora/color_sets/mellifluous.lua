local lush = require('lush')
local hsl = lush.hsl

local M = {}

function M.get_bg_dark()
    return hsl(0, 0, 10)
end

function M.get_bg_light()
    return hsl(0, 0, 90)
end

function M.get_colors_dark(bg)
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

function M.get_colors_light(bg)
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

return M

