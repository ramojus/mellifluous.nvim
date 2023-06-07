return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require('lush')
    local config = require('mellifluous').config
    local bg = highlights.SignColumn.bg

    return lush(function()
        if config.is_bg_dark then
            return {
                GitSignsAdd { fg = colors.green:with_lightness(40):with_saturation(60).hex, bg = bg },
                GitSignsChange { fg = colors.orange:with_lightness(55):with_saturation(80).hex, bg = bg },
                GitSignsDelete { fg = colors.red:with_lightness(45):with_saturation(60).hex, bg = bg },
            }
        else
            return {
                GitSignsAdd { fg = colors.green:with_lightness(75):with_saturation(80).hex, bg = bg },
                GitSignsChange { fg = colors.orange:with_lightness(70):with_saturation(80).hex, bg = bg },
                GitSignsDelete { fg = colors.red:with_lightness(75):with_saturation(80).hex, bg = bg },
            }
        end
    end)
end
