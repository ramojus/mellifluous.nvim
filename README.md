<!-- panvimdoc-ignore-start -->

> [!IMPORTANT]
> v1 was just released. To transfer your config to v1, use [Migration guidelines](https://github.com/ramojus/mellifluous.nvim/wiki/Migration-from-v0-to-v1-guidelines), or, if you don't want to switch now, lock the version of this plugin to v0 (or pin to commit ba89cdf).

# Mellifluous
A colorscheme for [Neovim](https://github.com/neovim/neovim). Pleasant and productive, with stronger highlights on important keywords.
![preview](https://github.com/ramojus/mellifluous.nvim/assets/41536253/a4b01a46-6ec9-408a-9c2f-08995c53155a)

## Highlighted features
- [**Multiple colorsets**](#colorsets): Each colorset presents a unique visual theme while adhering to the same set of productive highlight rules. Every colorset [can be customised](#color-overrides).

- **Layered backgrounds**: Most UI elements have backgrounds with different shades of the background color and have no borders. This allows for easy differentiation between the relative importance of the elements and keeps the colorscheme looking minimal.

- [**Oklab color space**](https://bottosson.github.io/posts/oklab/): To truly achieve perceptually uniform variations of colors, all color modifications are done in this color space; thanks to [mini.colors](https://github.com/echasnovski/mini.colors) project for the code and idea.

- **Small number of colors**: Colorsets use a small number of colors to provide distraction-free coding experience.

- **Stronger highlights on important keywords**: Keywords related to control flow have stronger highlights, making it easier to quickly understand the code.

<!-- panvimdoc-ignore-end -->
## Styled plugins
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Native LSP](https://github.com/neovim/nvim-lspconfig)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [Neo-Tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [Blink.cmp](https://github.com/Saghen/blink.cmp)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Startify](https://github.com/mhinz/vim-startify)
- [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [Neorg](https://github.com/nvim-neorg/neorg)
- [Nvim-notify](https://github.com/rcarriga/nvim-notify)
- [Aerial](https://github.com/stevearc/aerial.nvim)
- [Neotest](https://github.com/nvim-neotest/neotest)
- [Lazy](https://github.com/folke/lazy.nvim)
- [Mason](https://github.com/williamboman/mason.nvim)
- [Nvim-DAP-UI](https://github.com/rcarriga/nvim-dap-ui)

## Installation and usage
Example with [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use({
    "ramojus/mellifluous.nvim",
    -- version = "v0.*", -- uncomment for stable config (some features might be missed if/when v1 comes out)
    config = function()
        require("mellifluous").setup({}) -- optional, see configuration section.
        vim.cmd("colorscheme mellifluous")
    end,
})
```

## Configuration
[Here](./lua/mellifluous/default_config.lua) is the default config. The default config doesn't include all of the options – below is the documentation that describes more options. To set or override any of the options, use the `setup` function, e.g.:

```lua
require("mellifluous").setup({
    styles = { -- see :h attr-list for options. set {} for NONE, { option = true } for option
        main_keywords = { bold = true },
    },
})
```

### Light theme
For light theme, set `vim.opt.background` to `"light"`. This will only work on colorsets that have light theme.

### Colorsets
Non-original colorsets are made to match their original version as closely as possible with the same highlight rules as mellifluous.

These colorsets don't get loaded, unless you specify them in a `colorset` option, so there is no performance impact.

Available colorsets:

- `mellifluous`. Dark and light, original.
- `alduin`. Dark, [link to original](https://github.com/alessandroyorba/alduin).
- `mountain`. Dark, [link to original](https://github.com/mountain-theme/mountain).
- `tender`. Dark, [link to original](https://github.com/jacoborus/tender.vim).
- `kanagawa_dragon`. Dark, [link to original](https://github.com/rebelot/kanagawa.nvim).

#### Mellifluous colorset configuration
Default config:

```lua
require("mellifluous").setup({
    mellifluous = {
        neutral = true, -- set this to false for original mellifluous (when it was called meliora theme)
    },
})
```

### Color overrides
The following snippet shows where and which colors can be overridden:

```lua
require("mellifluous").setup({
    <colorset_name> = { -- name any of the defined colorsets
        color_overrides = {
            dark = { -- for dark theme
                bg = function(bg) -- bg is used for bg shades and may be used for some colorset colors
                    return <new bg>
                end,
                colors = function(colors)
                    return {
                        <new colors> -- check "Available colors" section for colors that can be used and overriden.
                    }
                end,
            },
            light = { -- for light theme
                -- same keys as in dark variant
            },
        },
    },
})
```

To override colors for all colorsets, omit `<colorset_name>` table.

NOTE: parameter `colors` will have all of the colors set by the colorset, but it will not have shades.

Example:

```lua
require("mellifluous").setup({
    -- invert bg shades for all colorsets
    color_overrides = {
        dark = {
            colors = function(colors)
                return {
                    bg2 = colors.bg:darkened(2),
                    bg3 = colors.bg:darkened(4),
                    bg4 = colors.bg:darkened(6),
                    bg5 = colors.bg:darkened(8),
                }
            end,
        }
    },
    -- modify some colors for mellifluous colorset
    mellifluous = {
        color_overrides = {
            dark = {
                bg = function(bg)
                    return bg:lightened(2)
                end,
                colors = function(colors)
                    return {
                        main_keywords = "#e0e066",
                        operators = colors.functions:desaturated(10),
                    }
                end,
            },
        },
    },
})
```

### Highlight overrides
The following snippet shows how highlight overrides can be defined:
```lua
require("mellifluous").setup({
    -- highlight overrides for all colorsets
    highlight_overrides = {
        dark = function(highlighter, colors) -- dark theme
            -- set highlights here (using highlighter)
        end,
        light = function(highlighter, colors) -- light theme
            -- set highlights here (using highlighter)
        end,
    },
    -- highlight overrides for specific colorset
    <colorset_name> = {
        highlight_overrides = {
            dark = function(highlighter, colors) -- dark variant of the colorset
                -- set highlights here (using highlighter)
            end,
            light = function(highlighter, colors) -- light variant of the colorset
                -- set highlights here (using highlighter)
            end,
        },
    },
})
```

For an example on how to set the highlights, check [the source code for general highlights](lua/mellifluous/highlights/general.lua), where `M.set` function has the same signature as `dark` or `light` functions seen above. A detailed documentation is provided below.

#### Highlighter usage
This is the signature to set a highlight:

```lua
highlighter.set(name, definition_map)
```

Parameters:

- `name`: highlight group name in string format
- `definition_map`: highlight definition map in table format, the supported keys can be found in `:h nvim_set_hl`. Keys `fg`, `bg` and `sp` can also be set to any of the available colors (see [available colors](#available-colors)).

To get an existing highlight, use this function:

```lua
highlighter.get(name)
```

This function returns highlight definition map for highlight group with the requested name. 

### Available colors
Named colors are used several times in configuration (as parameter `colors` of some function). This section lists and explains those colors.

Available colors:

- Syntax element colors
    - `main_keywords`: used to indicate keywords related to control flow.
    - `other_keywords`
    - `types`
    - `operators`
    - `strings`
    - `functions`
    - `constants`
    - `comments`
    - `fg`: in code -- identifiers.
    - `bg`
- Named colors: used for terminal colors, but most of these colors will match some syntax element color.
    - `red`
    - `orange`
    - `green`
    - `blue`
    - `purple`
    - `yellow`
- Shades: colors that are derived from colors defined in the colorset (those listed above).
    - UI colors: same as named colors, but all are of the same brightness (lightness).
        - `ui_red`: used to indicate errors, deletes, bad spellings.
        - `ui_orange`: used to indicate warnings, changes, other (strange) spellings.
        - `ui_green`: used to indicate staged, additions.
        - `ui_blue`: used to indicate information, new files.
        - `ui_purple`: used to indicate hints, merge.
        - `ui_yellow`
    - Shades of fg and bg colors. These colors might be used for more than explained below.
        - `fg2`: used for statusline, normal text in plugins that open in split windows.
        - `fg3`: used for folded text.
        - `fg4`: used for line numbers.
        - `fg5`: used for active indent line, "hidden" text.
        - `dark_bg`: used for background in plugins that open in split windows.
        - `bg2`: used for cursorline/column, some floating windows.
        - `bg3`: used for folded text background, floating windows, showing LSP references.
        - `bg4`: used for visual mode, completion menu, statusline, fg of inactive indent line.
        - `bg5` (only for dark background): indicates a more prominent selection than visual, might be deprecated in the future.
        - `dark_bg2`(only for light background): used as a replacement for bg5 and also for visual mode

Some colorsets may have more colors available. To check that, refer to [the source of the colorset](lua/mellifluous/colors/colorsets/).

#### Color functions
Every color from [available colors](#available-colors) has the following meta functions (accessed with `:` operator):

- `lightened(val)`: returns color with `val` added current to lightness.
- `darkened(val)`: returns color with `val` subtracted from current lightness.
- `with_lightness(val)`: returns color with specified lightness, where `val` can be from 0 to 100.
- `saturated(val)`: returns color with `val` added to current saturation.
- `desaturated(val)`: returns color with `val` subtracted from current saturation.
- `with_saturation(val)`: returns color with specified saturation, where `val` can be from 0 to 100.

To create your own color that has the same functions available, use `require("mellifluous.color").new(hex_value)` function.

## CLI options
Type `:Mellifluous <TAB>` and see the available options.

Options include:

- Toggling transparency.
- Changing colorset.

## TODO
- [ ] Support more plugins (contributions are welcome).

## Ports
- [Helix](https://github.com/helix-editor/helix/wiki/Themes#meliora) (with slightly outdated color palette)
- [iTerm2](https://github.com/mbadolato/iTerm2-Color-Schemes) (plus additional terminal emulator ports, courtesy of iTerm2-Color-Schemes)

## Inspiration
- [Mountain and Mountaineer](https://github.com/mountain-theme/mountain)
- [Alduin](https://github.com/alessandroyorba/alduin)
- [Melange](https://github.com/savq/melange)
- [Sema](https://github.com/arzg/sema)

<!-- panvimdoc-ignore-start -->
## License
[MIT](./LICENSE)
<!-- panvimdoc-ignore-end -->
