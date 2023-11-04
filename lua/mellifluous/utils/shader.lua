local M = {}

function M.get_shade(recipe, target_color)
    local config = require('mellifluous.config').config
    local color
    if type(target_color) == 'string' then -- hex
        color = require'mellifluous.color'.new(target_color)
    else
        color = target_color
    end

    local val = recipe.val == 'ui' and config.ui_color_base_lightness or recipe.val

    if recipe.action == 'li' then
        return color:lightened(val)
    elseif recipe.action == 'da' then
        return color:darkened(val)
    elseif recipe.action == 'with_li' then
        return color:with_lightness(val)
    else
        require('mellifluous').return_error("unknwon shade recipe action: " .. recipe.action)
    end
end

function M.add_shades(shade_recipes, colors)
    local fg = colors.shades_fg or colors.fg
    local shaded_colors = {}

    for shaded_color_name, recipe in pairs(shade_recipes) do
        local target_color = recipe.target == 'fg' and fg or colors[recipe.target]
        shaded_colors[shaded_color_name] = M.get_shade(recipe, target_color)
    end

    return vim.tbl_deep_extend("keep", colors, shaded_colors)
end

function M.get_lower_contrast(color, amount)
    local config = require('mellifluous.config').config
    color = require('mellifluous.color').ensure_correct_type(color)

    if config.is_bg_dark then
        return color:darkened(amount)
    end
    return color:lightened(amount)
end

function M.get_higher_contrast(color, amount)
    local config = require('mellifluous.config').config
    color = require('mellifluous.color').ensure_correct_type(color)

    if config.is_bg_dark then
        return color:lightened(amount)
    end
    return color:darkened(amount)
end

return M
