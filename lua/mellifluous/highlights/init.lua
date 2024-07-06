local M = {}

function M.set(hl, colors)
    require("mellifluous.highlights.general").set(hl, colors)
    require("mellifluous.highlights.plugins").set(hl, colors)
end

return M
