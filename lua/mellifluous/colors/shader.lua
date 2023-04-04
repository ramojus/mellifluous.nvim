local M = {}

local function apply_dark_bg_shades(colors)
    local fg = colors.shades_fg or colors.fg
    local bg = colors.bg
    return {
        fg2 = fg.da(16),
        fg3 = fg.da(32),
        fg4 = fg.da(48),
        fg5 = fg.da(64),

        dark_bg = bg.da(12),
        bg2 = bg.li(3),
        bg3 = bg.li(6),
        bg4 = bg.li(8),
        bg5 = bg.li(10),
    }
end

local function apply_light_bg_shades(colors)
    local fg = colors.shades_fg or colors.fg
    local bg = colors.bg
    return {
        fg2 = fg.li(16),
        fg3 = fg.li(32),
        fg4 = fg.li(48),
        fg5 = fg.li(64),

        dark_bg2 = bg.da(10),
        dark_bg = bg.da(3),
        bg2 = bg.li(32),
        bg3 = bg.li(64),
        bg4 = bg.li(88),
    }
end

function M.shade(colors, is_bg_dark)
    local shades = {}
    if is_bg_dark then
        shades = apply_dark_bg_shades(colors)
    else
        shades = apply_light_bg_shades(colors)
    end

    return vim.tbl_deep_extend("keep", colors, shades)
end

return M
