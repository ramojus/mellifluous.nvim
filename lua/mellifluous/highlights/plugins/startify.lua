local M = {}

function M.set(hl, colors)
	hl.set('StartifyBracket', { fg = colors.fg4.hex })
	hl.set('StartifyNumber', { fg = colors.fg.hex })
	hl.set('StartifyPath', { fg = colors.blue.hex })
	hl.set('StartifySlash', { link = 'StartifyPath' })
end

return M
