local M = {}

function M.set(hl, colors)
    local config = require('mellifluous.config').config

    hl.set('MasonHeader', { fg = colors.dark_bg, bg = colors.ui_orange, bold = true })
    hl.set('MasonHeaderSecondary', { fg = colors.dark_bg, bg = colors.ui_blue, bold = true })
    hl.set('MasonHighlightBlockBold', { fg = colors.fg, bg = config.is_bg_dark and colors.bg5 or colors.bg4, bold = true })
    hl.set('MasonHighlightBlockBoldSecondary', { link = 'MasonHighlightBlockBold' })
    hl.set('MasonHighlightBlock', { fg = colors.dark_bg, bg = colors.ui_green })
    hl.set('MasonMutedBlock', { fg = colors.fg2, bg = colors.bg })
    hl.set('MasonHighlight', { fg = colors.ui_yellow })
    hl.set('MasonHighlightSecondary', { fg = colors.ui_purple })
    hl.set('MasonMuted', { fg = colors.fg3 })
end

return M
