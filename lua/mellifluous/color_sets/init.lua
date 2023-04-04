local M = {}

function M.get_color_sets_table()
    return {
        mellifluous = 1,
        alduin = 2,
        mountain = 3,
    }
end

local function get_non_nil_bg(get_bg, custom_bg)
    if custom_bg then
        return custom_bg
    end
    return get_bg()
end

-- returns colors as first argument, is_bg_dark as second argument
local function get_colors(color_set_functions, custom_bg)
    local is_light_set_available = color_set_functions.get_bg_light ~= nil
        and color_set_functions.get_colors_light ~= nil
    local is_dark_set_available = color_set_functions.get_bg_dark ~= nil
        and color_set_functions.get_colors_dark ~= nil

    if vim.o.background == 'light'
        and is_light_set_available then
        return color_set_functions.get_colors_light(get_non_nil_bg(color_set_functions.get_bg_light, custom_bg)), false

    elseif is_dark_set_available then
        return color_set_functions.get_colors_dark(get_non_nil_bg(color_set_functions.get_bg_dark, custom_bg)), true

    elseif is_light_set_available then
        return color_set_functions.get_colors_light(get_non_nil_bg(color_set_functions.get_bg_light, custom_bg)), false

    else
        Return_error("Required color set is either incomplete or missing")
    end
end

function M.get_colors(color_set_name)
    if M.get_color_sets_table()[color_set_name] then
        local color_set_functions = require('mellifluous.color_sets.' .. color_set_name)
        return get_colors(color_set_functions, nil)
    end
    Return_error("Color set '" .. color_set_name .. "' not found")
end

return M
