local M = {}

function M.get_shade_recipes(is_bg_dark)
    if is_bg_dark then
        return {
            fg2 = { target = 'fg', action = 'da', val = 16 },
            fg3 = { target = 'fg', action = 'da', val = 32 },
            fg4 = { target = 'fg', action = 'da', val = 48 },
            fg5 = { target = 'fg', action = 'da', val = 64 },
            dark_bg = { target = 'bg', action = 'da', val = 2.5 },
            bg2 = { target = 'bg', action = 'li', val = 4 },
            bg3 = { target = 'bg', action = 'li', val = 6 },
            bg4 = { target = 'bg', action = 'li', val = 8 },
            bg5 = { target = 'bg', action = 'li', val = 10 },
        }
    else
        return {
            fg2 = { target = 'fg', action = 'li', val = 16 },
            fg3 = { target = 'fg', action = 'li', val = 32 },
            fg4 = { target = 'fg', action = 'li', val = 48 },
            fg5 = { target = 'fg', action = 'li', val = 64 },
            dark_bg2 = { target = 'bg', action = 'da', val = 8 },
            dark_bg = { target = 'bg', action = 'da', val = 2.5 },
            bg2 = { target = 'bg', action = 'li', val = 4 },
            bg3 = { target = 'bg', action = 'li', val = 6 },
            bg4 = { target = 'bg', action = 'li', val = 8 },
        }
    end
end

function M.apply_shade(recipe, target_color)
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

function M.shade(colors, is_bg_dark)
    local fg = colors.shades_fg or colors.fg
    local bg = colors.bg
    local shade_recipes = M.get_shade_recipes(is_bg_dark)
    local shaded_colors = {}

    for shaded_color_name, recipe in pairs(shade_recipes) do
        local target_color = recipe.target == 'fg' and fg or bg
        shaded_colors[shaded_color_name] = M.apply_shade(recipe, target_color)
    end

    return vim.tbl_deep_extend("keep", colors, shaded_colors)
end

return M
