local M = {}

function M.set(hl, colors)
    local config = require("mellifluous.config").config
    local groups = require("mellifluous.highlights.custom_groups").get(colors)
    local normal_group = groups.FileTree
    local root_fg = config.plugins.nvim_tree.show_root and colors.fg3 or colors.dark_bg

    hl.set("NvimTreeGitDeleted", { fg = colors.red })
    hl.set("NvimTreeGitDirty", { fg = colors.ui_orange })
    hl.set("NvimTreeGitIgnored", { fg = hl.get("Ignore").fg })
    hl.set("NvimTreeGitMerge", { fg = colors.ui_purple })
    hl.set("NvimTreeGitNew", { fg = colors.ui_blue })
    hl.set("NvimTreeGitRenamed", { fg = colors.ui_orange })
    hl.set("NvimTreeGitStaged", { fg = colors.ui_green })
    hl.set("NvimTreeNormal", normal_group)
    hl.set("NvimTreeNormalNC", normal_group)
    hl.set("NvimTreePopup", normal_group)
    hl.set("NvimTreeSignColumn", normal_group)
    hl.set("NvimTreeWinSeparator", groups.FileTreeWinSeparator(normal_group.bg))
    hl.set("NvimTreeIndentMarker", groups.IndentLine(normal_group.bg))
    hl.set("NvimTreeEndOfBuffer", { bg = normal_group.bg, fg = hl.get("EndOfBuffer").fg })
    hl.set("NvimTreeFolderIcon", { fg = hl.get("Directory").fg })
    hl.set("NvimTreeRootFolder", { fg = root_fg })
end

return M
