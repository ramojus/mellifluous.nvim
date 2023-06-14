local M = {}

function M.set(hl, colors)
    hl.set('IndentBlanklineChar', { fg = (Config.is_bg_dark and colors.bg4) or colors.dark_bg2 })
    hl.set('IndentBlanklineContextChar', { fg = colors.fg5 })
    hl.set('IndentBlanklineSpaceChar', { link = 'Whitespace' })
end

return M
