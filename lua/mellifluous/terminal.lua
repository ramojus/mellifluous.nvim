return function(colors)
    vim.g.terminal_color_0 = colors.bg.hex
    vim.g.terminal_color_1 = colors.red.hex
    vim.g.terminal_color_2 = colors.green.hex
    vim.g.terminal_color_3 = (colors.yellow and colors.yellow.hex)
                                or colors.strings.hex
    vim.g.terminal_color_4 = colors.blue.hex
    vim.g.terminal_color_5 = colors.purple.hex
    vim.g.terminal_color_6 = (colors.cyan and colors.cyan.hex)
                                or colors.blue.hex
    vim.g.terminal_color_7 = colors.fg.hex

    local li_value = 16
    vim.g.terminal_color_8 = colors.bg2.hex
    vim.g.terminal_color_9 = colors.red.li(li_value).hex
    vim.g.terminal_color_10 = colors.green.li(li_value).hex
    vim.g.terminal_color_11 = (colors.yellow and colors.yellow.li(li_value).hex)
                                or colors.strings.li(li_value).hex
    vim.g.terminal_color_12 = colors.blue.li(li_value).hex
    vim.g.terminal_color_13 = colors.purple.li(li_value).hex
    vim.g.terminal_color_14 = (colors.cyan and colors.cyan.li(li_value).hex)
                                or colors.blue.li(li_value).hex
    vim.g.terminal_color_15 = colors.fg2
end
