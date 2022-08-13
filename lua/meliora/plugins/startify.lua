
return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require 'lush'

    return lush(function()
        return {
            StartifyBracket { fg = colors.fg4 },
            StartifyNumber { fg = colors.fg },
            StartifyPath { fg = colors.fg3 },
            StartifySlash { StartifyPath },
        }
    end)
end
