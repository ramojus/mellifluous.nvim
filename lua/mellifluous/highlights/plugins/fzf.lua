local M = {}

function M.set(hl, colors)
    local groups = require("mellifluous.highlights.custom_groups").get(colors)

    local normal = hl.get("Normal")

    hl.set("FzfLuaNormal", { bg = colors.dark_bg, fg = colors.fg3 })
    hl.set("FzfLuaBorder", { bg = colors.dark_bg, fg = colors.dark_bg })
    hl.set("FzfLuaTitle", { bg = colors.dark_bg, fg = normal.fg, style = { bold = true } })
    hl.set("FzfLuaPreviewNormal", { bg = normal.bg, fg = normal.fg })
    hl.set("FzfLuaPreviewBorder", { bg = normal.bg, fg = normal.bg })
    hl.set("FzfLuaPreviewTitle", { bg = normal.bg, fg = normal.fg, style = { bold = true } })
    hl.set("FzfLuaCursorLineNr", { fg = colors.fg4 })
    hl.set("FzfLuaScrollBorderFull", { fg = colors.bg4 })
    hl.set("FzfLuaScrollBorderEmpty", { fg = colors.bg })
    hl.set("FzfLuaScrollFloatFull", { link = "FzfLuaScrollBorderFull" })
    hl.set("FzfLuaScrollFloatEmpty", { link = "FzfLuaScrollBorderEmpty" })
    hl.set("FzfLuaHeaderBind", { fg = colors.ui_purple })
    hl.set("FzfLuaHeaderText", { fg = colors.fg4 })
    hl.set("FzfLuaPathLineNr", { fg = colors.fg4 })
    hl.set("FzfLuaPathColNr", { fg = colors.fg4 })
    hl.set("FzfLuaBufName", { fg = colors.ui_orange })
    hl.set("FzfLuaBufNr", { fg = colors.fg4 })
    hl.set("FzfLuaBufFlagCur", { fg = colors.ui_purple })
    hl.set("FzfLuaBufFlagAlt", { fg = colors.ui_green })
    hl.set("FzfLuaTabTitle", { link = "FzfLuaTitle" })
    hl.set("FzfLuaTabMarker", { fg = colors.ui_purple })
    hl.set("FzfLuaLiveSym", { fg = colors.fg })
    hl.set("FzfLuaFzfHeader", { fg = colors.fg4 })
    hl.set("FzfLuaFzfMatch", { fg = colors.fg })
    hl.set("FzfLuaFzfScrollbar", { fg = colors.fg4 })
    hl.set("FzfLuaFzfSeparator", { fg = colors.dark_bg })
    hl.set("FzfLuaFzfGutter", { bg = colors.dark_bg })
    hl.set("FzfLuaFzfPointer", { fg = colors.fg4, style = { bold = false, nocombine = true } })
    hl.set("FzfLuaFzfCursorLine", {
        bg = groups.MenuButtonSelected(colors.dark_bg).bg,
        fg = colors.fg3,
        style = { bold = false, nocombine = true }
    })
    hl.set("FzfLuaFzfMarker", { fg = colors.ui_orange })
    hl.set("FzfLuaFzfPrompt", { fg = colors.fg4 })
    hl.set("FzfLuaFzfQuery", { fg = colors.fg })
end

return M
