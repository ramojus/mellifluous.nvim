local M = {}

function M.replicate_shade(from_color, to_color, target)
    local from_hsl = from_color:get_hsl()
    local to_hsl = to_color:get_hsl()
    local color = require('mellifluous.color')

    local target_hsl = target:get_hsl()
    if target_hsl.h and from_hsl.h and to_hsl.h then
        target_hsl.h = target_hsl.h + to_hsl.h - from_hsl.h
    end
    target_hsl.s = target_hsl.s + to_hsl.s - from_hsl.s
    target_hsl.l = target_hsl.l + to_hsl.l - from_hsl.l

    return color.new_from_hsl(target_hsl)
end

function M.get_lower_contrast(color, amount)
    local config = require('mellifluous.config').config
    color = require('mellifluous.color').ensure_correct_type(color)

    if config.is_bg_dark then
        return color:darkened(amount)
    end
    return color:lightened(amount)
end

function M.get_higher_contrast(color, amount)
    local config = require('mellifluous.config').config
    color = require('mellifluous.color').ensure_correct_type(color)

    if config.is_bg_dark then
        return color:lightened(amount)
    end
    return color:darkened(amount)
end

return M
