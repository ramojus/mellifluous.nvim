local color = require('mellifluous.color')

local M = {}

local color_set_name = 'mellifluous'

local function get_is_neutral(mellifluous_config)
    local config = require('mellifluous').config
    -- for compatibility with configs from before color set specific config was supported
    if config.neutral ~= nil then
        return config.neutral
    end
    return mellifluous_config.neutral
end

function M.get_bg_dark()
    local mellifluous_config = require('mellifluous').config[color_set_name]
    local is_neutral = get_is_neutral(mellifluous_config)

    local brightness = 11.5
    if mellifluous_config.bg_contrast == 'hard' then
        brightness = brightness - 2
    elseif mellifluous_config.bg_contrast == 'soft' then
        brightness = brightness + 2
    end

    if is_neutral then
        return color.new_from_hsl({ h = 0, s = 0, l = brightness })
    end
    return color.new_from_hsl({ h = 24, s = 10, l = brightness })
end

function M.get_bg_light()
    local mellifluous_config = require('mellifluous').config[color_set_name]
    local is_neutral = get_is_neutral(mellifluous_config)

    local brightness = 91.5
    if mellifluous_config.bg_contrast == 'hard' then
        brightness = brightness + 2
    elseif mellifluous_config.bg_contrast == 'soft' then
        brightness = brightness - 2
    end

    if is_neutral then
        return color.new_from_hsl({ h = 0, s = 0, l = brightness })
    end
    return color.new_from_hsl({ h = 24, s = 10, l = brightness })
end

function M.get_colors_dark(bg)
    local fg = bg:lightened(75)

    local red = color.new_from_hsl({ h = 19, s = 43, l = 68 })
    local orange = color.new_from_hsl({ h = 67, s = 36, l = 72 })
    local khaki = color.new_from_hsl({ h = 64, s = 18, l = 71 })
    local yellow = color.new_from_hsl({ h = 84, s = 31, l = 74 })

    local blue = color.new_from_hsl({ h = 297, s = 24, l = 64 })
    local purple = color.new_from_hsl({ h = 331, s = 18, l = 66 })
    local green = color.new_from_hsl({ h = 107, s = 27, l = 73 })

    local dark_green = color.new_from_hsl({ h = 108, s = 54, l = 47 })

    local basic_red = color.new_from_hsl({ h = 26, s = 46, l = 68 })
    local basic_purple = color.new_from_hsl({ h = 307, s = 36, l = 67 })
    local basic_orange = color.new_from_hsl({ h = 77, s = 43, l = 76 })

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
        bg = bg,
        red = basic_red,       -- errors, deletes, bad spellings
        orange = basic_orange, -- warnings, changes, other (strange) spellings
        green = green,         -- staged, additions
        blue = blue,           -- information, new files
        purple = basic_purple, -- hints, merge
    }
end

function M.get_colors_light(bg)
    local fg = bg:darkened(80)

    local red = color.new_from_hsl({ h = 24, s = 75, l = 43 })
    local orange = color.new_from_hsl({ h = 63, s = 80, l = 50 })
    local khaki = color.new_from_hsl({ h = 62, s = 52, l = 47 })
    local yellow = color.new_from_hsl({ h = 81, s = 84, l = 55 })

    local blue = color.new_from_hsl({ h = 293, s = 43, l = 35 })
    local purple = color.new_from_hsl({ h = 333, s = 52, l = 40 })
    local green = color.new_from_hsl({ h = 109, s = 84, l = 40 })

    local dark_green = color.new_from_hsl({ h = 108, s = 40, l = 58 })

    local basic_red = color.new_from_hsl({ h = 28, s = 64, l = 39 })
    local basic_orange = color.new_from_hsl({ h = 73, s = 76, l = 49 })
    local basic_blue = color.new_from_hsl({ h = 258, s = 36, l = 40 })
    local basic_purple = color.new_from_hsl({ h = 305, s = 42, l = 37 })

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
        bg = bg,
        red = basic_red,       -- errors, deletes, bad spellings
        orange = basic_orange, -- warnings, changes, other (strange) spellings
        green = green,         -- staged, additions
        blue = basic_blue,     -- information, new files
        purple = basic_purple, -- hints, merge
    }
end

function M.get_config()
    return {
        neutral = true,        -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called mellifluous theme)
        bg_contrast = 'medium' -- options: 'soft', 'medium', 'hard'
    }
end

return M
