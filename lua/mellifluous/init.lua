function Return_error(msg)
    error('mellifluous: ' .. msg)
end

function Print_error(msg)
    vim.notify('Error: mellifluous: ' .. msg)
    vim.notify('')
end

local M = {}

function M.setup(user_config)
    require('mellifluous.config').setup(user_config)
end

function M.load()
    require('mellifluous.config').prepare_global()

    local colors = require('mellifluous.colors').get_colors()
    local highlighter = require('mellifluous.utils.highlighter')

    require('mellifluous.highlights').set(highlighter, colors)

    return highlighter, colors
end

function M.apply()
    vim.opt.termguicolors = true

    local highlighter, colors = M.load()

    highlighter.apply_all()

    require('mellifluous.cli').create()
    require('mellifluous.terminal').apply(colors)
end

return M
