local M = {}

function M.set(hl, colors)
    hl.set("StartifyBracket", { fg = colors.fg4 })
    hl.set("StartifyNumber", { fg = colors.fg })
    hl.set("StartifyPath", { fg = colors.blue })
    hl.set("StartifySlash", { link = "StartifyPath" })
end

return M
