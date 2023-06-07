local color = require('mellifluous.color')

local M = {}

function M.get_bg_dark()
    return color.new('#0f0f0f')
end

function M.get_colors_dark(bg)
    local fg = bg:lightened(80)

    local red = color.new('#AC8A8C')
    local dark_red = color.new('#AC8A8C')
    local orange = color.new('#C6A679')
    local yellow = color.new('#ACA98A')
    local blue = color.new('#8F8AAC')
    local cyan = color.new('#8AABAC')
    local green = color.new('#8AAC8B')
    local magenta = color.new('#ac8aac')

    return {
        main_keywords = magenta,
        other_keywords = yellow,
        types = yellow,
        operators = dark_red,
        strings = green,
        functions = blue,
        constants = orange,
        special_comments = green,
        comments = fg:darkened(50),

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

