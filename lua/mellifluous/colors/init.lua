local M = {}

function M.get_color_sets_table()
    return {
        mellifluous = 1,
        alduin = 2,
        mountain = 3,
        tender = 4,
        kanagawa_dragon = 5,
    }
end

local function tbl_extend_non_nil(base_table, overlay_table)
    for key, _ in pairs(overlay_table) do
        base_table[key] = overlay_table[key] or base_table[key]
    end
end

local function get_color_overrides_bg_fn()
    local config = require('mellifluous.config').config
    local global_color_overrides_bg = vim.tbl_get(config,
        'color_overrides', config.is_bg_dark and 'dark' or 'light', 'bg')
    local color_overrides_bg_fn = vim.tbl_get(config, config.color_set,
        'color_overrides', config.is_bg_dark and 'dark' or 'light', 'bg')

    if color_overrides_bg_fn == nil then
        color_overrides_bg_fn = global_color_overrides_bg
    end

    return color_overrides_bg_fn
end

local function apply_color_overrides(colors)
    local config = require('mellifluous.config').config
    local global_color_overrides_fn = vim.tbl_get(config,
        'color_overrides', config.is_bg_dark and 'dark' or 'light', 'colors')
    local color_overrides_fn = vim.tbl_get(config, config.color_set,
        'color_overrides', config.is_bg_dark and 'dark' or 'light', 'colors')

    if global_color_overrides_fn ~= nil then
        tbl_extend_non_nil(colors, global_color_overrides_fn(colors))
    end
    if color_overrides_fn ~= nil then
        tbl_extend_non_nil(colors, color_overrides_fn(colors))
    end
    return colors
end

local function ensure_correct_color_types(colors)
    local color_lib = require('mellifluous.color')
    for key, color in pairs(colors) do
        colors[key] = color_lib.new(color.hex or color)
    end
end

function M.get_is_bg_dark(color_set_name)
    local color_set_functions = require('mellifluous.colors.sets.' .. color_set_name)
    local is_light_set_available = color_set_functions.get_bg_light ~= nil
        and color_set_functions.get_colors_light ~= nil
    local is_dark_set_available = color_set_functions.get_bg_dark ~= nil
        and color_set_functions.get_colors_dark ~= nil

    if vim.o.background == 'light' and is_light_set_available then
        return false
    elseif is_dark_set_available then
        return true
    elseif is_light_set_available then
        return false
    else
        require('mellifluous').return_error("Required color set is either incomplete or missing")
    end
end

function M.get_ui_color_base_lightness(color_set_name, is_bg_dark)
    return require('mellifluous.colors.sets.' .. color_set_name).get_ui_color_base_lightness(is_bg_dark)
end

function M.get_colors()
    local config = require('mellifluous.config').config
    if not M.get_color_sets_table()[config.color_set] then
        require('mellifluous').return_error("Color set '" .. config.color_set .. "' not found")
    end

    local color_set_functions = require('mellifluous.colors.sets.' .. config.color_set)

    local color_overrides_bg_fn = get_color_overrides_bg_fn()

    local color_set_bg
    if config.is_bg_dark then
        color_set_bg = color_set_functions.get_bg_dark()
    else
        color_set_bg = color_set_functions.get_bg_light()
    end

    local bg = color_set_bg
    if type(color_overrides_bg_fn) == 'function' then
        local overriden_bg = color_overrides_bg_fn(color_set_bg)
        if overriden_bg ~= nil then
            bg = overriden_bg
        end
    end

    local colors
    if config.is_bg_dark then
        colors = color_set_functions.get_colors_dark(bg)
    else
        colors = color_set_functions.get_colors_light(bg)
    end

    colors = apply_color_overrides(colors)
    ensure_correct_color_types(colors)

    colors = require('mellifluous.colors.shades').extend_with_shades(colors)

    return colors
end

return M
