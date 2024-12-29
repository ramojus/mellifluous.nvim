local M = {}

function M.set(hl, colors)
    local groups = require("mellifluous.highlights.custom_groups").get(colors)
    local config = require("mellifluous.config").config

    local preview_normal = hl.get("Normal")
    local search_normal = { bg = colors.dark_bg, fg = colors.fg3 }
    local preview_border
    local search_border
    if config.transparent_background.floating_windows or config.flat_background.floating_windows then
        search_normal.bg = hl.get("Normal").bg
        preview_normal.bg = hl.get("Normal").bg
        search_border = { bg = search_normal.bg, fg = hl.get("FloatBorder").fg }
        preview_border = { bg = preview_normal.bg, fg = hl.get("FloatBorder").fg }
    else
        search_border = { bg = search_normal.bg, fg = search_normal.bg }
        preview_border = { bg = preview_normal.bg, fg = preview_normal.bg }
    end

    hl.set("FzfLuaNormal", search_normal)
    hl.set("FzfLuaBorder", search_border)
    hl.set("FzfLuaTitle", { bg = search_normal.bg, fg = hl.get("Normal").fg, style = { bold = true } })
    hl.set("FzfLuaPreviewNormal", { bg = preview_normal.bg, fg = preview_normal.fg })
    hl.set("FzfLuaPreviewBorder", preview_border)
    hl.set("FzfLuaPreviewTitle", { bg = preview_normal.bg, fg = preview_normal.fg, style = { bold = true } })
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
    hl.set("FzfLuaFzfSeparator", { fg = search_normal.bg })
    hl.set("FzfLuaFzfGutter", { bg = search_normal.bg })
    hl.set("FzfLuaFzfPointer", { fg = colors.fg4, style = { bold = false, nocombine = true } })
    hl.set("FzfLuaFzfCursorLine", {
        bg = groups.MenuButtonSelected(search_normal.bg).bg,
        fg = search_normal.fg,
        style = { bold = false, nocombine = true },
    })
    hl.set("FzfLuaFzfMarker", { fg = colors.ui_orange })
    hl.set("FzfLuaFzfPrompt", { fg = colors.fg4 })
    hl.set("FzfLuaFzfQuery", { fg = colors.fg })
    hl.set("FzfLuaBackdrop", groups.Backdrop)
end

return M
