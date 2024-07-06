local M = {}

function M.set(hl, colors)
    local root_fg = colors.fg3
    local groups = require("mellifluous.highlights.custom_groups").get(colors)
    local normal_group = groups.FileTree

    hl.set("NeoTreeGitConflict", { fg = colors.ui_purple })
    hl.set("NeoTreeGitDeleted", { fg = colors.red })
    hl.set("NeoTreeGitIgnored", { fg = hl.get("Ignore").fg })
    hl.set("NeoTreeGitModified", { fg = colors.ui_orange })
    hl.set("NeoTreeGitStaged", { fg = colors.ui_green })
    hl.set("NeoTreeGitRenamed", { fg = colors.ui_orange })
    hl.set("NeoTreeGitUntracked", { fg = colors.ui_orange })

    hl.set("NeoTreeNormal", normal_group)
    hl.set("NeoTreeNormalNC", normal_group)
    hl.set("NeoTreePopup", normal_group)
    hl.set("NeoTreeWinSeparator", groups.FileTreeWinSeparator(normal_group.bg))
    hl.set("NeoTreeIndentMarker", groups.IndentLine(normal_group.bg))
    hl.set("NeoTreeEndOfBuffer", { bg = normal_group.bg, fg = hl.get("EndOfBuffer").fg })
    hl.set("NeoTreeFolderIcon", { fg = hl.get("Directory").fg })
    hl.set("NeoTreeRootName", { fg = root_fg })
    hl.set("NeoTreeStatusLine", normal_group)
    hl.set("NeoTreeCursorLine", { link = "CursorLine" })
    hl.set("NeoTreeCursorLineSign", { bg = hl.get("CursorLine").bg })
    hl.set("NeoTreeSignColumn", normal_group)
    hl.set("NeoTreeFloatTitle", { fg = colors.fg2 })
    hl.set("NeoTreeTitleBar", { link = "NeoTreeFloatTitle" })
end

return M
