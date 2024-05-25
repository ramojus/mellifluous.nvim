local M = {}

function M.set(hl, colors)
    local config = require('mellifluous.config').config

    hl.set('LazyNormal', { bg = colors.bg2 })
    hl.set('LazyButton', { fg = colors.fg2, bg = colors.bg })
    hl.set('LazyButtonActive', { fg = colors.fg, bg = config.is_bg_dark and colors.bg5 or colors.bg4 })
    hl.set('LazyH1', { link = 'LazyButtonActive' })

    hl.set('LazyProgressTodo', { fg = config.is_bg_dark and colors.fg5 or colors.dark_bg })
    hl.set('LazyProgressDone', { fg = colors.fg })

    hl.set('LazyDimmed', { fg = colors.fg3 })
    hl.set('LazyProp', { link = 'LazyDimmed' })
end

return M

