local M = {}

function M.set(hl, colors)
    local groups = require("mellifluous.highlights.custom_groups").get(colors)

    hl.set("@lsp.type.comment", {}) -- let treesitter handle those
    hl.set("@lsp.type.enum", { link = "Type" })
    hl.set("@lsp.type.enumMember", { link = "Constant" })
    hl.set("@lsp.type.escapeSequence", { fg = colors.fg3 })
    hl.set("@lsp.type.formatSpecifier", { link = "Operator" })
    hl.set("@lsp.type.namespace", { link = "Type" })
    hl.set("@lsp.type.operator", { link = "Operator" })
    hl.set("@lsp.type.parameter", {})
    hl.set("@lsp.type.property", { fg = colors.fg })
    hl.set("@lsp.type.variable", {})
    hl.set("@lsp.typemod.variable.constant", { link = "Constant" })
    hl.set("@lsp.typemod.keyword.controlFlow", groups.MainKeyword)
end

return M
