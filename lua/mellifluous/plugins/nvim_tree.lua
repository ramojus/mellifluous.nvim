return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require('lush')
    local config = require('mellifluous').config

    local root_fg = colors.dark_bg.hex
    if config.plugins.nvim_tree.show_root == true then
        root_fg = colors.fg3.hex
    end

    return lush(function()
        return {
            NvimTreeGitDeleted      { fg = colors.red.hex },
            NvimTreeGitDirty        { fg = colors.orange.hex },
            NvimTreeGitIgnored      { fg = highlights.Ignore.fg },
            NvimTreeGitMerge        { fg = colors.purple.hex },
            NvimTreeGitNew          { fg = colors.blue.hex },
            NvimTreeGitRenamed      { fg = colors.orange.hex },
            NvimTreeGitStaged       { fg = colors.green.hex },
            NvimTreeNormal          {
                                        bg = (config.transparent_background.file_tree and 'NONE')
                                            or (config.flat_background.file_tree and highlights.Normal.bg)
                                            or colors.dark_bg.hex,
                                        fg = colors.fg2.hex
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
                                                and (config.is_bg_dark and colors.bg4.hex)
                                                    or colors.bg3.hex) -- stronger separator if both bg are flat
                                            or (config.is_bg_dark and colors.bg3.hex)
                                            or colors.dark_bg2.hex
                                    },
            NvimTreeIndentMarker    { fg = highlights.Directory.fg },
            NvimTreeEndOfBuffer     { bg = nvimTreeNormal.bg, fg = highlights.EndOfBuffer.fg },
            NvimTreeFolderIcon      { fg = highlights.Directory.fg },
            NvimTreeRootFolder      { fg = root_fg },
        }
    end)
end
