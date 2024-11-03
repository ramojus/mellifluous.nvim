local M = {}
local config = {}
local saved_user_config = {}

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

local function merge_colorset_defaults(colorset)
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
    package.loaded["mellifluous.default_config"] = nil -- unload in case of colorscheme reload
    config = require("mellifluous.default_config") -- config is returned by reference
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
