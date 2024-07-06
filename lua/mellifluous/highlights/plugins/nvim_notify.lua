local M = {}

function M.set(hl, colors)
    hl.set("NotifyERRORBorder", { fg = colors.fg5 })
    hl.set("NotifyWARNBorder", { fg = colors.fg5 })
    hl.set("NotifyINFOBorder", { fg = colors.fg5 })
    hl.set("NotifyDEBUGBorder", { fg = colors.fg5 })
    hl.set("NotifyTRACEBorder", { fg = colors.fg5 })

    hl.set("NotifyERRORIcon", { fg = colors.ui_red })
    hl.set("NotifyWARNIcon", { fg = colors.ui_orange })
    hl.set("NotifyINFOIcon", { fg = colors.ui_blue })
    hl.set("NotifyDEBUGIcon", { fg = colors.ui_purple })
    hl.set("NotifyTRACEIcon", { fg = colors.ui_yellow })

    hl.set("NotifyERRORTitle", { fg = colors.fg2 })
    hl.set("NotifyWARNTitle", { fg = colors.fg2 })
    hl.set("NotifyINFOTitle", { fg = colors.fg2 })
    hl.set("NotifyDEBUGTitle", { fg = colors.fg2 })
    hl.set("NotifyTRACETitle", { fg = colors.fg2 })
end

return M
