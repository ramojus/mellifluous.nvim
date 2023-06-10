local M = {}

function M.set(hl, colors)
    local config = require('mellifluous').config

    if config.plugins.telescope.nvchad_like == true
        and not config.transparent_background.telescope
        and not config.flat_background.floating_windows then
        hl.set('TelescopeNormal', {
            fg = colors.fg3.hex,
            bg = colors.bg2.hex
        })
        hl.set('TelescopeBorder', { fg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopeMatching', { fg = colors.fg.hex })

        hl.set('TelescopePromptTitle', { fg = colors.bg.hex, bg = colors.fg2.hex })
        hl.set('TelescopePromptBorder', { fg = hl.get('TelescopeNormal').bg, bg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopePromptNormal', { bg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopePromptCounter', { fg = colors.fg4.hex })

        hl.set('TelescopeResultsTitle', { fg = hl.get('TelescopeNormal').bg, bg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopeResultsBorder', { fg = hl.get('TelescopeNormal').bg, bg = hl.get('TelescopeNormal').bg })

        hl.set('TelescopePreviewNormal', { bg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopePreviewBorder',
            { fg = hl.get('TelescopePreviewNormal').bg, bg = hl.get('TelescopePreviewNormal').bg })
        hl.set('TelescopePreviewLine', { bg = (config.is_bg_dark and colors.bg5.hex) or colors.dark_bg.hex })
        hl.set('TelescopePreviewTitle', { fg = colors.fg3.hex })

        hl.set('TelescopeSelectionCaret', { fg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopeSelection', { bg = (config.is_bg_dark and colors.bg5.hex) or colors.dark_bg.hex })
    else
        hl.set('TelescopeNormal', { fg = hl.get('Pmenu').fg })
        hl.set('TelescopeBorder', { fg = colors.fg4.hex })
        hl.set('TelescopeSelectionCaret', { fg = hl.get('TelescopeNormal').bg })
        hl.set('TelescopeSelection', { bg = colors.bg3.hex })
        hl.set('TelescopeMatching', { fg = colors.fg.hex })
    end
end

return M
