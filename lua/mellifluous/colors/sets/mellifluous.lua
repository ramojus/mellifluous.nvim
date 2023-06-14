local color = require('mellifluous.color')

local M = {}

local color_set_name = 'mellifluous'

local function get_is_neutral(mellifluous_config)
    -- for compatibility with configs from before color set specific config was supported
    if Config.neutral ~= nil then
        return Config.neutral
    end
    return mellifluous_config.neutral
end

function M.get_bg_dark()
    local mellifluous_config = Config[color_set_name]
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
    local mellifluous_config = Config[color_set_name]
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
        special_comments = green,
        fg = fg,
        bg = bg,
        red = red:with_lightness(68),       -- errors, deletes, bad spellings
        orange = orange:with_lightness(68), -- warnings, changes, other (strange) spellings
        green = green:with_lightness(68),   -- staged, additions
        blue = blue:with_lightness(68),     -- information, new files
        purple = purple:with_lightness(68), -- hints, merge
    }
end

function M.get_colors_light(bg)
    local fg = bg:darkened(80)

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
        special_comments = green,
        fg = fg,
        bg = bg,
        red = red:with_lightness(45),       -- errors, deletes, bad spellings
        orange = orange:with_lightness(45), -- warnings, changes, other (strange) spellings
        green = green:with_lightness(45),         -- staged, additions
        blue = blue:with_lightness(45),     -- information, new files
        purple = purple:with_lightness(45), -- hints, merge
    }
end

function M.get_config()
    return {
        neutral = true,        -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called mellifluous theme)
        bg_contrast = 'medium' -- options: 'soft', 'medium', 'hard'
    }
end

return M
