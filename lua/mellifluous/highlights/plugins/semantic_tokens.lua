local M = {}

function M.set(hl, colors)
    local groups = require("mellifluous.highlights.custom_groups").get(colors)

    -- Tree-sitter highlights for comments allow more granularity than the
    -- semantic lsp.type.comment group (for fixme, todo, etc. and doc
    -- comments). Therefore we want to stick with tree-sitter highlights
    -- whenever possible, but sometimes lsp.type.comment group is used for
    -- something that tree-sitter can't detect.
    -- Some LSP's (clangd) use lsp.type.comment group for unreachable sections
    -- of code (in respect to preprocessor directives) and since tree-sitter
    -- can't detect those sections, we utilize this group.
    -- It seems like most LSP's are not using this group for comments
    -- detectable by tree-sitter
    hl.set("@lsp.type.comment", { link = "Comment" })
    -- Some LSP's (lua_ls) do use lsp.type.comment group for comments
    -- detectable with tree-sitter - in this case we want the tree-sitter
    -- highlights.
    -- lua_ls doesn't seem to use this group for anything that tree-sitter
    -- can't detect.
    hl.set("@lsp.type.comment.lua", {})

    hl.set("@lsp.type.enum", { link = "Type" })
    hl.set("@lsp.type.enumMember", { link = "Constant" })
    hl.set("@lsp.type.escapeSequence", { fg = colors.fg3 })
    hl.set("@lsp.type.formatSpecifier", { link = "Operator" })
    hl.set("@lsp.type.namespace", { link = "Type" })
    hl.set("@lsp.type.operator", { link = "Operator" })
    hl.set("@lsp.type.parameter", {})
    hl.set("@lsp.type.property", { fg = colors.fg })
    hl.set("@lsp.type.variable", {})
    hl.set("@lsp.type.macro", { link = "Macro" })
    hl.set("@lsp.typemod.variable.constant", { link = "Constant" })
    hl.set("@lsp.typemod.keyword.controlFlow", groups.MainKeyword)
end

return M
