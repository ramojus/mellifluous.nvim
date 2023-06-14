local M = {}

Config = {}

local config = {
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
    for _, v in pairs(config) do
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

    local color_set = require('mellifluous.colors.sets.' .. config.color_set)

    if not color_set.get_config then
        return
    end

    config[config.color_set] = vim.tbl_deep_extend(
        'force',
        config[config.color_set] or {},
        color_set.get_config()
    )
end

-- https://www.lua.org/pil/13.4.5.html
local function read_only(table)
    local proxy = {}
    local metatable = {
        __index = table,
        __newindex = function()
            Return_error("Attempt to update readonly config")
        end
    }
    setmetatable(proxy, metatable)
    return proxy
end

function M.setup(user_config)
    merge_color_set_defaults()
    config = vim.tbl_deep_extend('force', config, user_config or {})
end

function M.get_color_set_name()
    return config.color_set
end

function M.set_is_bg_dark(is_bg_dark)
    config.is_bg_dark = is_bg_dark
end

function M.prepare_global()
    merge_color_set_defaults()
    disable_disabled()

    Config = read_only(config)
end

return M
