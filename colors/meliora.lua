if vim.version().minor < 7 then
    vim.notify_once("meliora.nvim: you must use neovim 0.7 or higher")
    return
end

-- reset colors
if vim.g.colors_name then
    vim.cmd("hi clear")
end

vim.opt.background = 'dark'
vim.g.colors_name = 'meliora'

-- include our theme file and pass it to lush to apply
require('lush')(require('meliora').get_theme())

