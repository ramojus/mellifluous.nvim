local M = {}

function M.set(hl, colors)
    local config = require('mellifluous').config
    local bg = hl.get('SignColumn').bg

    if config.is_bg_dark then
        hl.set('GitSignsAdd', { fg = colors.green:with_lightness(40):with_saturation(60).hex, bg = bg })
        hl.set('GitSignsChange', { fg = colors.orange:with_lightness(55):with_saturation(80).hex, bg = bg })
        hl.set('GitSignsDelete', { fg = colors.red:with_lightness(45):with_saturation(60).hex, bg = bg })
    else
        hl.set('GitSignsAdd', { fg = colors.green:with_lightness(75):with_saturation(80).hex, bg = bg })
        hl.set('GitSignsChange', { fg = colors.orange:with_lightness(70):with_saturation(80).hex, bg = bg })
        hl.set('GitSignsDelete', { fg = colors.red:with_lightness(75):with_saturation(80).hex, bg = bg })
    end
end

return M
