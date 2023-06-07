return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require('lush')
    local config = require('mellifluous').config

    return lush(function()
        if config.plugins.telescope.nvchad_like == true
                and not config.transparent_background.telescope
                and not config.flat_background.floating_windows then
            return {
                TelescopeNormal {
                                    fg = colors.fg3.hex,
                                    bg = colors.bg2.hex
                                    },
                TelescopeBorder { fg = TelescopeNormal.bg },
                TelescopeMatching { fg = colors.fg.hex },

                TelescopePromptTitle { fg = colors.bg.hex, bg = colors.fg2.hex },
                TelescopePromptBorder { fg = TelescopeNormal.bg, bg = TelescopeNormal.bg },
                TelescopePromptNormal { bg = TelescopeNormal.bg },
                TelescopePromptCounter { fg = colors.fg4.hex },

                TelescopeResultsTitle { fg = TelescopeNormal.bg, bg = TelescopeNormal.bg },
                TelescopeResultsBorder { fg = TelescopeNormal.bg, bg = TelescopeNormal.bg },

                TelescopePreviewNormal { bg = TelescopeNormal.bg },
                TelescopePreviewBorder { fg = TelescopePreviewNormal.bg, bg = TelescopePreviewNormal.bg },
                TelescopePreviewLine { bg = (config.is_bg_dark and colors.bg5.hex) or colors.dark_bg.hex },
                TelescopePreviewTitle { fg = colors.fg3.hex },

                TelescopeSelectionCaret { fg = TelescopeNormal.bg },
                TelescopeSelection { bg = (config.is_bg_dark and colors.bg5.hex) or colors.dark_bg.hex },
            }
        else
            return {
                TelescopeNormal { fg = highlights.Pmenu.fg },
                TelescopeBorder { fg = colors.fg4.hex },
                TelescopeSelectionCaret { fg = TelescopeNormal.bg },
                TelescopeSelection { bg = colors.bg3.hex },
                TelescopeMatching { fg = colors.fg.hex },
            }
        end
    end)
end
