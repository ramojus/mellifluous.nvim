local M = {}

function M.set(hl, colors)
    local root_fg = colors.fg3
    local config = require('mellifluous.config').config

    hl.set('NeoTreeGitConflict', { fg = colors.ui_purple })
    hl.set('NeoTreeGitDeleted', { fg = colors.red })
    hl.set('NeoTreeGitIgnored', { fg = hl.get('Ignore').fg })
    hl.set('NeoTreeGitModified', { fg = colors.ui_orange })
    hl.set('NeoTreeGitStaged', { fg = colors.ui_green })
    hl.set('NeoTreeGitRenamed', { fg = colors.ui_orange })
    hl.set('NeoTreeGitUntracked', { fg = colors.ui_orange })

    hl.set('NeoTreeNormal', {
        bg = (config.transparent_background.file_tree and 'NONE') or (config.flat_background.file_tree and hl.get(
            'Normal'
        ).bg) or colors.dark_bg,
        fg = colors.fg2,
    })
    hl.set('NeoTreeNormalNC', { link = 'NeoTreeNormal' })
    hl.set('NeoTreePopup', { link = 'NeoTreeNormal' })
    hl.set('NeoTreeWinSeparator', {
        bg = hl.get('NeoTreeNormal').bg,
        fg = (config.flat_background.line_numbers ~= config.flat_background.file_tree
                and hl.get('NeoTreeNormal').bg) -- no separator if LineNr bg differs from this bg
            or (config.flat_background.line_numbers
                and config.flat_background.file_tree
                and (config.is_bg_dark and colors.bg4)
                or colors.dark_bg2) -- stronger separator if both bg are flat
            or (config.is_bg_dark and colors.bg3)
            or colors.dark_bg2,
    })
    hl.set('NeoTreeIndentMarker', { fg = colors.fg5 })
    hl.set('NeoTreeEndOfBuffer', { bg = hl.get('NeoTreeNormal').bg, fg = hl.get('EndOfBuffer').fg })
    hl.set('NeoTreeFolderIcon', { fg = hl.get('Directory').fg })
    hl.set('NeoTreeRootName', { fg = root_fg })
    hl.set('NeoTreeStatusLine', { link = 'NeoTreeNormal' })
    hl.set('NeoTreeCursorLine', { link = 'CursorLine' })
    hl.set('NeoTreeCursorLineSign', { bg = hl.get('CursorLine').bg })
    hl.set('NeoTreeSignColumn', { link = 'NeoTreeNormal' })
    hl.set('NeoTreeFloatTitle', { fg = colors.fg2 })
    hl.set('NeoTreeTitleBar', { link = 'NeoTreeFloatTitle' })
end

return M
