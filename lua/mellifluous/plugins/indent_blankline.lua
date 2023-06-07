return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require('lush')
    local config = require('mellifluous').config

    return lush(function()
        return {
            IndentBlanklineChar { fg = (config.is_bg_dark and colors.bg4.hex) or colors.dark_bg2.hex },
            IndentBlanklineContextChar { fg = colors.fg5.hex },
            IndentBlanklineSpaceChar { highlights.Whitespace },
        }
    end)
end
