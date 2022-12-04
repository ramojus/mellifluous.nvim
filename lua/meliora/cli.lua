local set = function(current_config)
    local options = {
        toggle_transparency = 1,
        mellifluous = 2,
        mountain = 3,
        alduin = 4
    }

    vim.api.nvim_create_user_command('Meliora', function(input)
        if options[input.args] == options.toggle_transparency then
            require 'meliora'.setup({
                transparent_background = {
                    enabled = not current_config.transparent_background.enabled
                }
            })
        elseif options[input.args] then
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
