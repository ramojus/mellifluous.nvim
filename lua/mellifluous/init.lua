local M = {}

function M.return_error(msg)
    error("mellifluous: " .. msg)
end

function M.print_error(msg)
    vim.notify("Error: mellifluous: " .. msg)
    vim.notify("")
end

function M.setup(user_config)
    require("mellifluous.config").setup(user_config)
end

function M.load()
    require("mellifluous.config").prepare()

    local colors = require("mellifluous.colors").get_colors()
    local highlighter = require("mellifluous.utils.highlighter")

    require("mellifluous.utils.shader").set_background_color(colors.bg)
    require("mellifluous.highlights").set(highlighter, colors)
    require("mellifluous.config").set_highlight_overrides(highlighter, colors)

    return highlighter, colors
end

function M.apply()
    vim.opt.termguicolors = true

    local highlighter, colors = M.load()

    highlighter.apply_all()

    require("mellifluous.cli").create()
    require("mellifluous.terminal").apply(colors)
end

return M
