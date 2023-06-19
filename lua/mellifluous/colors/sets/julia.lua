local color = require('mellifluous.color')

local M = {}

function M.get_bg_light()
    return color.new('#eeeeee')
end

function M.get_colors_light(bg)
    local fg = color.new_from_hsl({ h = 0, s = 0, l = 12 })
    local blue = color.new_from_hsl({ h = 269, s = 44, l = 45 })
    local purple = color.new_from_hsl({ h = 314, s = 52, l = 50 })
    local green = color.new_from_hsl({ h = 141, s = 88, l = 54 })
    local red = color.new_from_hsl({ h = 28, s = 78, l = 50 })
    local orange = color.new_from_hsl({ h = 58, s = 88, l = 50 })

    return {
        main_keywords = red,
        other_keywords = orange,
        types = orange,
        operators = fg,
        strings = green,
        functions = blue,
        constants = purple,
        comments = fg:lightened(30),
        fg = fg,
        bg = bg,
        red = red,       -- errors, deletes, bad spellings
        orange = orange, -- warnings, changes, other (strange) spellings
        green = green,   -- staged, additions
        blue = blue,     -- information, new files
        purple = purple, -- hints, merge
    }
end

function M.get_ui_color_base_lightness()
    return 40
end

return M
