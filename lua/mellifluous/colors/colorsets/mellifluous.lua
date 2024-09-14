local M = {}
local color = require("mellifluous.color")

local colorset_name = "mellifluous"

function M.get_bg_dark()
    local config = require("mellifluous.config").config
    local mellifluous_config = config[colorset_name]
    local brightness = 11.5

    if mellifluous_config.neutral == false then
        return color.new_from_hsl({ h = 24, s = 10, l = brightness })
    end
    return color.new_from_hsl({ h = 0, s = 0, l = brightness })
end

function M.get_bg_light()
    local config = require("mellifluous.config").config
    local mellifluous_config = config[colorset_name]
    local brightness = 91.5

    if mellifluous_config.neutral == false then
        return color.new_from_hsl({ h = 24, s = 10, l = brightness })
    end
    return color.new_from_hsl({ h = 0, s = 0, l = brightness })
end

function M.get_colors_dark(bg)
    local fg = bg:with_lightness(87)

    local red = color.new_from_hsl({ h = 19, s = 43, l = 68 })
    local orange = color.new_from_hsl({ h = 67, s = 36, l = 72 })
    local khaki = color.new_from_hsl({ h = 64, s = 18, l = 72 })
    local yellow = color.new_from_hsl({ h = 84, s = 31, l = 72 })

    local blue = color.new_from_hsl({ h = 297, s = 24, l = 68 })
    local purple = color.new_from_hsl({ h = 331, s = 18, l = 68 })
    local green = color.new_from_hsl({ h = 108, s = 27, l = 72 })

    local dark_green = color.new_from_hsl({ h = 108, s = 54, l = 47 })

    return {
        main_keywords = red,
        other_keywords = orange,
        types = khaki,
        operators = khaki,
        strings = yellow,
        functions = blue,
        constants = purple,
        comments = dark_green,
        fg = fg,
        bg = bg,
        red = red, -- errors, deletes, bad spellings
        orange = orange, -- warnings, changes, other (strange) spellings
        green = green, -- staged, additions
        blue = blue, -- information, new files
        purple = purple, -- hints, merge
        yellow = yellow,
    }
end

function M.get_colors_light(bg)
    local fg = bg:with_lightness(12)

    local red = color.new_from_hsl({ h = 19, s = 80, l = 45 })
    local orange = color.new_from_hsl({ h = 67, s = 85, l = 50 })
    local khaki = color.new_from_hsl({ h = 64, s = 50, l = 50 })
    local yellow = color.new_from_hsl({ h = 84, s = 85, l = 53 })

    local blue = color.new_from_hsl({ h = 297, s = 50, l = 35 })
    local purple = color.new_from_hsl({ h = 331, s = 60, l = 40 })
    local green = color.new_from_hsl({ h = 108, s = 84, l = 40 })

    local dark_green = color.new_from_hsl({ h = 108, s = 60, l = 60 })

    return {
        main_keywords = red,
        other_keywords = orange,
        types = khaki,
        operators = khaki,
        strings = yellow,
        functions = blue,
        constants = purple,
        comments = dark_green,
        fg = fg,
        bg = bg,
        red = red, -- errors, deletes, bad spellings
        orange = orange, -- warnings, changes, other (strange) spellings
        green = green, -- staged, additions
        blue = blue, -- information, new files
        purple = purple, -- hints, merge
        yellow = yellow,
    }
end

function M.get_ui_color_base_lightness(is_bg_dark)
    return is_bg_dark and 60 or 50
end

function M.get_config()
    return {
        neutral = true,
    }
end

return M
