local M = {}

function M.create()
    local options = {
        toggle_transparency = 100,
    }
    local colorsets = require("mellifluous.colors").get_colorsets_table()
    options = vim.tbl_deep_extend("force", options, colorsets)
    local config = require("mellifluous.config").config

    vim.api.nvim_create_user_command("Mellifluous", function(input)
        if options[input.args] == options.toggle_transparency then
            require("mellifluous").setup({
                transparent_background = {
                    enabled = not config.transparent_background.enabled,
                },
            })
        elseif colorsets[input.args] then
            require("mellifluous").setup({
                colorset = input.args,
            })
        else
            require("mellifluous").print_error("unrecognised cli argument: '" .. input.args .. "'")
            return
        end

        require("mellifluous.utils.highlighter").clear_highlights()
        vim.cmd("colorscheme mellifluous")
    end, {
        nargs = 1,
        complete = function(line)
            return vim.tbl_filter(function(val)
                return vim.startswith(val, line)
            end, vim.tbl_keys(options))
        end,
    })
end

return M
