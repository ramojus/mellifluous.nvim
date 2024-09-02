local M = {}

function M.set(hl, colors)
    local config = require("mellifluous.config").config

    hl.set("OilDir", { fg = (config.is_bg_dark and colors.ui_yellow) or hl.get("Directory").fg })
end

return M
