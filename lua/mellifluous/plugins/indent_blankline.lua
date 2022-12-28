return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require('lush')
    local config = require('mellifluous').config

    return lush(function()
        return {
            IndentBlanklineChar { fg = (config.dark and colors.bg4) or colors.dark_bg2 },
            IndentBlanklineContextChar { fg = colors.fg5 },
            IndentBlanklineSpaceChar { highlights.Whitespace },
        }
    end)
end
