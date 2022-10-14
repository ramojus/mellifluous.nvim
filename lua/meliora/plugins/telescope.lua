return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require 'lush'
    local config = require 'meliora'.config

    return lush(function()
        if config.plugins.telescope.nvchad_like == true then
            return {
                TelescopeNormal {
                                    fg = colors.fg3,
                                    bg = (config.transparent_background.enabled
                                        and config.transparent_background.floating_windows and 'NONE')
                                        or colors.bg2
                                    },
                TelescopeBorder { fg = TelescopeNormal.bg },
                TelescopeMatching { fg = colors.fg },

                TelescopePromptTitle { fg = colors.bg, bg = colors.fg2 },
                TelescopePromptBorder { fg = TelescopeNormal.bg, bg = TelescopeNormal.bg },
                TelescopePromptNormal { bg = TelescopeNormal.bg },
                TelescopePromptCounter { fg = colors.fg4 },

                TelescopeResultsTitle { fg = TelescopeNormal.bg, bg = TelescopeNormal.bg },
                TelescopeResultsBorder { fg = TelescopeNormal.bg, bg = TelescopeNormal.bg },

                TelescopePreviewNormal { bg = TelescopeNormal.bg },
                TelescopePreviewBorder { fg = TelescopePreviewNormal.bg, bg = TelescopePreviewNormal.bg },
                TelescopePreviewLine { bg = colors.bg5 },
                TelescopePreviewTitle { fg = colors.fg3 },

                TelescopeSelectionCaret { fg = TelescopeNormal.bg },
                TelescopeSelection { bg = colors.bg5 },
            }
        else
            return {
                TelescopeNormal { fg = highlights.Pmenu.fg },
                TelescopeBorder { fg = colors.fg4 },
                TelescopeSelectionCaret { fg = TelescopeNormal.bg },
                TelescopeSelection { bg = colors.bg3 },
                TelescopeMatching { fg = colors.fg },
            }
        end
    end)
end
