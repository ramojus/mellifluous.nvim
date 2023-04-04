return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require('lush')
    local config = require('mellifluous').config

    local root_fg = colors.dark_bg
    if config.plugins.nvim_tree.show_root == true then
        root_fg = colors.fg3
    end

    return lush(function()
        return {
            NvimTreeGitDeleted      { fg = colors.red },
            NvimTreeGitDirty        { fg = colors.orange },
            NvimTreeGitIgnored      { fg = highlights.Ignore.fg },
            NvimTreeGitMerge        { fg = colors.purple },
            NvimTreeGitNew          { fg = colors.blue },
            NvimTreeGitRenamed      { fg = colors.orange },
            NvimTreeGitStaged       { fg = colors.green },
            NvimTreeNormal          {
                                        bg = (config.transparent_background.file_tree and 'NONE')
                                            or (config.flat_background.file_tree and highlights.Normal.bg)
                                            or colors.dark_bg,
                                        fg = colors.fg2
                                    },
            NvimTreeNormalNC        { NvimTreeNormal },
            NvimTreePopup           { NvimTreeNormal },
            NvimTreeSignColumn      { NvimTreeNormal },
            NvimTreeWinSeparator    {
                                        bg = NvimTreeNormal.bg,
                                        fg = (config.flat_background.line_numbers
                                                ~= config.flat_background.file_tree
                                                and NvimTreeNormal.bg) -- no separator if LineNr bg differs from this bg
                                            or (config.flat_background.line_numbers
                                                and config.flat_background.file_tree
                                                and (config.is_bg_dark and colors.bg4)
                                                    or colors.bg3) -- stronger separator if both bg are flat
                                            or (config.is_bg_dark and colors.bg3)
                                            or colors.dark_bg2
                                    },
            NvimTreeIndentMarker    { fg = highlights.Directory.fg },
            NvimTreeEndOfBuffer     { bg = nvimTreeNormal.bg, fg = highlights.EndOfBuffer.fg },
            NvimTreeFolderIcon      { fg = highlights.Directory.fg },
            NvimTreeRootFolder      { fg = root_fg },
        }
    end)
end
