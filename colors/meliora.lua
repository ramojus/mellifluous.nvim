if vim.version().minor < 7 then
    vim.notify_once("meliora.nvim: you must use neovim 0.7 or higher")
    return
end

vim.opt.background = 'dark'
vim.g.colors_name = 'meliora'

package.loaded['meliora'] = nil

-- reset colors
if vim.g.colors_name then
    vim.cmd("hi clear")
end

-- include our theme file and pass it to lush to apply
require('lush')(require('meliora').get_theme())

