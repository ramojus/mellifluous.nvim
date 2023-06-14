local M = {}

function M.get_shade(recipe, target_color)
    local color
    if type(target_color) == 'string' then -- hex
        color = require'mellifluous.color'.new(target_color)
    else
        color = target_color
    end

    if recipe.action == 'li' then
        return color:lightened(recipe.val)
    else
        return color:darkened(recipe.val)
    end
end

function M.add_shades(shade_recipes, colors)
    local fg = colors.shades_fg or colors.fg
    local bg = colors.bg
    local shaded_colors = {}

    for shaded_color_name, recipe in pairs(shade_recipes) do
        local target_color = recipe.target == 'fg' and fg or bg
        shaded_colors[shaded_color_name] = M.get_shade(recipe, target_color)
    end

    return vim.tbl_deep_extend("keep", colors, shaded_colors)
end

function M.get_lower_contrast(color, amount)
    color = require('mellifluous.color').ensure_correct_type(color)

    if Config.is_bg_dark then
        return color:darkened(amount)
    end
    return color:lightened(amount)
end

function M.get_higher_contrast(color, amount)
    color = require('mellifluous.color').ensure_correct_type(color)

    if Config.is_bg_dark then
        return color:lightened(amount)
    end
    return color:darkened(amount)
end

return M
