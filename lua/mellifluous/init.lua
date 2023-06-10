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
        comments = { italic = true },
        conditionals = {},
        folds = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    transparent_background = {
        enabled = false,
        floating_windows = true,
        telescope = true,
        file_tree = true,
        cursor_line = true,
        status_line = false,
    },
    flat_background = {
        line_numbers = false,
        floating_windows = false,
        file_tree = false,
        cursor_line_number = false,
    },
}

local function disable_disabled()
    for _, v in pairs(M.config) do
        if type(v) ~= "table"
                or v.enabled == nil
                or v.enabled then
            goto continue
        end

        for i, _ in pairs(v) do
            v[i] = false
        end

        ::continue::
    end
end

local are_color_set_defaults_merged = false

local function merge_color_set_defaults()
    if are_color_set_defaults_merged then
        return
    end
    are_color_set_defaults_merged = true

    local color_set = require('mellifluous.colors.sets.' .. M.config.color_set)

    if not color_set.get_config then
        return
    end

    M.config[M.config.color_set] = vim.tbl_deep_extend(
        'force',
        M.config[M.config.color_set] or {},
        color_set.get_config()
    )
end

function M.setup(user_config)
    merge_color_set_defaults()
    M.config = vim.tbl_deep_extend('force', M.config, user_config or {})
end

function M.load()
    merge_color_set_defaults()
    disable_disabled()

    local colors, is_bg_dark = require('mellifluous.colors').get_colors(M.config.color_set)
    local highlighter = require('mellifluous.utils.highlighter')

    M.config.is_bg_dark = is_bg_dark

    require('mellifluous.highlights').set(highlighter, colors)

    return highlighter, colors
end

function M.apply()
    vim.opt.termguicolors = true

    local highlighter, colors = M.load()

    highlighter.apply_all()

    require('mellifluous.cli').create(M.config)
    require('mellifluous.terminal').apply(colors)
end

return M
