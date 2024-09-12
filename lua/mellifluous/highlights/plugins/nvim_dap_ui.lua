local M = {}

function M.set(hl, colors)
    -- local config = require("mellifluous.config").config
    -- local groups = require("mellifluous.highlights.custom_groups").get(colors)

    hl.set("DapUIVariable", { link = "Identifier" })
    hl.set("DapUIScope", { link = "Title" })
    hl.set("DapUIType", { link = "Type" })
    hl.set("DapUIValue", { fg = colors.ui_red })

    hl.set("DapUIModifiedValue", { fg = colors.ui_yellow, bold = true })
    hl.set("DapUIDecoration", { fg = colors.fg })
    hl.set("DapUIThread", { link = "String" })
    hl.set("DapUIStoppedThread", { link = "Title" })
    hl.set("DapUIFrameName", { link = "Normal" })
    hl.set("DapUISource", { link = "Keyword" })
    hl.set("DapUILineNumber", { link = "Number" })
    hl.set("DapUIFloatBorder", { link = "FloatBorder" })
    hl.set("DapUIWatchesEmpty", { fg = colors.ui_red })
    hl.set("DapUIWatchesValue", { fg = colors.ui_orange })
    hl.set("DapUIWatchesError", { fg = colors.ui_red })
    hl.set("DapUIBreakpointsPath", { link = "Title" })
    hl.set("DapUIBreakpointsInfo", { fg = colors.ui_purple })
    hl.set("DapUIBreakpointsCurrentLine", { fg = colors.ui_yellow, bold = true })
    hl.set("DapUIBreakpointsLine", { link = "DapUILineNumber" })
    hl.set("DapUIBreakpointsDisabledLine", { link = "Comment" })
    hl.set("DapUIPlayPause", { fg = colors.ui_green })
    hl.set("DapUIStop", { fg = colors.ui_red })
    hl.set("DapUIRestart", { fg = colors.ui_yellow })
    hl.set("DapUIStepOver", { fg = colors.ui_blue })
    hl.set("DapUIStepInto", { fg = colors.ui_blue })
    hl.set("DapUIStepBack", { fg = colors.ui_blue })
    hl.set("DapUIStepOut", { fg = colors.ui_blue })
end

return M
