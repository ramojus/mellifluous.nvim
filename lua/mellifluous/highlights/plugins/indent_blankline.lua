local M = {}

function M.set(hl, colors)
    local config = require('mellifluous').config

	hl.set('IndentBlanklineChar', { fg = (config.is_bg_dark and colors.bg4.hex) or colors.dark_bg2.hex })
	hl.set('IndentBlanklineContextChar', { fg = colors.fg5.hex })
	hl.set('IndentBlanklineSpaceChar', { link = 'Whitespace' })
end

return M
