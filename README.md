# Meliora colorscheme for [Neovim](https://github.com/neovim/neovim)
Inspired by early mornings after rainy nights.

![preview](assets/preview.png)

Made with [lush](https://github.com/rktjmp/lush.nvim)

## Styled plugins
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Native LSP](https://github.com/neovim/nvim-lspconfig)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Startify](https://github.com/mhinz/vim-startify)

## Usage
Install with any plugin manager, [lush](https://github.com/rktjmp/lush.nvim) is required.
Example with [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use {
    'meliora-theme/neovim',
    requires = {'rktjmp/lush.nvim'}
}
```

## Configuration
Here is an example with the default config, change it as you like. To minimise clutter, you can pass only the relevant (changed) parts to setup function instead of the whole config.

```lua
require 'meliora'.setup({
    dim_inactive = false,
    neutral = false, -- set this to `true` for neutral background and greys.
    styles = {
        comments = 'italic',
        conditionals = 'NONE',
        folds = 'NONE',
        loops = 'NONE',
        functions = 'NONE',
        keywords = 'NONE',
        strings = 'NONE',
        variables = 'NONE',
        numbers = 'NONE',
        booleans = 'NONE',
        properties = 'NONE',
        types = 'NONE',
        operators = 'NONE',
    },
    transparent_background = {
        enabled = false,
        floating_windows = false,
        telescope = true,
        file_tree = true,
        cursor_line = true,
        status_line = false,
    },
    plugins = {
        cmp = true,
        indent_blankline = true,
        nvim_tree = {
            enabled = true,
            show_root = false,
        },
        telescope = {
            enabled = true,
            nvchad_like = true,
        },
        startify = true,
    },
})
```
If you want to mix some styles, for example bold and italic, set style value to `'bold italic'`.

For light theme set `vim.opt.background` to `"light"`.

## Contributing
Any PRs or issues regarding highlight fixes/improvements or new plugins are very welcome.

## License
[MIT](./LICENSE)
