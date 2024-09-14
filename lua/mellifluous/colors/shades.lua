local M = {}

function M.extend_with_shades(colors)
    local config = require("mellifluous.config").config

    local shared_shades = {
        ui_red = colors.red:with_lightness(config.ui_color_base_lightness),
        ui_orange = colors.orange:with_lightness(config.ui_color_base_lightness),
        ui_green = colors.green:with_lightness(config.ui_color_base_lightness),
        ui_blue = colors.blue:with_lightness(config.ui_color_base_lightness),
        ui_purple = colors.purple:with_lightness(config.ui_color_base_lightness),
        ui_yellow = colors.yellow:with_lightness(config.ui_color_base_lightness),
    }

    local shades = {}
    local fg = colors.shades_fg or colors.fg

    if config.is_bg_dark then
        shades = {
            fg2 = fg:darkened(16),
            fg3 = fg:darkened(32),
            fg4 = fg:darkened(48),
            fg5 = fg:darkened(54),
            dark_bg = colors.bg:darkened(2.5),
            bg2 = colors.bg:lightened(4),
            bg3 = colors.bg:lightened(6),
            bg4 = colors.bg:lightened(8),
            bg5 = colors.bg:lightened(10),
        }
    else
        shades = {
            fg2 = fg:lightened(16),
            fg3 = fg:lightened(32),
            fg4 = fg:lightened(48),
            fg5 = fg:lightened(54),
            dark_bg2 = colors.bg:darkened(8),
            dark_bg = colors.bg:darkened(2.5),
            bg2 = colors.bg:lightened(4),
            bg3 = colors.bg:lightened(6),
            bg4 = colors.bg:lightened(8),
        }
    end

    colors = vim.tbl_extend("keep", colors, shared_shades)
    return vim.tbl_extend("keep", colors, shades)
end

return M
