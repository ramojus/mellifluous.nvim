local M = {}

-- Any shared highlight groups that cannot be found in general highlights or
-- treesitter highlights are created here.
function M.get(colors)
    local config = require("mellifluous.config").config
    local shader = require("mellifluous.utils.shader")

    return {
        MainKeyword = { fg = colors.main_keywords, style = config.styles.main_keywords or {} },

        IndentLine = function(bg)
            return { fg = shader.replicate_shade(colors.bg, colors.fg5, bg) }
        end,
        IndentLineInactive = function(bg)
            return {
                fg = config.is_bg_dark and shader.replicate_shade(colors.bg, colors.bg4, bg)
                    or shader.replicate_shade(colors.bg, colors.dark_bg2, bg),
            }
        end,

        MenuButton = { fg = colors.ui_blue },
        MenuButtonSelected = function(bg)
            local applied_bg = config.is_bg_dark and shader.replicate_shade(colors.bg, colors.bg4, bg)
                or shader.replicate_shade(colors.bg, colors.dark_bg2, bg)
            return {
                fg = shader.replicate_shade(colors.bg, applied_bg, colors.ui_blue),
                bg = applied_bg,
            }
        end,

        FileTree = {
            fg = colors.fg2,
            bg = (config.transparent_background.file_tree and "NONE")
                or config.flat_background.file_tree and colors.bg
                or colors.dark_bg,
        },
        FileTreeWinSeparator = function(bg)
            return {
                fg = config.flat_background.line_numbers ~= config.flat_background.file_tree and bg -- no separator if LineNr bg differs from this bg
                    or config.flat_background.line_numbers and config.flat_background.file_tree and colors.fg5 -- stronger separator if both bg are flat
                    or config.is_bg_dark and colors.bg3
                    or colors.dark_bg2,

                bg = bg,
            }
        end,

        Backdrop = {
            bg = config.is_bg_dark and "#000000"
                or require("mellifluous.color").new_from_hsl({ h = nil, s = 0, l = 70 }),
        },
    }
end

return M
