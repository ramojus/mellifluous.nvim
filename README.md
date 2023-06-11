<!-- panvimdoc-ignore-start -->
# Mellifluous
A colorscheme for [Neovim](https://github.com/neovim/neovim). Pleasant and productive, with stronger highlights on important keywords.


## Features
- [**Multiple color sets**](#color-sets): Mellifluous offers several color sets, including the default mellifluous, as well as sets inspired by mountain, alduin, and tender themes. Each color set presents a unique visual theme while following the same set of productive highlight rules.

- **Layered backgrounds**: Distinct shades of the background color are applied to various UI components. This allows for easy differentiation between the importance of the components. By taking this approach, the colorscheme minimizes the use of borders, embracing a minimalistic design philosophy.

- [**Color overrides**](#overriding-colors-of-a-color-set): Each color set supports the customization of specific colors.

- [**Customizable syntax styling**](#configuration): The style of syntax elements can be changed by specifying styles like italic, bold, or underline.

- [**Styled plugins**](#styled-plugins): Plugins like lsp, treesitter, nvim-cmp and more will follow the colorscheme's design.

- [**Background Transparency**](#configuration): The colorscheme offers the option to enable or disable transparency for various UI components, such as floating windows, file tree, and cursor line.


## Preview
![code](https://user-images.githubusercontent.com/41536253/208069537-610cd1a9-0ceb-4a3d-ab85-b031c020f0b7.png)
![telescope](https://user-images.githubusercontent.com/41536253/208069563-9a4ea865-14fa-40ff-ba93-c2f5916b876e.png)
![startify](https://user-images.githubusercontent.com/41536253/208069572-82b68641-d674-4e79-8f26-22ac06320730.png)
![light_code](https://user-images.githubusercontent.com/41536253/208069584-773d2825-1bf1-44e3-b514-b09ea063ba32.png)

<!-- panvimdoc-ignore-end -->
## Styled plugins
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Native LSP](https://github.com/neovim/nvim-lspconfig)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Startify](https://github.com/mhinz/vim-startify)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

## Usage
When installing, [lush](https://github.com/rktjmp/lush.nvim) is required.
Example with [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use({
    'ramojus/mellifluous.nvim',
    requires = { 'rktjmp/lush.nvim' },
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
        gitsigns = true
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
                special_comments = nil,

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
