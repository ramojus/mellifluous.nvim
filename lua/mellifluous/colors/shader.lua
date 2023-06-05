local M = {}

function M.get_dark_bg_shade_recipes()
    return {
        fg2 = { target = 'fg', action = 'da', val = 16 },
        fg3 = { target = 'fg', action = 'da', val = 32 },
        fg4 = { target = 'fg', action = 'da', val = 48 },
        fg5 = { target = 'fg', action = 'da', val = 64 },
        dark_bg = { target = 'bg', action = 'da', val = 12 },
        bg2 = { target = 'bg', action = 'li', val = 3 },
        bg3 = { target = 'bg', action = 'li', val = 6 },
        bg4 = { target = 'bg', action = 'li', val = 8 },
        bg5 = { target = 'bg', action = 'li', val = 10 },
    }
end

function M.get_light_bg_shade_recipes()
    return {
        fg2 = { target = 'fg', action = 'li', val = 16 },
        fg3 = { target = 'fg', action = 'li', val = 32 },
        fg4 = { target = 'fg', action = 'li', val = 48 },
        fg5 = { target = 'fg', action = 'li', val = 64 },
        dark_bg2 = { target = 'bg', action = 'da', val = 10 },
        dark_bg = { target = 'bg', action = 'da', val = 3 },
        bg2 = { target = 'bg', action = 'li', val = 32 },
        bg3 = { target = 'bg', action = 'li', val = 64 },
        bg4 = { target = 'bg', action = 'li', val = 88 },
    }
end

local function apply_shade(recipe, target_color)
    if recipe.action == 'li' then
        return target_color.li(recipe.val)
    else
        return target_color.da(recipe.val)
    end
end

function M.shade(colors, is_bg_dark)
    local fg = colors.shades_fg or colors.fg
    local bg = colors.bg
    local shade_recipes = is_bg_dark and M.get_dark_bg_shade_recipes() or M.get_light_bg_shade_recipes()
    local shaded_colors = {}

    for shaded_color_name, recipe in pairs(shade_recipes) do
        local target_color = recipe.target == 'fg' and fg or bg
        shaded_colors[shaded_color_name] = apply_shade(recipe, target_color)
    end

    return vim.tbl_deep_extend("keep", colors, shaded_colors)
end

return M
