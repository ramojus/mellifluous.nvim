local M = {}

function M.set(hl, colors)
    local bg = hl.get('SignColumn').bg
    local config = require('mellifluous.config').config

    if config.is_bg_dark then
        hl.set('GitSignsAdd', { fg = colors.green:with_lightness(40):with_saturation(60), bg = bg })
        hl.set('GitSignsChange', { fg = colors.orange:with_lightness(55):with_saturation(80), bg = bg })
        hl.set('GitSignsDelete', { fg = colors.red:with_lightness(45):with_saturation(60), bg = bg })
    else
        hl.set('GitSignsAdd', { fg = colors.green:with_lightness(75):with_saturation(80), bg = bg })
        hl.set('GitSignsChange', { fg = colors.orange:with_lightness(70):with_saturation(80), bg = bg })
        hl.set('GitSignsDelete', { fg = colors.red:with_lightness(75):with_saturation(80), bg = bg })
    end
end

return M
