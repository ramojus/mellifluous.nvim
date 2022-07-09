local M = {}

-- default config
M.config = {
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
    }
}

function M.setup(config)
    M.config = vim.tbl_deep_extend("force", M.config, config or {})
end

M.get_theme = function()
    local lush = require 'lush'
    local bg = require 'meliora.bg'

    package.loaded['meliora.color_variants.default'] = nil
    package.loaded['meliora.highlights'] = nil
    package.loaded['meliora.plugins'] = nil

    local colors = require 'meliora.color_variants.default'(bg)

    local highlights = require 'meliora.highlights'(colors)
    local specs = require 'meliora.plugins'(highlights, colors)
    table.insert(specs, highlights)

    return lush.merge(specs)
end

return M
