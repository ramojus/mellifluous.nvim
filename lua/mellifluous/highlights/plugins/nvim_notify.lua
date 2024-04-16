local M = {}

function M.set(hl, colors)
  hl.set("NotifyERRORBorder", { fg = colors.fg5, bg = colors.bg })
  hl.set("NotifyWARNBorder", { fg = colors.fg5, bg = colors.bg })
  hl.set("NotifyINFOBorder", { fg = colors.fg5, bg = colors.bg })
  hl.set("NotifyDEBUGBorder", { fg = colors.fg5, bg = colors.bg })
  hl.set("NotifyTRACEBorder", { fg = colors.fg5, bg = colors.bg })

  hl.set("NotifyERRORIcon", { fg = colors.ui_red, bg = colors.bg })
  hl.set("NotifyWARNIcon", { fg = colors.ui_orange, bg = colors.bg })
  hl.set("NotifyINFOIcon", { fg = colors.ui_blue, bg = colors.bg })
  hl.set("NotifyDEBUGIcon", { fg = colors.ui_purple, bg = colors.bg })
  hl.set("NotifyTRACEIcon", { fg = colors.ui_yellow, bg = colors.bg })

  hl.set("NotifyERRORTitle", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyWARNTitle", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyINFOTitle", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyDEBUGTitle", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyTRACETitle", { fg = colors.fg2, bg = colors.bg })
end

return M
