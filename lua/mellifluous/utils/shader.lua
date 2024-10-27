local M = {}

local bg_color

local function clip(val, from, to)
    if val > to then
        return to
    elseif val < from then
        return from
    end
    return val
end

function M.replicate_shade(from_color, to_color, target)
    -- assume bg_color for any transparent colors
    from_color = from_color ~= "NONE" and from_color or bg_color
    to_color = to_color ~= "NONE" and to_color or bg_color
    target = target ~= "NONE" and target or bg_color

    local from_hsl = from_color:get_hsl()
    local to_hsl = to_color:get_hsl()
    local color = require("mellifluous.color")

    local target_hsl = target:get_hsl()
    if target_hsl.h and from_hsl.h and to_hsl.h then
        target_hsl.h = clip(target_hsl.h + to_hsl.h - from_hsl.h, 0, 360)
    elseif from_hsl.h ~= to_hsl.h then
        if to_hsl.h == nil then
            target_hsl.h = nil
        else
            require("mellifluous").return_error(
                "this shade changes hue, but at least one of the colors is neutral, without hue"
            )
        end
    end
    target_hsl.s = clip(target_hsl.s + to_hsl.s - from_hsl.s, 0, 100)
    target_hsl.l = clip(target_hsl.l + to_hsl.l - from_hsl.l, 0, 100)

    return color.new_from_hsl(target_hsl)
end

function M.get_lower_contrast(color, amount)
    local config = require("mellifluous.config").config
    color = require("mellifluous.color").ensure_correct_type(color)

    if config.is_bg_dark then
        return color:darkened(amount)
    end
    return color:lightened(amount)
end

function M.get_higher_contrast(color, amount)
    local config = require("mellifluous.config").config
    color = require("mellifluous.color").ensure_correct_type(color)

    if config.is_bg_dark then
        return color:lightened(amount)
    end
    return color:darkened(amount)
end

function M.set_background_color(new_bg_color)
    bg_color = new_bg_color
end

return M
