local M = {}

function M.set(hl, colors)
    local groups = require("mellifluous.highlights.custom_groups").get(colors)
    local bg = hl.get("NormalFloat").bg

    hl.set("MasonHeader", { fg = colors.dark_bg, bg = colors.ui_orange, bold = true })
    hl.set("MasonHeaderSecondary", { fg = colors.dark_bg, bg = colors.ui_blue, bold = true })
    hl.set("MasonHighlightBlockBold", groups.MenuButtonSelected(bg))
    hl.set("MasonHighlightBlockBoldSecondary", { link = "MasonHighlightBlockBold" })
    hl.set("MasonHighlightBlock", { fg = colors.dark_bg, bg = colors.ui_green })
    hl.set("MasonMutedBlock", groups.MenuButton)
    hl.set("MasonHighlight", { fg = colors.ui_yellow })
    hl.set("MasonHighlightSecondary", { fg = colors.ui_purple })
    hl.set("MasonMuted", { fg = colors.fg3 })
end

return M
