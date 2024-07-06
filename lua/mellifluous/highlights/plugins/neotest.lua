local M = {}

function M.set(hl, colors)
    local config = require("mellifluous.config").config
    local groups = require("mellifluous.highlights.custom_groups").get(colors)

    hl.set("NeotestAdapterName", { fg = colors.fg3 })
    hl.set("NeotestFocused", { fg = hl.get("Normal").fg, bold = true })
    hl.set("NeotestTarget", { style = { underline = true } })
    hl.set("NeotestIndent", groups.IndentLine(colors.bg))
    hl.set("NeotestExpandMarker", { link = "NeotestIndent" })

    hl.set("NeotestDir", { fg = hl.get("Directory").fg })
    hl.set("NeotestFile", { fg = colors.fg2 })
    hl.set("NeotestNamespace", { link = "@namesapce" })

    hl.set("NeotestTest", { fg = colors.fg })
    hl.set("NeotestRunning", { fg = hl.get("Function").fg })
    hl.set("NeotestPassed", { link = "@markup.list.checked" })
    hl.set("NeotestFailed", { fg = colors.ui_red })
    hl.set("NeotestSkipped", { fg = colors.fg })
    hl.set("NeotestUnknown", { fg = colors.fg })
    hl.set("NeotestMarked", { bg = (config.is_bg_dark and colors.bg5) or colors.bg4 })
end

return M
