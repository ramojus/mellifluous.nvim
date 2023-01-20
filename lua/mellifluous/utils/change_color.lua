local M = {}

local config = require('mellifluous').config

function M.get_lower_contrast(color, amount)
    if config.dark then
        return color.da(amount)
    end
    return color.li(amount)
end

function M.get_higher_contrast(color, amount)
    if config.dark then
        return color.li(amount)
    end
    return color.da(amount)
end

return M
