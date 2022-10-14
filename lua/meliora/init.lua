local M = {}

-- default config
M.config = {
    dim_inactive = false,
    neutral = false,
    styles = {
        comments = "italic",
        conditionals = "NONE",
        folds = "NONE",
        loops = "NONE",
        functions = "NONE",
        keywords = "NONE",
        strings = "NONE",
        variables = "NONE",
        numbers = "NONE",
        booleans = "NONE",
        properties = "NONE",
        types = "NONE",
        operators = "NONE",
    },
    transparent_background = {
        enabled = false,
        floating_windows = false,
        file_tree = true,
        cursor_line = true,
        status_line = false,
    },
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
    },
}

function M.setup(config)
    M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

M.get_theme = function()
    local lush = require 'lush'
    local colors
    if vim.o.background == "dark" then
        M.config.dark = true
        local bg = require 'meliora.backgrounds.dark'
        colors = require 'meliora.colors.dark'(bg)
    else
        M.config.dark = false
        local bg = require 'meliora.backgrounds.light'
        colors = require 'meliora.colors.light'(bg)
    end

    local highlights = require 'meliora.highlights'(colors)
    local specs = require 'meliora.plugins'(highlights, colors)
    table.insert(specs, highlights)

    return lush.merge(specs)
end

return M
