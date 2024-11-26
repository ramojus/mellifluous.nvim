local M = {}

function M.set(hl, colors)
    local normal = hl.get("Normal")
    local normal_float = hl.get("NormalFloat")

    hl.set("FzfLuaNormal", { bg = colors.dark_bg, fg = normal_float.fg })
    hl.set("FzfLuaBorder", { bg = colors.dark_bg, fg = colors.dark_bg })
    hl.set("FzfLuaTitle", { fg = normal.fg })
    hl.set("FzfLuaBackdrop", { bg = normal.bg, fg = normal.fg })
    hl.set("FzfLuaPreviewNormal", { bg = normal.bg, fg = normal.fg })
    hl.set("FzfLuaPreviewBorder", { bg = normal.bg, fg = normal.bg })
    hl.set("FzfLuaPreviewTitle", { link = "FzfLuaTitle" })
    hl.set("FzfLuaCursorLine", { bg = colors.bg2 })
    hl.set("FzfLuaScrollBorderFull", { fg = colors.bg4 })
    hl.set("FzfLuaScrollBorderEmpty", { fg = colors.bg })
    hl.set("FzfLuaScrollFloatFull", { link = "FzfLuaScrollBorderFull" })
    hl.set("FzfLuaScrollFloatEmpty", { link = "FzfLuaScrollBorderEmpty" })
    hl.set("FzfLuaHeaderBind", { fg = colors.ui_purple })
    hl.set("FzfLuaHeaderText", { fg = colors.fg2 })
    hl.set("FzfLuaPathLineNr", { fg = colors.fg4 })
    hl.set("FzfLuaPathColNr", { fg = colors.fg4 })
    hl.set("FzfLuaBufName", { fg = colors.ui_yellow })
    hl.set("FzfLuaBufNr", { fg = colors.fg4 })
    hl.set("FzfLuaBufFlagCur", { fg = colors.fg })
    hl.set("FzfLuaBufFlagAlt", { fg = colors.fg2 })
    hl.set("FzfLuaTabTitle", { link = "FzfLuaTitle" })
    hl.set("FzfLuaTabMarker", { fg = colors.fg2 })
    hl.set("FzfLuaLiveSym", { fg = colors.ui_green })
    hl.set("FzfLuaFzfMatch", { fg = colors.ui_green })
    hl.set("FzfLuaFzfGutter", { fg = colors.bg, bg = colors.bg })
end

return M
