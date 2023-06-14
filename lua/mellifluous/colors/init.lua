local M = {}

function M.get_color_sets_table()
    return {
        mellifluous = 1,
        alduin = 2,
        mountain = 3,
        tender = 4,
    }
end

local function tbl_extend_non_nil(base_table, overlay_table)
    for key, _ in pairs(overlay_table) do
        base_table[key] = overlay_table[key] or base_table[key]
    end
end

local function get_color_overrides(is_bg_dark, color_set_name)
    local color_overrides = vim.tbl_get(Config, color_set_name,
        'color_overrides', is_bg_dark and 'dark' or 'light') or {}

    for key, color in pairs(color_overrides) do
        if color.hex then -- overrides were already converted to mellifluous.color
            break
        end
        color_overrides[key] = require('mellifluous.color').new(color)
    end

    return color_overrides
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
        Return_error("Required color set is either incomplete or missing")
    end
end

function M.get_ui_color_base_lightness(color_set_name, is_bg_dark)
    return require('mellifluous.colors.sets.' .. color_set_name).get_ui_color_base_lightness(is_bg_dark)
end

function M.get_colors()
    if not M.get_color_sets_table()[Config.color_set] then
        Return_error("Color set '" .. Config.color_set .. "' not found")
    end

    local color_overrides = get_color_overrides(Config.is_bg_dark, Config.color_set)

    local color_set_functions = require('mellifluous.colors.sets.' .. Config.color_set)
    local colors
    if Config.is_bg_dark then
        colors = color_set_functions.get_colors_dark(color_overrides.bg or color_set_functions.get_bg_dark())
    else
        colors = color_set_functions.get_colors_light(color_overrides.bg or color_set_functions.get_bg_light())
    end

    tbl_extend_non_nil(colors, color_overrides)

    local shade_recipes = require'mellifluous.colors.shades'.get_recipes()
    colors = require 'mellifluous.utils.shader'.add_shades(shade_recipes, colors)

    return colors
end

return M
