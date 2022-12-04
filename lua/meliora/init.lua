function Return_error(msg)
    error('Meliora: ' .. msg)
end

function Print_error(msg)
    print('Error: Meliora: ' .. msg)
end

local M = {}

-- default config
M.config = {
    dim_inactive = false,
    neutral = true,
    color_set = 'mellifluous',
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
    M.config = vim.tbl_deep_extend('force', M.config, config or {})
end

M.load = function()
    local lush = require 'lush'
    local hsl = lush.hsl
    local colors

    if M.config.color_set == 'mountain' then
        M.config.dark = true
        local bg = hsl('#0f0f0f')
        colors = require 'meliora.colors.mountain'(bg)

    elseif M.config.color_set == 'alduin' then
        M.config.dark = true
        local bg = hsl('#1c1c1c')
        colors = require 'meliora.colors.alduin'(bg)

    elseif M.config.color_set == 'mellifluous' then
        if vim.o.background == 'dark' then
            M.config.dark = true
            local bg = require 'meliora.backgrounds.dark'
            colors = require 'meliora.colors.dark'(bg)
        else
            M.config.dark = false
            local bg = require 'meliora.backgrounds.light'
            colors = require 'meliora.colors.light'(bg)
        end
    else
        Return_error("unrecognised color_set name: '" .. M.config.color_set .. "'")
    end

    require 'meliora.cli' (M.config)

    local highlights = require 'meliora.highlights'(colors)
    local specs = require 'meliora.plugins'(highlights, colors)
    table.insert(specs, highlights)

    return lush.merge(specs)
end

return M
