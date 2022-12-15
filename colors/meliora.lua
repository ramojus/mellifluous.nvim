-- kept for compatibility with older configs

if vim.version().minor < 8 then
    vim.notify_once('meliora: only neovim 8.0 or higher is supported for working nvim-treesitter highlights')
    return
end

-- reset colors
if vim.g.colors_name then
    vim.cmd('hi clear')
end

vim.g.colors_name = 'meliora'

-- include our theme file and pass it to lush to apply
require('lush')(require('mellifluous').load())

vim.notify_once("Sorry, but meliora has changed its name to mellifluous and soon (on December 26) you will not be able to load meliora as a colorscheme. When you can, change `colorscheme meliora` to `colorscheme mellifluous` (everything else can stay the same) and you won't see this message again. Thank you.")

