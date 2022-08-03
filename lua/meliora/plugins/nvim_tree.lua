return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require 'lush'
    local config = require 'meliora'.config

    local root_fg = colors.dark_bg
    if config.plugins.nvim_tree.show_root == true then
        root_fg = colors.fg3
    end

    return lush(function()
        return {
            NvimTreeGitDeleted      { fg = colors.red },
            NvimTreeGitDirty        { fg = colors.orange },
            NvimTreeGitIgnored      { fg = highlights.Ignore.fg },
            NvimTreeGitMerge        { fg = colors.blue },
            NvimTreeGitNew          { fg = colors.green },
            NvimTreeGitRenamed      { fg = colors.basic_orange },
            NvimTreeGitStaged       { fg = colors.basic_purple },
            NvimTreeNormal          { bg = colors.dark_bg, fg = colors.fg2 },
            NvimTreeNormalNC        { NvimTreeNormal },
            NvimTreePopup           { NvimTreeNormal },
            NvimTreeSignColumn      { NvimTreeNormal },
            NvimTreeVertSplit       { bg = NvimTreeNormal.bg, fg = (config.dark and colors.bg3) or colors.dark_bg2 },
            NvimTreeWinSeperator    { NvimTreeVertSplit },
            NvimTreeIndentMarker    { fg = highlights.Directory.fg },
            NvimTreeEndOfBuffer     { bg = nvimTreeNormal.bg, fg = highlights.EndOfBuffer.fg },
            NvimTreeFolderIcon      { fg = highlights.Directory.fg },
            NvimTreeRootFolder      { fg = root_fg },
        }
    end)
end
