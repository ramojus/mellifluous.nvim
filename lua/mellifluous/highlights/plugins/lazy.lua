local M = {}

function M.set(hl, colors)
    local config = require("mellifluous.config").config
    local groups = require("mellifluous.highlights.custom_groups").get(colors)

    local f_bg = hl.get("NormalFloat").bg

    local n_bg = hl.get("Normal").bg
    local bg_normal = (type(n_bg) == "string" and n_bg == "NONE") and f_bg or colors.bg2

    hl.set("LazyNormal", { bg = bg_normal })
    hl.set("LazyButton", groups.MenuButton)
    hl.set("LazyButtonActive", groups.MenuButtonSelected(f_bg))
    hl.set("LazyH1", { link = "LazyButtonActive" })

    hl.set("LazyProgressTodo", { fg = config.is_bg_dark and colors.fg5 or colors.dark_bg })
    hl.set("LazyProgressDone", { fg = colors.fg })

    hl.set("LazyDimmed", { fg = colors.fg3 })
    hl.set("LazyProp", { link = "LazyDimmed" })
end

return M
