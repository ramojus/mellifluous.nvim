local M = {}

function M.set(hl, colors)
    local config = require('mellifluous.config').config

    hl.set('IblIndent', { fg = (config.is_bg_dark and colors.bg4) or colors.dark_bg2 })
    hl.set('IblScope', { fg = colors.fg5 })
    hl.set('IblWhitespace', { link = 'Whitespace' })
end

return M
