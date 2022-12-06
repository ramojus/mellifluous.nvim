local set = function(current_config)
    local options = {
        toggle_transparency = 100,
    }
    local color_sets = require 'meliora.color_sets.init'.get_color_sets_table()
    options = vim.tbl_deep_extend('force', options, color_sets)

    vim.api.nvim_create_user_command('Meliora', function(input)
        if options[input.args] == options.toggle_transparency then
            require 'meliora'.setup({
                transparent_background = {
                    enabled = not current_config.transparent_background.enabled
                }
            })
        elseif color_sets[input.args] then
            require 'meliora'.setup({
                color_set = input.args
            })
        else
            Print_error("unrecognised cli argument: '" .. input.args .. "'")
            return
        end

        vim.cmd('colorscheme meliora')
    end, {
        nargs = 1,
        complete = function(line)
            return vim.tbl_filter(function(val) return vim.startswith(val, line) end, vim.tbl_keys(options))
        end,
    })
end

return set
