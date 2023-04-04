local M = {}

function M.get_color_sets_table()
    return {
        mellifluous = 1,
        alduin = 2,
        mountain = 3,
    }
end

local function get_colors(color_set_functions, custom_bg)
    local is_light_set_available = color_set_functions.get_bg_light ~= nil
        and color_set_functions.get_colors_light ~= nil
    local is_dark_set_available = color_set_functions.get_bg_dark ~= nil
        and color_set_functions.get_colors_dark ~= nil

    local is_bg_dark
    if vim.o.background == 'light' and is_light_set_available then
        is_bg_dark = false
    elseif is_dark_set_available then
        is_bg_dark = true
    elseif is_light_set_available then
        is_bg_dark = false
    else
        Return_error("Required color set is either incomplete or missing")
    end

    local colors
    if is_bg_dark then
        colors = color_set_functions.get_colors_dark(custom_bg or color_set_functions.get_bg_dark())
    else
        colors = color_set_functions.get_colors_light(custom_bg or color_set_functions.get_bg_light())
    end

    colors = require'mellifluous.colors.shader'.shade(colors, is_bg_dark)

    return colors, is_bg_dark
end

function M.get_colors(color_set_name)
    if M.get_color_sets_table()[color_set_name] then
        local color_set_functions = require('mellifluous.colors.sets.' .. color_set_name)
        return get_colors(color_set_functions, nil)
    end
    Return_error("Color set '" .. color_set_name .. "' not found")
end

return M
