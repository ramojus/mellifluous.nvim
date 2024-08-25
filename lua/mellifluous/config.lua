local M = {}
local config = {}
local saved_user_config = {}

local function get_default_config()
    return {
        colorset = "mellifluous",
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
            main_keywords = {},
            other_keywords = {},
            types = {},
            operators = {},
            strings = {},
            functions = {},
            constants = {},
            comments = { italic = true },
            markup = {
                headings = { bold = true },
            },
            folds = {},
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

local are_colorset_defaults_merged = false

local function merge_colorset_defaults(colorset)
    if are_colorset_defaults_merged then
        return
    end
    are_colorset_defaults_merged = true

    local colorset_module = require("mellifluous.colors.colorsets." .. colorset)

    if not colorset_module.get_config then
        return
    end

    config[colorset] = vim.tbl_deep_extend("force", config[colorset] or {}, colorset_module.get_config())
end

local function process_colorset()
    config.is_bg_dark = require("mellifluous.colors").get_is_bg_dark(config.colorset)
    config.ui_color_base_lightness =
        require("mellifluous.colors").get_ui_color_base_lightness(config.colorset, config.is_bg_dark)
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
    merge_colorset_defaults(vim.tbl_get(saved_user_config, "colorset") or config.colorset)
    config = vim.tbl_deep_extend("force", config, saved_user_config or {})

    process_colorset()
    disable_disabled()

    M.config = read_only(config)
end

function M.set_highlight_overrides(highlighter, colors)
    local background = config.is_bg_dark and "dark" or "light"

    local global_highlight_overrides = vim.tbl_get(M.config, "highlight_overrides", background) or nil
    if global_highlight_overrides then
        global_highlight_overrides(highlighter, colors)
    end

    local colorset_highlight_overrides = vim.tbl_get(M.config, M.config.colorset, "highlight_overrides", background)
        or nil
    if colorset_highlight_overrides then
        colorset_highlight_overrides(highlighter, colors)
    end
end

return M
