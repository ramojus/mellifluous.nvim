local M = {}

local function replicate_floating_shade(hl, diff_bg_color)
    local shader = require("mellifluous.utils.shader")
    return shader.replicate_shade(hl.get("Normal").bg, hl.get("NormalFloat").bg, diff_bg_color)
end

function M.set(hl, colors)
    local bg = hl.get("SignColumn").bg
    local config = require("mellifluous.config").config

    -- signs
    if config.is_bg_dark then
        hl.set("GitSignsAdd", { fg = colors.green:with_lightness(40):with_saturation(60), bg = bg })
        hl.set("GitSignsChange", { fg = colors.orange:with_lightness(55):with_saturation(80), bg = bg })
        hl.set("GitSignsDelete", { fg = colors.red:with_lightness(45):with_saturation(60), bg = bg })
    else
        hl.set("GitSignsAdd", { fg = colors.green:with_lightness(75):with_saturation(80), bg = bg })
        hl.set("GitSignsChange", { fg = colors.orange:with_lightness(70):with_saturation(80), bg = bg })
        hl.set("GitSignsDelete", { fg = colors.red:with_lightness(75):with_saturation(80), bg = bg })
    end

    -- preview of change
    hl.set("GitSignsDeletePreview", { bg = replicate_floating_shade(hl, hl.get("DiffDelete").bg) })
    hl.set("GitSignsAddPreview", { bg = replicate_floating_shade(hl, hl.get("DiffAdd").bg) })
    hl.set("GitSignsChangePreview", { bg = replicate_floating_shade(hl, hl.get("DiffChange").bg) })

    local inline_lightnened_val = 8
    hl.set("GitSignsDeleteInline", { bg = hl.get("GitSignsDeletePreview").bg:lightened(inline_lightnened_val) })
    hl.set("GitSignsAddInline", { bg = hl.get("GitSignsAddPreview").bg:lightened(inline_lightnened_val) })
    hl.set("GitSignsChangeInline", { bg = hl.get("GitSignsChangePreview").bg:lightened(inline_lightnened_val) })

    -- in-place preview of change (without floating window)
    hl.set("GitSignsDeleteLnInline", { bg = hl.get("DiffDelete").bg:lightened(inline_lightnened_val) })
    hl.set("GitSignsAddLnInline", { bg = hl.get("DiffAdd").bg:lightened(inline_lightnened_val) })
    hl.set("GitSignsChangeLnInline", { bg = hl.get("DiffChange").bg:lightened(inline_lightnened_val) })
end

return M
