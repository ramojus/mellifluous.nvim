local M = {}

local function replicate_winbar_shade(hl, target_color)
    local shader = require("mellifluous.utils.shader")
    return shader.replicate_shade(hl.get("Normal").bg, hl.get("WinBar").bg, target_color)
end

local function replicate_winbarnc_shade(hl, target_color)
    local shader = require("mellifluous.utils.shader")
    return shader.replicate_shade(hl.get("Normal").bg, hl.get("WinBarNC").bg, target_color)
end

function M.set(hl, colors)
    local groups = require("mellifluous.highlights.custom_groups").get(colors)

    -- Controls
    local green_ctrl = { bg = hl.get("WinBar").bg, fg = replicate_winbar_shade(hl, colors.ui_green) }
    local green_ctrl_nc = { bg = hl.get("WinBarNC").bg, fg = replicate_winbarnc_shade(hl, colors.ui_green) }
    local red_ctrl = { bg = hl.get("WinBar").bg, fg = replicate_winbar_shade(hl, colors.ui_red) }
    local red_ctrl_nc = { bg = hl.get("WinBarNC").bg, fg = replicate_winbarnc_shade(hl, colors.ui_red) }
    local blue_ctrl = { bg = hl.get("WinBar").bg, fg = replicate_winbar_shade(hl, colors.ui_blue) }
    local blue_ctrl_nc = { bg = hl.get("WinBarNC").bg, fg = replicate_winbarnc_shade(hl, colors.ui_blue) }
    local muted_ctrl = { bg = hl.get("WinBar").bg, fg = replicate_winbar_shade(hl, colors.fg4) }
    local muted_ctrl_nc = { bg = hl.get("WinBarNC").bg, fg = replicate_winbarnc_shade(hl, colors.fg4) }
    hl.set("DapUIPlayPause", green_ctrl)
    hl.set("DapUIPlayPauseNC", green_ctrl_nc)
    hl.set("DapUIRestart", green_ctrl)
    hl.set("DapUIRestartNC", green_ctrl_nc)
    hl.set("DapUIStop", red_ctrl)
    hl.set("DapUIStopNC", red_ctrl_nc)
    hl.set("DapUIStepInto", blue_ctrl)
    hl.set("DapUIStepIntoNC", blue_ctrl_nc)
    hl.set("DapUIStepOver", blue_ctrl)
    hl.set("DapUIStepOverNC", blue_ctrl_nc)
    hl.set("DapUIStepOut", blue_ctrl)
    hl.set("DapUIStepOutNC", blue_ctrl_nc)
    hl.set("DapUIStepBack", blue_ctrl)
    hl.set("DapUIStepBackNC", blue_ctrl_nc)
    hl.set("DapUIUnavailable", muted_ctrl)
    hl.set("DapUIUnavailableNC", muted_ctrl_nc)

    -- Scopes
    hl.set("DapUIScope", { fg = hl.get("Title").fg })
    hl.set("DapUIType", { fg = hl.get("Type").fg })
    hl.set("DapUIVariable", { fg = hl.get("Identifier").fg })
    hl.set("DapUIModifiedValue", { fg = hl.get("Changed").fg, bold = true })
    hl.set("DapUIDecoration", groups.IndentLine(colors.bg))

    -- Breakpoints
    hl.set("DapUIBreakpointsPath", { fg = colors.fg2 })
    hl.set("DapUILineNumber", { fg = hl.get("Number").fg })
    hl.set("DapUIBreakpointsCurrentLine", { fg = hl.get("Number").fg, bold = true })

    -- Stacks
    hl.set("DapUIThread", { fg = colors.green })
    hl.set("DapUIStoppedThread", { fg = hl.get("Function").fg })
    hl.set("DapUISource", { fg = colors.fg2 })

    -- Watches
    hl.set("DapUIWatchesEmpty", { fg = colors.fg3 })
    hl.set("DapUIWatchesValue", { fg = hl.get("Function").fg })
    hl.set("DapUIWatchesError", { fg = hl.get("Error").fg })
end

return M
