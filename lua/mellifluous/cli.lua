local M = {}

function M.create()
    local options = {
        toggle_transparency = 100,
    }
    local color_sets = require('mellifluous.colors').get_color_sets_table()
    options = vim.tbl_deep_extend('force', options, color_sets)
    local config = require('mellifluous.config').config

    vim.api.nvim_create_user_command('Mellifluous', function(input)
        if options[input.args] == options.toggle_transparency then
            require('mellifluous').setup({
                transparent_background = {
                    enabled = not config.transparent_background.enabled
                }
            })
        elseif color_sets[input.args] then
            require('mellifluous').setup({
                color_set = input.args
            })
        else
            require('mellifluous').print_error("unrecognised cli argument: '" .. input.args .. "'")
            return
        end

        vim.cmd('colorscheme mellifluous')
    end, {
        nargs = 1,
        complete = function(line)
            return vim.tbl_filter(function(val) return vim.startswith(val, line) end, vim.tbl_keys(options))
        end,
    })
end

return M
