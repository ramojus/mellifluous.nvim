# Meliora colors for [Neovim](https://github.com/neovim/neovim)
Collection of colorschemes (here called color sets) that use the same code thus style and settings for highlighting things in opinionated way.

As a rule, all of the color sets used here are either neutral or warm.

Made with [lush](https://github.com/rktjmp/lush.nvim).

## Color sets
### Mellifluous
Default and original meliora color set. For me it has that early (slightly sunny) morning after rainy night when you have slept well vibe.

![preview](assets/code.png)
![preview](assets/telescope.png)
![preview](assets/startify.png)
![preview](assets/light_code.png)

---
Following color sets are not original, but as of writing this, original versions don't have support [treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [native LSP](https://github.com/neovim/nvim-lspconfig) and other popular neovim plugins.

### Alduin ([Original](https://github.com/alessandroyorba/alduin))
Screenshots are WIP

### Mountain ([Original](https://github.com/mountain-theme/mountain))
Screenshots are WIP

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
    'ramojus/meliora.nvim',
    requires = {'rktjmp/lush.nvim'}
}
```

## Configuration
Here is an example with the default config, change it as you like. If you like the defaults, there is no need to call `setup`.

```lua
require 'meliora'.setup({
    dim_inactive = false,
    color_set = 'mellifluous',
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

### Mixing styles
Set style value to `'style1 style2'`, for bold and italic it would be `'bold italic'`.

### Setting light theme
Set `vim.opt.background` to `'light'`. This will only work on color sets that have light theme.

### Available color sets
- `mellifluous`
- `alduin`. Dark only
- `mountain`. Dark only

## CLI options
Type `:Meliora <TAB>` and see the available options.

Options include:
- Toggling transparency.
- Changing color set.

## TODO
- [ ] Add color set specific options.
- [ ] Add more color sets (possibly oxocarbon and fleet, but I intend to keep the number of color sets minimal).
- [ ] Add contributing guidelines (for now, if you want to contribute a theme, it's better to first make an issue and bugfixes are always welcome).
- [ ] Don't break people's configs

## Mellifluous ports
- [Helix (with slightly outdated color palette)](https://github.com/helix-editor/helix/wiki/Themes#meliora)

## Mellifluous inspiration
Mellifluous color set is mostly inspired by these great themes:
- [Mountain and Mountaineer](https://github.com/mountain-theme/mountain)
- [Alduin](https://github.com/alessandroyorba/alduin)
- [Melange](https://github.com/savq/melange)
- [Sema](https://github.com/arzg/sema)

## License
[MIT](./LICENSE)
