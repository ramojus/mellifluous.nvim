local M = {}
local config = {}
local saved_user_config = {}

local function get_default_config()
    return {
        color_set = "mellifluous",
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
            neorg = true,
            nvim_notify = true,
            aerial = true,
            neotest = true,
            lazy = true,
            mason = true,
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
            markup = {
                headings = { bold = true },
            },
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
end

local function disable_disabled()
    for _, v in pairs(config) do
        if type(v) ~= "table" or v.enabled == nil or v.enabled then
            goto continue
        end

        for i, _ in pairs(v) do
            v[i] = false
        end

        ::continue::
    end
end

local are_color_set_defaults_merged = false

local function merge_color_set_defaults(color_set)
    if are_color_set_defaults_merged then
        return
    end
    are_color_set_defaults_merged = true

    local color_set_module = require("mellifluous.colors.sets." .. color_set)

    if not color_set_module.get_config then
        return
    end

    config[color_set] = vim.tbl_deep_extend("force", config[color_set] or {}, color_set_module.get_config())
end

local function process_color_set()
    config.is_bg_dark = require("mellifluous.colors").get_is_bg_dark(config.color_set)
    config.ui_color_base_lightness =
        require("mellifluous.colors").get_ui_color_base_lightness(config.color_set, config.is_bg_dark)
end

-- https://www.lua.org/pil/13.4.5.html
local function read_only(table)
    local proxy = {}
    local metatable = {
        __index = table,
        __newindex = function()
            require("mellifluous").return_error("Attempt to update readonly config")
        end,
    }
    setmetatable(proxy, metatable)
    return proxy
end

function M.setup(user_config)
    saved_user_config = vim.tbl_deep_extend("force", saved_user_config, user_config)
end

function M.prepare()
    config = get_default_config()
    merge_color_set_defaults(vim.tbl_get(saved_user_config, "color_set") or config.color_set)
    config = vim.tbl_deep_extend("force", config, saved_user_config or {})

    process_color_set()
    disable_disabled()

    M.config = read_only(config)
end

function M.set_highlight_overrides(highlighter, colors)
    local background = config.is_bg_dark and "dark" or "light"

    local global_highlight_overrides = vim.tbl_get(M.config, "highlight_overrides", background) or nil
    if global_highlight_overrides then
        global_highlight_overrides(highlighter, colors)
    end

    local color_set_highlight_overrides = vim.tbl_get(M.config, M.config.color_set, "highlight_overrides", background)
        or nil
    if color_set_highlight_overrides then
        color_set_highlight_overrides(highlighter, colors)
    end
end

return M
