local M = {}

function M.set(hl, colors)
  hl.set("NotifyERRORBorder", { fg = colors.red, bg = colors.bg })
  hl.set("NotifyWARNBorder", { fg = colors.yellow, bg = colors.bg })
  hl.set("NotifyINFOBorder", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyDEBUGBorder", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyTRACEBorder", { fg = colors.fg2, bg = colors.bg })

  hl.set("NotifyERRORIcon", { fg = colors.red, bg = colors.bg })
  hl.set("NotifyWARNIcon", { fg = colors.yellow, bg = colors.bg })
  hl.set("NotifyINFOIcon", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyDEBUGIcon", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyTRACEIcon", { fg = colors.fg2, bg = colors.bg })

  hl.set("NotifyERRORTitle", { fg = colors.red, bg = colors.bg })
  hl.set("NotifyWARNTitle", { fg = colors.yellow, bg = colors.bg })
  hl.set("NotifyINFOTitle", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyDEBUGTitle", { fg = colors.fg2, bg = colors.bg })
  hl.set("NotifyTRACETitle", { fg = colors.fg2, bg = colors.bg })
end

return M
