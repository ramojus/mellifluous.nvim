local M = {}

local oklab_utils = require("mellifluous.utils.oklab")

local function hex_to_oklch(hex)
    local rgb = oklab_utils.hex2rgb(hex)
    local oklab = oklab_utils.rgb2oklab(rgb)
    local oklch = oklab_utils.oklab2oklch(oklab)
    return oklch
end

local function oklch_to_hex(oklch)
    local oklab = oklab_utils.oklch2oklab(oklch)
    local rgb = oklab_utils.oklab2rgb(oklab)
    local hex = oklab_utils.rgb2hex(rgb)
    return hex
end

local function hex_to_okhsl(hex)
    local oklch = hex_to_oklch(hex)
    local okhsl = oklab_utils.oklch2okhsl(oklch)
    return okhsl
end

local function okhsl_to_hex(okhsl)
    local oklch = oklab_utils.okhsl2oklch(okhsl)
    local hex = oklch_to_hex(oklch)
    return hex
end

local function clip(val, from, to)
    if val > to then
        return to
    elseif val < from then
        return from
    end
    return val
end

local color_meta = {}

function color_meta:with_overlay(overlay_color, transparency)
    local overlay_rgb = oklab_utils.hex2rgb(overlay_color.hex or overlay_color)
    local rgb = oklab_utils.hex2rgb(self.hex)

    transparency = transparency / 100

    local result_rgb = {}
    for key, _ in pairs(rgb) do
        result_rgb[key] = rgb[key] + (overlay_rgb[key] - rgb[key]) * transparency
    end

    return M.new(oklab_utils.rgb2hex(result_rgb))
end

function color_meta:lightened(val)
    local oklch = hex_to_oklch(self.hex)
    oklch.l = clip(oklch.l + val, 0, 100)
    return M.new(oklch_to_hex(oklch))
end

function color_meta:darkened(val)
    return self:lightened(-val)
end

function color_meta:with_lightness(val)
    local oklch = hex_to_oklch(self.hex)
    oklch.l = clip(val, 0, 100)
    return M.new(oklch_to_hex(oklch))
end

function color_meta:saturated(val)
    local okhsl = hex_to_okhsl(self.hex)
    okhsl.s = clip(okhsl.s + val, 0, 100)
    return M.new(okhsl_to_hex(okhsl))
end

function color_meta:desaturated(val)
    return self:saturated(-val)
end

function color_meta:with_saturation(val)
    local okhsl = hex_to_okhsl(self.hex)
    okhsl.s = clip(val, 0, 100)
    return M.new(okhsl_to_hex(okhsl))
end

function color_meta:get_hsl()
    return hex_to_okhsl(self.hex)
end

function M.colorset_to_hsl(colors)
    for name, color in pairs(colors) do
        local okhsl = hex_to_okhsl(color.hex)
        okhsl.h = okhsl.h or 0
        print(string.format("%s = { h = %0.0f, s = %0.0f, l = %0.0f }", name, okhsl.h, okhsl.s, okhsl.l))
    end
end

function M.ensure_correct_type(color)
    if not color.hex then
        return M.new(color)
    end
    return color
end

function M.new(hex)
    local color = { hex = hex }
    setmetatable(color, { __index = color_meta })
    return color
end

function M.new_from_hsl(hsl)
    local color = { hex = okhsl_to_hex(hsl) }
    setmetatable(color, { __index = color_meta })
    return color
end

return M
