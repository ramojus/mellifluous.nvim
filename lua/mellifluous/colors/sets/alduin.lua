local M = {}
local color = require("mellifluous.color")

function M.get_bg_dark()
    return color.new("#1c1c1c")
end

function M.get_colors_dark(bg)
    local fg = color.new("#dfdfaf")

    local orange = color.new("#af875f")
    local soft_orange = color.new("#dfaf87")
    local dark_orange = color.new("#af5f00")
    local soft_red = color.new("#af8787")
    local red = color.new("#af5f5f")
    local dark_red = color.new("#875f5f")
    local cyan = color.new("#87afaf")
    local grey = color.new("#878787")
    local green = color.new("#87875f")
    local soft_yellow = color.new("#dfdfaf")
    local strings = color.new("#ffdf87")

    return {
        main_keywords = red,
        other_keywords = grey,
        types = orange,
        operators = grey,
        strings = strings,
        functions = dark_red,
        constants = dark_orange,
        comments = green,

        fg = fg,
        shades_fg = bg:lightened(80),
        bg = bg,

        red = red, -- errors, deletes, bad spellings
        orange = soft_orange, -- warnings, changes, other (strange) spellings
        green = green, -- staged, additions
        blue = grey, -- information, new files
        purple = cyan, -- hints, merge
        yellow = strings,

        -- optional (for better terminal highlights)
        cyan = cyan,
    }
end

function M.get_ui_color_base_lightness()
    return 50
end

return M
