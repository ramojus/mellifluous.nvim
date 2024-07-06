local M = {}

function M.set(hl, colors)
    local groups = require("mellifluous.highlights.custom_groups").get(colors)

    hl.set("IblIndent", groups.IndentLineInactive(colors.bg))
    hl.set("IblScope", groups.IndentLine(colors.bg))
    hl.set("IblWhitespace", { link = "Whitespace" })
end

return M
