local M = {}

function M.set(hl, colors)
    local config = require('mellifluous.config').config

    hl.set('IndentBlanklineChar', { fg = (config.is_bg_dark and colors.bg4) or colors.dark_bg2 })
    hl.set('IndentBlanklineContextChar', { fg = colors.fg5 })
    hl.set('IndentBlanklineSpaceChar', { link = 'Whitespace' })
end

return M
