local M = {}

function M.set(hl, colors)
    local config = require("mellifluous.config").config
    local groups = require("mellifluous.highlights.custom_groups").get(colors)
    local bg = hl.get("NormalFloat").bg

    hl.set("LazyNormal", { bg = bg })
    hl.set("LazyButton", groups.MenuButton)
    hl.set("LazyButtonActive", groups.MenuButtonSelected(bg))
    hl.set("LazyH1", { link = "LazyButtonActive" })

    hl.set("LazyProgressTodo", { fg = config.is_bg_dark and colors.fg5 or colors.dark_bg })
    hl.set("LazyProgressDone", { fg = colors.fg })

    hl.set("LazyDimmed", { fg = colors.fg3 })
    hl.set("LazyProp", { link = "LazyDimmed" })
end

return M
