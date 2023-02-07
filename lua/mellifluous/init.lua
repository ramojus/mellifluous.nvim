function Return_error(msg)
    error('mellifluous: ' .. msg)
end

function Print_error(msg)
    vim.notify('Error: mellifluous: ' .. msg)
    vim.notify('')
end

local M = {}

M.config = {
    color_set = 'mellifluous',
    plugins = {
        cmp = true,
        indent_blankline = true,
        nvim_tree = {
            enabled = true,
            show_root = false,
        },
        telescope = {
            enabled = true,
            nvchad_like = true,
        },
        startify = true,
        gitsigns = true,
    },
    dim_inactive = false,
    styles = {
        comments = 'italic',
        conditionals = 'NONE',
        folds = 'NONE',
        loops = 'NONE',
        functions = 'NONE',
        keywords = 'NONE',
        strings = 'NONE',
        variables = 'NONE',
        numbers = 'NONE',
        booleans = 'NONE',
        properties = 'NONE',
        types = 'NONE',
        operators = 'NONE',
    },
    transparent_background = {
        enabled = false,
        floating_windows = false,
        telescope = true,
        file_tree = true,
        cursor_line = true,
        status_line = false,
    },
}

local are_color_set_defaults_merged = false

local function merge_color_set_defaults()
    if not are_color_set_defaults_merged then
        local color_set = require('mellifluous.color_sets.' .. M.config.color_set)

        if color_set.get_config then
            M.config[M.config.color_set] = vim.tbl_deep_extend(
                'force',
                M.config[M.config.color_set] or {},
                color_set.get_config()
            )
        end
        are_color_set_defaults_merged = true
    end
end

function M.setup(user_config)
    merge_color_set_defaults()
    M.config = vim.tbl_deep_extend('force', M.config, user_config or {})
end

M.load = function()
    vim.opt.termguicolors = true
    merge_color_set_defaults()
    local lush = require('lush')
    local colors, is_bg_dark = require('mellifluous.color_sets').get_colors(M.config.color_set)
    M.config.dark = is_bg_dark

    require('mellifluous.cli')(M.config)
    require('mellifluous.terminal')(colors)

    local highlights = require('mellifluous.highlights')(colors)
    local specs = require('mellifluous.plugins')(highlights, colors)
    table.insert(specs, highlights)

    return lush.merge(specs)
end

return M
