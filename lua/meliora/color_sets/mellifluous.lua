local lush = require('lush')
local hsl = lush.hsl

local M = {}

local color_set_name = 'mellifluous'

local function get_is_neutral(mellifluous_config)
    local config = require('meliora').config
    -- for compatibility with configs from before color set specific config was supported
    if config.neutral ~= nil then
        return config.neutral
    end
    return mellifluous_config.neutral
end

function M.get_bg_dark()
    local mellifluous_config = require('meliora').config[color_set_name]
    local is_neutral = get_is_neutral(mellifluous_config)

    local brightness = 10
    if mellifluous_config.bg_contrast == 'hard' then
        brightness = 8
    elseif mellifluous_config.bg_contrast == 'soft' then
        brightness = 12
    end

    if is_neutral then
        return hsl(0, 0, brightness)
    end
    return hsl(24, 10, brightness)
end

function M.get_bg_light()
    local mellifluous_config = require('meliora').config[color_set_name]
    local is_neutral = get_is_neutral(mellifluous_config)

    local brightness = 90
    if mellifluous_config.bg_contrast == 'hard' then
        brightness = 94
    elseif mellifluous_config.bg_contrast == 'soft' then
        brightness = 86
    end

    if is_neutral then
        return hsl(0, 0, brightness)
    end
    return hsl(24, 10, brightness)
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

function M.get_config()
    return {
        neutral = true, -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called meliora theme)
        bg_contrast = 'medium' -- options: 'soft', 'medium', 'hard'
    }
end

return M

