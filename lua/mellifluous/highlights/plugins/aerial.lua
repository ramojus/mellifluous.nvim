local M = {}

function M.set(hl, colors)
  hl.set("AerialNormal", { fg = colors.fg2 })
  hl.set("AerialLine", { fg = colors.ui_orange })
  hl.set("AerialLineNC", { fg = colors.ui_orange })
end

return M
