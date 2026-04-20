local M = {}

function M.set(hl, colors)
    local groups = require("mellifluous.highlights.custom_groups").get(colors)
    local config = require("mellifluous.config").config
    local transparent = config.transparent_background.floating_windows
    local float_bg = transparent and "NONE" or hl.get("NormalFloat").bg
    local normal_bg = transparent and "NONE" or hl.get("Normal").bg

    hl.set("SnacksNotifierDebug", { fg = colors.fg, bg = normal_bg })
    hl.set("SnacksNotifierBorderDebug", { fg = colors.green, bg = normal_bg })
    hl.set("SnacksNotifierIconDebug", { fg = colors.green })
    hl.set("SnacksNotifierTitleDebug", { fg = colors.green })
    hl.set("SnacksNotifierError", { fg = colors.fg, bg = normal_bg })
    hl.set("SnacksNotifierBorderError", { fg = colors.red, bg = normal_bg })
    hl.set("SnacksNotifierIconError", { fg = colors.red })
    hl.set("SnacksNotifierTitleError", { fg = colors.red })
    hl.set("SnacksNotifierInfo", { fg = colors.fg, bg = normal_bg })
    hl.set("SnacksNotifierBorderInfo", { fg = colors.blue, bg = normal_bg })
    hl.set("SnacksNotifierIconInfo", { fg = colors.blue })
    hl.set("SnacksNotifierTitleInfo", { fg = colors.blue })
    hl.set("SnacksNotifierTrace", { fg = colors.fg, bg = normal_bg })
    hl.set("SnacksNotifierBorderTrace", { fg = colors.magenta, bg = normal_bg })
    hl.set("SnacksNotifierIconTrace", { fg = colors.magenta })
    hl.set("SnacksNotifierTitleTrace", { fg = colors.magenta })
    hl.set("SnacksNotifierWarn", { fg = colors.fg, bg = normal_bg })
    hl.set("SnacksNotifierBorderWarn", { fg = colors.yellow, bg = normal_bg })
    hl.set("SnacksNotifierIconWarn", { fg = colors.yellow })
    hl.set("SnacksNotifierTitleWarn", { fg = colors.yellow })

    hl.set("SnacksDashboardDesc", { fg = colors.green })
    hl.set("SnacksDashboardFooter", { fg = colors.cyan, bold = true })
    hl.set("SnacksDashboardHeader", { fg = colors.cyan })
    hl.set("SnacksDashboardIcon", { fg = colors.green })
    hl.set("SnacksDashboardKey", { fg = colors.yellow })
    hl.set("SnacksDashboardSpecial", { fg = colors.red })
    hl.set("SnacksDashboardDir", { fg = colors.fg4 })

    hl.set("SnacksProfilerIconInfo", { bg = colors.bg3, fg = colors.green })
    hl.set("SnacksProfilerBadgeInfo", { bg = hl.get("CursorLine").bg, fg = colors.green })
    hl.set("SnacksFooterKey", { link = "SnacksProfilerIconInfo" })
    hl.set("SnacksFooterDesc", { link = "SnacksProfilerBadgeInfo" })
    hl.set("SnacksProfilerIconTrace", { bg = colors.green, fg = float_bg })
    hl.set("SnacksProfilerBadgeTrace", { bg = colors.green, fg = float_bg })
    hl.set("SnacksIndent", { fg = hl.get("Number").fg, nocombine = true })
    hl.set("SnacksIndentScope", { fg = colors.cyan, nocombine = true })
    hl.set("SnacksZenIcon", { fg = colors.red })
    hl.set("SnacksInputIcon", { fg = colors.red })
    hl.set("SnacksInputBorder", { fg = colors.yellow })
    hl.set("SnacksInputTitle", { fg = colors.yellow })

    local picker_normal = { bg = colors.dark_bg, fg = colors.fg3 }
    local preview_normal = hl.get("Normal")
    local picker_border
    local preview_border
    if transparent or config.flat_background.floating_windows then
        picker_normal.bg = hl.get("Normal").bg
        preview_normal.bg = hl.get("Normal").bg
        picker_border = { bg = picker_normal.bg, fg = hl.get("FloatBorder").fg }
        preview_border = { bg = preview_normal.bg, fg = hl.get("FloatBorder").fg }
    else
        picker_border = { bg = picker_normal.bg, fg = picker_normal.bg }
        preview_border = { bg = preview_normal.bg, fg = preview_normal.bg }
    end

    hl.set("SnacksPicker", picker_normal)
    hl.set("SnacksPickerBorder", picker_border)
    hl.set("SnacksPickerTitle", { bg = picker_normal.bg, fg = hl.get("Normal").fg, style = { bold = true } })
    hl.set("SnacksPickerFooter", { bg = picker_normal.bg, fg = colors.fg4 })
    hl.set("SnacksPickerInput", { bg = picker_normal.bg, fg = picker_normal.fg })
    hl.set("SnacksPickerInputBorder", picker_border)
    hl.set("SnacksPickerInputTitle", { bg = picker_normal.bg, fg = hl.get("Normal").fg, style = { bold = true } })
    hl.set("SnacksPickerPrompt", { fg = colors.fg4 })
    hl.set("SnacksPickerPreview", { bg = preview_normal.bg, fg = preview_normal.fg })
    hl.set("SnacksPickerPreviewBorder", preview_border)
    hl.set("SnacksPickerPreviewTitle", { bg = preview_normal.bg, fg = preview_normal.fg, style = { bold = true } })
    hl.set("SnacksPickerBox", picker_normal)
    hl.set("SnacksPickerBoxBorder", picker_border)
    hl.set("SnacksPickerBoxTitle", { bg = picker_normal.bg, fg = hl.get("Normal").fg, style = { bold = true } })
    hl.set("SnacksPickerCursorLine", {
        bg = groups.MenuButtonSelected(picker_normal.bg).bg,
        fg = picker_normal.fg,
        style = { bold = false, nocombine = true },
    })
    hl.set("SnacksPickerMatch", { fg = colors.fg })
    hl.set("SnacksPickerSelected", { fg = colors.magenta })
    hl.set("SnacksPickerToggle", { link = "SnacksProfilerBadgeInfo" })
    hl.set("SnacksPickerPickWinCurrent", { fg = colors.fg, bg = colors.magenta, bold = true })
    hl.set("SnacksPickerPickWin", { fg = colors.fg, bg = colors.red, bold = true })

    hl.set("SnacksBackdrop", groups.Backdrop)
end

return M
