local M = {}

function M.set(hl, colors)
    local shader = require("mellifluous.utils.shader")
    local config = require("mellifluous.config").config
    local groups = require("mellifluous.highlights.custom_groups").get(colors)

    hl.set("Normal", {
        bg = (config.transparent_background.enabled and "NONE") or colors.bg,
        fg = colors.fg,
    }) -- Normal text
    hl.set("NormalNC", {
        bg = (config.dim_inactive and colors.dark_bg)
            or (config.transparent_background and "NONE")
            or hl.get("Normal").bg,
    }) -- normal text in non-current windows
    hl.set("ColorColumn", { bg = colors.dark_bg }) -- Columns set with 'colorcolumn'
    hl.set("Conceal", { fg = colors.fg5 }) -- Placeholder characters substituted for concealed text (see 'conceallevel')
    hl.set("Cursor", { bg = colors.other_keywords, fg = colors.bg }) -- Character under the cursor
    hl.set("lCursor", { link = "Cursor" }) -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    hl.set("CursorIM", { link = "Cursor" }) -- Like Cursor, but used when in IME mode |CursorIM|
    hl.set("CursorColumn", { bg = colors.bg2 }) -- Screen-column at the cursor, when 'cursorcolumn' is set.
    hl.set("CursorLine", {
        bg = (config.transparent_background.cursor_line and "NONE") or colors.bg2,
    }) -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    hl.set("Directory", { fg = colors.functions }) -- Directory names (and other special names in listings)
    hl.set("DiffAdd", { bg = colors.bg:with_overlay(colors.ui_green, 15):saturated(20) }) -- Diff mode: Added line |diff.txt|
    hl.set("DiffDelete", { bg = colors.bg:with_overlay(colors.ui_red, 15):saturated(20) }) -- Diff mode: Deleted line |diff.txt|
    hl.set("DiffChange", { bg = colors.bg:with_overlay(colors.ui_orange, 15):saturated(20) }) -- Diff mode: Changed line |diff.txt|
    hl.set("DiffText", { bg = colors.bg:with_overlay(colors.ui_orange, 30):saturated(20) }) -- Diff mode: Changed text within a changed line |diff.txt|
    hl.set("Added", { fg = colors.ui_green }) -- Added text (doc, git, etc.)
    hl.set("Removed", { fg = colors.ui_red }) -- Removed text (doc, git, etc.)
    hl.set("Changed", { fg = colors.ui_orange }) -- Changed text (doc, git,, etc.)
    hl.set("EndOfBuffer", { fg = colors.bg }) -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    hl.set("TermCursor", { link = "Cursor" }) -- Cursor in a focused terminal
    hl.set("TermCursorNC", { bg = colors.fg5 }) -- Cursor in an unfocused terminal
    hl.set("ErrorMsg", { fg = colors.red }) -- Error messages on the command line
    hl.set("VertSplit", {
        fg = colors.fg5,
        bg = (config.dim_inactive and hl.get("NormalNC").bg)
            or (config.transparent_background.enabled and "NONE")
            or hl.get("Normal").bg,
    }) -- Column separating vertically split windows
    hl.set("Folded", { bg = colors.bg3, fg = colors.fg3, style = config.styles.folds or {} }) -- Line used for closed folds
    hl.set("FoldColumn", { link = "LineNr" }) -- 'foldcolumn'
    hl.set("LineNr", {
        fg = colors.fg4,
        bg = (config.transparent_background.enabled and "NONE") or (config.flat_background.line_numbers and hl.get(
            "Normal"
        ).bg) or colors.dark_bg,
    }) -- Line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
    hl.set("SignColumn", { link = "LineNr" }) -- Column where |signs| are displayed
    hl.set("Search", { bg = colors.bg:with_overlay(colors.ui_yellow, 25) }) -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    hl.set("IncSearch", { bg = colors.ui_yellow, fg = colors.bg }) -- 'incsearch' highlighting; also used for the text replaced with ':s///c'
    hl.set("CurSearch", { link = "Search" }) -- Search pattern under the cursor
    hl.set("Substitute", { link = "IncSearch" }) -- |:substitute| replacement text highlighting
    hl.set("CursorLineNr", {
        bg = (config.flat_background.cursor_line_number and hl.get("LineNr").bg)
            or (config.flat_background.line_numbers and hl.get("CursorLine").bg)
            or (config.transparent_background.enabled and "NONE")
            or shader.replicate_shade(colors.bg, colors.dark_bg, hl.get("CursorLine").bg),
        fg = hl.get("LineNr").fg,
    }) -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    hl.set("MatchParen", { bg = colors.bg4, fg = colors.main_keywords }) -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    hl.set("ModeMsg", { fg = colors.fg3 }) -- 'showmode' message (e.g., '-- INSERT -- ')
    hl.set("MsgArea", { link = "Normal" }) -- Area for messages and cmdline
    hl.set("MsgSeparator", { link = "VertSplit" }) -- Separator for scrolled messages, `msgsep` flag of 'display'
    hl.set("MoreMsg", { fg = colors.other_keywords }) -- |more-prompt|
    hl.set("NonText", { link = "Conceal" }) -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., '>' displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    hl.set("Title", { fg = colors.other_keywords }) -- Titles for output from ':set all', ':autocmd' etc.
    hl.set("NormalFloat", {
        bg = (config.transparent_background.floating_windows and "NONE")
            or (config.flat_background.floating_windows and hl.get("Normal").bg)
            or colors.bg3,
    }) -- Normal text in floating windows.
    hl.set("FloatBorder", {
        bg = hl.get("NormalFloat").bg,
        fg = (
            (config.transparent_background.floating_windows or config.flat_background.floating_windows)
            and colors.fg4
        ) or hl.get("NormalFloat").bg,
    })
    hl.set("FloatTitle", { bg = hl.get("NormalFloat").bg, fg = colors.comments })
    hl.set("FloatShadow", { bg = colors.dark_bg })
    hl.set("Pmenu", { bg = colors.bg3, fg = config.is_bg_dark and colors.fg3 or colors.fg4 }) -- Popup menu: Normal item.
    hl.set("PmenuSel", { bg = groups.MenuButtonSelected(colors.bg3).bg }) -- Popup menu: Selected item.
    hl.set("PmenuSbar", { bg = colors.bg3 }) -- Popup menu: Scrollbar.
    hl.set("PmenuThumb", { bg = colors.fg5 }) -- Popup menu: Thumb of the scrollbar.
    hl.set("Question", { fg = colors.other_keywords }) -- |hit-enter| prompt and yes/no questions
    hl.set("QuickFixLine", { link = "Normal" }) -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    hl.set("SpecialKey", { fg = colors.other_keywords }) -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    hl.set("SpellBad", { fg = colors.red }) -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    hl.set("SpellCap", { fg = colors.orange }) -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    hl.set("SpellLocal", { fg = colors.orange }) -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    hl.set("SpellRare", { fg = colors.orange }) -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    hl.set("StatusLine", {
        bg = (config.transparent_background.status_line and "NONE") or colors.bg4,
        fg = colors.fg2,
    }) -- Status line of current window
    hl.set("StatusLineNC", {
        bg = (config.transparent_background.status_line and "NONE") or colors.bg2,
        fg = colors.fg4,
    }) -- Status lines of not-current windows. Note: If this is equal to 'StatusLine' Vim will use '^^^' in the status line of the current window.
    hl.set("TabLine", { bg = hl.get("StatusLine").bg, fg = colors.fg3 }) -- Tab pages line, not active tab page label
    hl.set("TabLineFill", { link = "TabLine" }) -- Tab pages line, where there are no labels
    hl.set("TabLineSel", { bg = colors.bg2, fg = colors.fg2 }) -- Tab pages line, active tab page label
    hl.set("Visual", { bg = config.is_bg_dark and colors.bg4 or colors.dark_bg2 }) -- Visual mode selection
    hl.set("VisualNOS", { bg = colors.bg3 }) -- Visual mode selection when vim is 'Not Owning the Selection'.
    hl.set("WarningMsg", { fg = colors.red }) -- Warning messages
    hl.set("Whitespace", { fg = colors.fg5 }) -- 'nbsp', 'space', 'tab' and 'trail' in 'listchars'
    hl.set("WinSeparator", { link = "VertSplit" }) -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    hl.set("WildMenu", { link = "PmenuSel" }) -- Current match in 'wildmenu' completion
    hl.set("WinBar", { link = "StatusLine" }) -- Winbar line, current
    hl.set("WinBarNC", { link = "StatusLineNC" }) -- Winbar line, not current

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.
    hl.set("Comment", { fg = colors.comments, style = config.styles.comments or {} }) -- Any comment
    hl.set("Constant", { fg = colors.constants, style = config.styles.constants or {} } ) -- (*) Any constant
    hl.set("String", { fg = colors.strings, style = config.styles.strings or {} }) --   A string constant: 'this is a string'
    hl.set("Character", { fg = hl.get("String").fg }) --   A character constant: 'c', '\n'
    hl.set("Number", { link = "Constant" }) --   A number constant: 234, 0xff
    hl.set("Boolean", { link = "Constant" }) --   A boolean constant: TRUE, false
    hl.set("Float", { link = "Constant" }) --   A floating point constant: 2.3e10
    hl.set("Identifier", { fg = colors.fg }) -- (*) Any variable name
    hl.set("Function", { fg = colors.functions, style = config.styles.functions or {} }) --   Function name (also: methods for classes)
    hl.set("Statement", { link = "Keyword" }) -- (*) Any statement
    hl.set("Conditional", groups.MainKeyword) --   if, then, else, endif, switch, etc.
    hl.set("Repeat", groups.MainKeyword) --   for, do, while, etc.
    hl.set("Label", { fg = colors.other_keywords })
    hl.set("Operator", {
        fg = config.is_bg_dark and colors.operators or colors.fg3,
        style = config.styles.operators or {},
    }) --   'sizeof', '+', '*', etc.
    hl.set("Keyword", { fg = colors.other_keywords, style = config.styles.other_keywords }) --   any other keyword
    hl.set("Exception", groups.MainKeyword) --   try, catch, throw
    hl.set("PreProc", { fg = colors.functions }) -- (*) Generic Preprocessor
    hl.set("Include", { link = "PreProc" }) --   Preprocessor #include
    hl.set("Define", { link = "PreProc" }) --   Preprocessor #define
    hl.set("Macro", { link = "PreProc" }) --   Same as Define
    hl.set("PreCondit", { link = "PreProc" }) --   Preprocessor #if, #else, #endif, etc.
    hl.set("Type", { fg = colors.types, style = config.styles.types or {} }) -- (*) int, long, char, etc.
    hl.set("StorageClass", { link = "Type" }) --   static, register, volatile, etc.
    hl.set("Structure", { link = "Type" }) --   struct, union, enum, etc.
    hl.set("Typedef", { link = "Type" }) --   A typedef
    hl.set("Special", { fg = colors.other_keywords }) -- (*) Any special symbol
    hl.set("SpecialChar", { link = "Special" }) --   Special character in a constant
    hl.set("Tag", { link = "Special" }) --   You can use CTRL-] on this
    hl.set("Delimiter", { link = "Operator" }) --   Character that needs attention
    hl.set("SpecialComment", { link = "Special" }) --   Special things inside a comment (e.g. '\n')
    hl.set("Debug", { link = "Special" }) --   Debugging statements
    hl.set("Underlined", { underline = true, fg = colors.fg3 }) -- Text that stands out, HTML links
    hl.set("Bold", { bold = config.bold })
    hl.set("Italic", { italic = config.italic })
    hl.set("Ignore", { fg = colors.fg5 }) -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    hl.set("Error", { fg = colors.red }) -- Any erroneous construct
    hl.set("Todo", { bg = colors.bg:with_overlay(colors.ui_green, 20), fg = colors.ui_green }) -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.
    hl.set("LspReferenceText", { bg = colors.bg3 }) -- Used for highlighting 'text' references
    hl.set("LspReferenceRead", { link = "LspReferenceText" }) -- Used for highlighting 'read' references
    hl.set("LspReferenceWrite", { link = "LspReferenceText" }) -- Used for highlighting 'write' references
    hl.set("LspCodeLens", { bg = colors.bg2 }) -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    hl.set("LspCodeLensSeparator", { fg = colors.fg5 }) -- Used to color the seperator between two or more code lens.
    hl.set("LspSignatureActiveParameter", { bg = colors.bg4 }) -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    hl.set("DiagnosticError", { fg = colors.ui_red }) -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    hl.set("DiagnosticWarn", { fg = colors.ui_orange }) -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    hl.set("DiagnosticInfo", { fg = colors.ui_blue }) -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    hl.set("DiagnosticHint", { fg = colors.ui_purple }) -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    hl.set("DiagnosticOk", { fg = colors.ui_green }) -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    hl.set("DiagnosticVirtualTextError", {
        fg = hl.get("DiagnosticError").fg,
        bg = (config.transparent_background.enabled and "NONE")
            or colors.bg:with_overlay(hl.get("DiagnosticError").fg, 12),
    }) -- Used for 'Error' diagnostic virtual text.
    hl.set("DiagnosticVirtualTextWarn", {
        fg = hl.get("DiagnosticWarn").fg,
        bg = (config.transparent_background.enabled and "NONE")
            or colors.bg:with_overlay(hl.get("DiagnosticWarn").fg, 12),
    }) -- Used for 'Warn' diagnostic virtual text.
    hl.set("DiagnosticVirtualTextInfo", {
        fg = hl.get("DiagnosticInfo").fg,
        bg = (config.transparent_background.enabled and "NONE")
            or colors.bg:with_overlay(hl.get("DiagnosticInfo").fg, 12),
    }) -- Used for 'Info' diagnostic virtual text.
    hl.set("DiagnosticVirtualTextHint", {
        fg = hl.get("DiagnosticHint").fg,
        bg = (config.transparent_background.enabled and "NONE")
            or colors.bg:with_overlay(hl.get("DiagnosticHint").fg, 12),
    }) -- Used for 'Hint' diagnostic virtual text.
    hl.set("DiagnosticVirtualTextOk", {
        fg = hl.get("DiagnosticOk").fg,
        bg = (config.transparent_background.enabled and "NONE")
            or colors.bg:with_overlay(hl.get("DiagnosticOk").fg, 12),
    }) -- Used for 'Ok' diagnostic virtual text.
    hl.set("DiagnosticUnderlineError", { underline = true, sp = hl.get("DiagnosticError").fg }) -- Used to underline 'Error' diagnostics.
    hl.set("DiagnosticUnderlineWarn", { underline = true, sp = hl.get("DiagnosticWarn").fg }) -- Used to underline 'Warn' diagnostics.
    hl.set("DiagnosticUnderlineInfo", { underline = true, sp = hl.get("DiagnosticInfo").fg }) -- Used to underline 'Info' diagnostics.
    hl.set("DiagnosticUnderlineHint", { underline = true, sp = hl.get("DiagnosticHint").fg }) -- Used to underline 'Hint' diagnostics.
    hl.set("DiagnosticUnderlineOk", { underline = true, sp = hl.get("DiagnosticOk").fg }) -- Used to underline 'Ok' diagnostics.
    hl.set("DiagnosticUnnecessary", { underline = true }) -- Used to underline unnecessary or unused code.
    hl.set("DiagnosticSignError", { fg = hl.get("DiagnosticError").fg, bg = hl.get("LineNr").bg }) -- Used for 'Error' signs in sign column.
    hl.set("DiagnosticSignWarn", { fg = hl.get("DiagnosticWarn").fg, bg = hl.get("LineNr").bg }) -- Used for 'Warn' signs in sign column.
    hl.set("DiagnosticSignInfo", { fg = hl.get("DiagnosticInfo").fg, bg = hl.get("LineNr").bg }) -- Used for 'Info' signs in sign column.
    hl.set("DiagnosticSignHint", { fg = hl.get("DiagnosticHint").fg, bg = hl.get("LineNr").bg }) -- Used for 'Hint' signs in sign column.
    hl.set("DiagnosticSignOk", { fg = hl.get("DiagnosticOk").fg, bg = hl.get("LineNr").bg }) -- Used for 'Ok' signs in sign column.
end

return M
