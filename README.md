<!-- panvimdoc-ignore-start -->
# Mellifluous
A colorscheme for [Neovim](https://github.com/neovim/neovim). Pleasant and productive, with stronger highlights on important keywords.
![preview](https://github.com/ramojus/mellifluous.nvim/assets/41536253/a4b01a46-6ec9-408a-9c2f-08995c53155a)

## Highlighted features
- [**Multiple color sets**](#color-sets): Each color set presents a unique visual theme while adhering to the same set of productive highlight rules. Every color set [can be customised](#overriding-colors-of-a-color-set).

- **Layered backgrounds**: Most UI elements have backgrounds with different shades of the background color and have no borders. This allows for easy differentiation between the relative importance of the elements and keeps the colorscheme looking minimal.

- [**Oklab color space**](https://bottosson.github.io/posts/oklab/): To truly achieve perceptually uniform variations of colors, all color modifications are done in this color space; thanks to [mini.colors](https://github.com/echasnovski/mini.colors) project for the code and idea.

- **Small number of colors**: Color sets use a small number of colors to provide distraction-free coding experience.

- **Stronger highlights on important keywords**: Keywords related to control flow have stronger highlights, making it easier to quickly understand the code.

<!-- panvimdoc-ignore-end -->
## Styled plugins
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Native LSP](https://github.com/neovim/nvim-lspconfig)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Neo-Tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Startify](https://github.com/mhinz/vim-startify)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

## Installation and usage
Example with [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use({
    'ramojus/mellifluous.nvim',
    config = function()
        require'mellifluous'.setup({ --[[...]] }) -- optional, see configuration section.
        vim.cmd('colorscheme mellifluous')
    end,
})
```

## Configuration
Here is an example with the default config. This is optional, and only relevant parts of the config can be included.

```lua
require 'mellifluous'.setup({
    dim_inactive = false,
    color_set = 'mellifluous',
    styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
        comments = { italic = true },
        conditionals = {},
        folds = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    transparent_background = {
        enabled = false,
        floating_windows = true,
        telescope = true,
        file_tree = true,
        cursor_line = true,
        status_line = false,
    },
    flat_background = {
        line_numbers = false,
        floating_windows = false,
        file_tree = false,
        cursor_line_number = false,
    },
    plugins = {
        cmp = true,
        gitsigns = true,
        indent_blankline = true,
        nvim_tree = {
            enabled = true,
            show_root = false,
        },
        neo_tree = {
            enabled = true,
        },
        telescope = {
            enabled = true,
            nvchad_like = true,
        },
        startify = true,
    },
})
```

### Setting light theme
Set `vim.opt.background` to `'light'`. This will only work on color sets that have light theme.

### Color sets
Non-original color sets are made to match their original version as closely as possible with the same highlight rules as mellifluous.

These color sets don't get loaded, unless you specify them in a `color_set` option, so there is no performance impact.

Available color sets:
- `mellifluous`. Dark and light, original.
- `alduin`. Dark, [link to original](https://github.com/alessandroyorba/alduin).
- `mountain`. Dark, [link to original](https://github.com/mountain-theme/mountain).
- `tender`. Dark, [link to original](https://github.com/jacoborus/tender.vim).

#### Mellifluous color set configuration
Default config:

```lua
require 'mellifluous'.setup({
    mellifluous = {
        neutral = true, -- set this to false and bg_contrast to 'medium' for original mellifluous (then it was called meliora theme)
        bg_contrast = 'medium' -- options: 'soft', 'medium', 'hard'
    }
})
```

#### Overriding colors of a color set
The following snipet shows where and which colors can be overridden:

```lua
require 'mellifluous'.setup({
    <color_set_name> = { -- name any of the defined color sets
        color_overrides = {
            dark = { -- dark variant of the color set
                bg = nil, -- used for shades, on some color sets fg will be derived from this
                fg = nil, -- used for shades if shades_fg is undefined
                shades_fg = nil, -- used for shades (dimmed foregrounds)

                main_keywords = nil,
                other_keywords = nil,
                types = nil,
                operators = nil,
                strings = nil,
                functions = nil,
                constants = nil,
                comments = nil,

                red = nil, -- errors, deletes, bad spellings
                orange = nil, -- warnings, changes, unusual spellings
                green = nil, -- staged, additions
                blue = nil, -- information, new files
                purple = nil, -- hints, merge

                -- for better terminal highlights
                yellow = nil,
                cyan = nil,
            },
            light = { -- light variant of the color set
                -- same fields as in dark variant
            },
        }
    }
})
```

For example, to override a color for the main keywords group in the dark version of the mellifluous color set, one could do the following:

```lua
require 'mellifluous'.setup({
    mellifluous = {
        color_overrides = {
            dark = {
                main_keywords = '#e0e066'
            }
        }
    }
})
```

## CLI options
Type `:Mellifluous <TAB>` and see the available options.

Options include:
- Toggling transparency.
- Changing color set.

## TODO
- [ ] Support more plugins (contributions are welcome).

## Ports
- [Helix (with slightly outdated color palette)](https://github.com/helix-editor/helix/wiki/Themes#meliora)

## Inspiration
- [Mountain and Mountaineer](https://github.com/mountain-theme/mountain)
- [Alduin](https://github.com/alessandroyorba/alduin)
- [Melange](https://github.com/savq/melange)
- [Sema](https://github.com/arzg/sema)

<!-- panvimdoc-ignore-start -->
## License
[MIT](./LICENSE)
<!-- panvimdoc-ignore-end -->
