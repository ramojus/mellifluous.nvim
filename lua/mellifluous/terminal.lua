local M = {}

function M.apply(colors)
    vim.g.terminal_color_0 = colors.bg.hex
    vim.g.terminal_color_1 = colors.red.hex
    vim.g.terminal_color_2 = colors.green.hex
    vim.g.terminal_color_3 = (colors.yellow and colors.yellow.hex) or colors.strings.hex
    vim.g.terminal_color_4 = colors.blue.hex
    vim.g.terminal_color_5 = colors.purple.hex
    vim.g.terminal_color_6 = (colors.cyan and colors.cyan.hex) or colors.blue.hex
    vim.g.terminal_color_7 = colors.fg4.hex

    local li_value = 16
    vim.g.terminal_color_8 = colors.bg2.hex
    vim.g.terminal_color_9 = colors.red:lightened(li_value).hex
    vim.g.terminal_color_10 = colors.green:lightened(li_value).hex
    vim.g.terminal_color_11 = (colors.yellow and colors.yellow:lightened(li_value).hex)
        or colors.strings:lightened(li_value).hex
    vim.g.terminal_color_12 = colors.blue:lightened(li_value).hex
    vim.g.terminal_color_13 = colors.purple:lightened(li_value).hex
    vim.g.terminal_color_14 = (colors.cyan and colors.cyan:lightened(li_value).hex)
        or colors.blue:lightened(li_value).hex
    vim.g.terminal_color_15 = colors.fg2.hex
end

return M
