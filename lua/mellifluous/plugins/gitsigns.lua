return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require 'lush'
    local config = require 'mellifluous'.config
    local bg = highlights.SignColumn.bg

    return lush(function()
        if config.dark then
            return {
                GitSignsAdd { fg = colors.green.lightness(30), bg = bg },
                GitSignsChange { fg = colors.orange.lightness(40), bg = bg },
                GitSignsDelete { fg = colors.red.lightness(40), bg = bg },
            }
        else
            return {
                GitSignsAdd { fg = colors.green.lightness(50).sa(30), bg = bg },
                GitSignsChange { fg = colors.orange.lightness(60).sa(30), bg = bg },
                GitSignsDelete { fg = colors.red.lightness(60).sa(30), bg = bg },
            }
        end
    end)
end
