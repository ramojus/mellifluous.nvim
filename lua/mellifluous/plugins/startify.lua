
return function(_, colors)
    ---@diagnostic disable: undefined-global
    local lush = require('lush')

    return lush(function()
        return {
            StartifyBracket { fg = colors.fg4.hex },
            StartifyNumber { fg = colors.fg.hex },
            StartifyPath { fg = colors.blue.hex },
            StartifySlash { StartifyPath },
        }
    end)
end
