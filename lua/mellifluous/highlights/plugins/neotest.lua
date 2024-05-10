local M = {}

function M.set(hl, colors)
	local bg = hl.get("SignColumn").bg
	local config = require("mellifluous.config").config

	if config.is_bg_dark then
		hl.set("NeotestPassed", { fg = colors.green:with_lightness(40):with_saturation(60), bg = bg })
		hl.set("NeotestFailed", { fg = colors.red:with_lightness(45):with_saturation(60), bg = bg })
	else
		hl.set("NeotestPassed", { fg = colors.green:with_lightness(75):with_saturation(80), bg = bg })
		hl.set("NeotestFailed", { fg = colors.red:with_lightness(75):with_saturation(80), bg = bg })
	end
	hl.set("NeotestRunning", { fg = colors.fg2 })
	hl.set("NeotestSkipped", { fg = colors.fg })
	hl.set("NeotestTest", { fg = colors.fg })
	hl.set("NeotestNamespace", { fg = colors.fg })
	hl.set("NeotestFocused", { link = "CursorLine" })
	hl.set("NeotestFile", { fg = colors.fg })
	hl.set("NeotestDir", { fg = hl.get("Directory").fg })
	hl.set("NeotestIndent", { fg = colors.fg5 })
	hl.set("NeotestExpandMarker", { fg = colors.fg })
	hl.set("NeotestAdapterName", { fg = colors.ui_orange })
	hl.set("NeotestWinSelect", { fg = colors.fg })
	hl.set("NeotestMarked", { fg = colors.fg, bg = colors.bg3 })
	hl.set("NeotestTarget", { fg = colors.fg })
	hl.set("NeotestUnknown", { fg = colors.fg })
end

return M
