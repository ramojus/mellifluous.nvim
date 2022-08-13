# Meliora theme for [Neovim](https://github.com/neovim/neovim)
![preview](assets/preview.png)

Made with [lush](https://github.com/rktjmp/lush.nvim)

## Plugin support
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
Here is an example with the default config, change it as you like. Structure is inspired by [catppuccin](https://github.com/catppuccin/nvim) theme config.

If you want to mix some styles, for example bold and italic, set style value to `'bold italic'`.
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
    }
})
```
For light theme set `vim.opt.background` to `"light"`.

## Contributing
Any PRs or issues regarding highlight fixes/improvements or new plugins are very welcome.

## Author
- [Ramojus Lapinskas](https://github.com/ramojus)

## License
[MIT](./LICENSE)
