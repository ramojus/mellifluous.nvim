local M = {}

local config = {
    color_set = 'mellifluous',
    plugins = {
        cmp = true,
        indent_blankline = true,
        nvim_tree = {
            enabled = true,
            show_root = false,
        },
        neo_tree = {
            enabled = true,
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
        if type(v) ~= 'table' or v.enabled == nil or v.enabled then
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

    config[config.color_set] = vim.tbl_deep_extend('force', config[config.color_set] or {}, color_set.get_config())
end

local function process_color_set()
    config.is_bg_dark = require('mellifluous.colors').get_is_bg_dark(config.color_set)
    config.ui_color_base_lightness =
        require('mellifluous.colors').get_ui_color_base_lightness(config.color_set, config.is_bg_dark)

    merge_color_set_defaults()
end

-- https://www.lua.org/pil/13.4.5.html
local function read_only(table)
    local proxy = {}
    local metatable = {
        __index = table,
        __newindex = function()
            require('mellifluous').return_error('Attempt to update readonly config')
        end,
    }
    setmetatable(proxy, metatable)
    return proxy
end

function M.setup(user_config)
    merge_color_set_defaults()
    config = vim.tbl_deep_extend('force', config, user_config or {})
end

function M.prepare()
    process_color_set()
    disable_disabled()

    M.config = read_only(config)
end

return M
