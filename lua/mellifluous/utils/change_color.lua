local M = {}

function M.get_lower_contrast(color, amount)
    local config = require('mellifluous').config
    if config.is_bg_dark then
        return color:darkened(amount)
    end
    return color:lightened(amount)
end

function M.get_higher_contrast(color, amount)
    local config = require('mellifluous').config
    if config.is_bg_dark then
        return color:lightened(amount)
    end
    return color:darkened(amount)
end

return M
