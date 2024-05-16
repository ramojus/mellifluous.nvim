local M = {}

function M.set(hl)
  local bg = hl.get('SignColumn').bg
	hl.set("NeotestAdapterName", { link = "Statement" })
	hl.set("NeotestBorder", { link = "ColorColumn" })
	hl.set("NeotestDir", { link = "Number" })
	hl.set("NeotestExpandMarker", { fg = hl.get("LineNr").fg })
	hl.set("NeotestFailed", { link = "DiagnosticError", bg = bg })
	hl.set("NeotestFile", { fg = hl.get("Normal").fg })
	hl.set("NeotestFocused", { fg = hl.get("Normal").fg, bold = true })
	-- hl.set("NeotestIndent", {})
	hl.set("NeotestMarked", { fg = hl.get("Todo").fg, bold = true })
	hl.set("NeotestNamespace", { link = "Include" })
	hl.set("NeotestPassed", { link = "Comment", bg = bg })
	hl.set("NeotestRunning", { link = "Function" })
	hl.set("NeotestSkipped", { fg = hl.get("MatchParen").fg })
	-- hl.set("NeotestTarget", {})
	-- hl.set("NeotestTest", {})
	hl.set("NeotestUnknown", { link = "DiagnosticWarn" })
	hl.set("NeotestWinSelect", { fg = hl.get("Todo").fg, bold = true })
end

return M
