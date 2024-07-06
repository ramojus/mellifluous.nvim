local M = {}

function M.set(hl, colors)
    hl.set("AerialNormal", { fg = colors.fg2 })
    hl.set("AerialLine", { fg = colors.fg, bg = colors.b4 })
    hl.set("AerialLineNC", { fg = colors.fg2, bg = colors.bg3 })
end

return M
