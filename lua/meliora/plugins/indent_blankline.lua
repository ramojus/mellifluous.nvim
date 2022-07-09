return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require 'lush'

    return lush(function()
        return {
            indentblanklinechar { fg = colors.bg4 },
            indentblanklinecontextchar { fg = colors.fg4 },
            IndentBlanklineSpaceChar { highlights.Whitespace },
        }
    end)
end
