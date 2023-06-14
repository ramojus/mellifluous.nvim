local M = {}

function M.set(hl, colors)
    if Config.plugins.telescope.nvchad_like == true
        and not Config.transparent_background.telescope
        and not Config.flat_background.floating_windows then
        hl.set('TelescopeNormal', {
            fg = colors.fg3,
            bg = colors.bg2
        })
        hl.set('TelescopeBorder', { fg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopeMatching', { fg = colors.fg })

        hl.set('TelescopePromptTitle', { fg = colors.bg, bg = colors.fg2 })
        hl.set('TelescopePromptBorder', { fg = hl.get('TelescopeNormal').bg, bg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopePromptNormal', { bg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopePromptCounter', { fg = colors.fg4 })

        hl.set('TelescopeResultsTitle', { fg = hl.get('TelescopeNormal').bg, bg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopeResultsBorder', { fg = hl.get('TelescopeNormal').bg, bg = hl.get('TelescopeNormal').bg })

        hl.set('TelescopePreviewNormal', { bg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopePreviewBorder',
            { fg = hl.get('TelescopePreviewNormal').bg, bg = hl.get('TelescopePreviewNormal').bg })
        hl.set('TelescopePreviewLine', { bg = (Config.is_bg_dark and colors.bg5) or colors.dark_bg })
        hl.set('TelescopePreviewTitle', { fg = colors.fg3 })

        hl.set('TelescopeSelectionCaret', { fg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopeSelection', { bg = (Config.is_bg_dark and colors.bg5) or colors.dark_bg })
    else
        hl.set('TelescopeNormal', { fg = hl.get('Pmenu').fg })
        hl.set('TelescopeBorder', { fg = colors.fg4 })
        hl.set('TelescopeSelectionCaret', { fg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopeSelection', { bg = colors.bg3 })
        hl.set('TelescopeMatching', { fg = colors.fg })
    end
end

return M
