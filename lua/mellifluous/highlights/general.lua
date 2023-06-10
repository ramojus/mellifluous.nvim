local M = {}

function M.set(hl, colors)
    local config = require('mellifluous').config
    local shader = require('mellifluous.utils.shader')
    local shade_recipes = require('mellifluous.colors.shades').get_recipes(config.is_bg_dark)

    hl.set('Normal', {
        bg = (config.transparent_background.enabled and 'NONE')
            or colors.bg.hex,
        fg = colors.fg.hex
    }) -- Normal text
    hl.set('NormalNC', {
        bg = (config.dim_inactive and colors.dark_bg.hex)
            or (config.transparent_background and 'NONE')
            or hl.get('Normal').bg
    })                                                                       -- normal text in non-current windows
    hl.set('ColorColumn', { bg = colors.dark_bg.hex })                       -- Columns set with 'colorcolumn'
    hl.set('Conceal', { fg = colors.fg5.hex })                               -- Placeholder characters substituted for concealed text (see 'conceallevel')
    hl.set('Cursor', { bg = colors.other_keywords.hex, fg = colors.bg.hex }) -- Character under the cursor
    hl.set('lCursor', { link = 'Cursor' })                                   -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    hl.set('CursorIM', { link = 'Cursor' })                                  -- Like Cursor, but used when in IME mode |CursorIM|
    hl.set('CursorColumn', { bg = colors.bg2.hex })                          -- Screen-column at the cursor, when 'cursorcolumn' is set.
    hl.set('CursorLine', {
        bg = (config.transparent_background.cursor_line and 'NONE')
            or colors.bg2.hex
    })                                                                                              -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    hl.set('Directory', { fg = colors.functions.hex })                                              -- Directory names (and other special names in listings)
    hl.set('DiffAdd', { bg = shader.get_lower_contrast(colors.green, 45):desaturated(30).hex })     -- Diff mode: Added line |diff.txt|
    hl.set('DiffDelete', { bg = shader.get_lower_contrast(colors.red, 45):desaturated(35).hex })    -- Diff mode: Deleted line |diff.txt|
    hl.set('DiffChange', { bg = shader.get_lower_contrast(colors.orange, 50):desaturated(70).hex }) -- Diff mode: Changed line |diff.txt|
    hl.set('DiffText', { bg = shader.get_lower_contrast(colors.orange, 40):desaturated(40).hex })   -- Diff mode: Changed text within a changed line |diff.txt|
    hl.set('EndOfBuffer', { fg = colors.bg.hex })                                                   -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    hl.set('TermCursor', { link = 'Cursor' })                                                       -- Cursor in a focused terminal
    hl.set('TermCursorNC', { bg = colors.fg5.hex })                                                 -- Cursor in an unfocused terminal
    hl.set('ErrorMsg', { fg = colors.red.hex })                                                     -- Error messages on the command line
    hl.set('VertSplit', {
        fg = colors.fg5.hex,
        bg = (config.dim_inactive and hl.get('NormalNC').bg)
            or (config.transparent_background.enabled and 'NONE')
            or hl.get('Normal').bg
    })                                                                                                -- Column separating vertically split windows
    hl.set('Folded', { bg = colors.bg3.hex, fg = colors.fg3.hex, style = config.styles.folds or {} }) -- Line used for closed folds
    hl.set('FoldColumn', { link = 'Normal' })                                                         -- 'foldcolumn'
    hl.set('LineNr', {
        fg = colors.fg4.hex,
        bg = (config.transparent_background.enabled and 'NONE')
            or (config.flat_background.line_numbers and hl.get('Normal').bg)
            or colors.dark_bg.hex
    })                                                                          -- Line number for ':number' and ':#' commands, and when 'number' or 'relativenumber' option is set.
    hl.set('SignColumn', { link = 'LineNr' })                                   -- Column where |signs| are displayed
    hl.set('IncSearch', { bg = colors.other_keywords.hex, fg = colors.bg.hex }) -- 'incsearch' highlighting; also used for the text replaced with ':s///c'
    hl.set('Substitute', { link = 'IncSearch' })                                -- |:substitute| replacement text highlighting
    hl.set('CursorLineNr', {
        bg = (config.flat_background.cursor_line_number and hl.get('LineNr').bg)
            or (config.transparent_background.enabled and 'NONE')
            or shader.get_shade(shade_recipes.dark_bg, hl.get('CursorLine').bg).hex,
        fg = hl.get('LineNr').fg
    })                                                                           -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    hl.set('MatchParen', { bg = colors.bg4.hex, fg = colors.main_keywords.hex }) -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    hl.set('ModeMsg', { fg = colors.fg3.hex })                                   -- 'showmode' message (e.g., '-- INSERT -- ')
    hl.set('MsgArea', { link = 'Normal' })                                       -- Area for messages and cmdline
    hl.set('MsgSeparator', { link = 'VertSplit' })                               -- Separator for scrolled messages, `msgsep` flag of 'display'
    hl.set('MoreMsg', { fg = colors.other_keywords.hex })                        -- |more-prompt|
    hl.set('NonText', { link = 'Conceal' })                                      -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., '>' displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    hl.set('Title', { fg = colors.other_keywords.hex })                          -- Titles for output from ':set all', ':autocmd' etc.
    hl.set('NormalFloat', {
        bg = (config.transparent_background.floating_windows and 'NONE')
            or (config.flat_background.floating_windows and hl.get('Normal').bg)
            or colors.bg3.hex
    }) -- Normal text in floating windows.
    hl.set('FloatBorder', {
        bg = hl.get('NormalFloat').bg,
        fg = ((config.transparent_background.floating_windows
            or config.flat_background.floating_windows)
            and colors.fg4.hex)
            or hl.get('NormalFloat').bg
    })
    hl.set('FloatTitle', { bg = hl.get('NormalFloat').bg, fg = colors.comments.hex })
    hl.set('FloatShadow', { bg = colors.dark_bg.hex })
    hl.set('Pmenu', { bg = colors.bg4.hex, fg = config.is_bg_dark and colors.fg3.hex or colors.fg4.hex }) -- Popup menu: Normal item.
    hl.set('PmenuSel', { bg = config.is_bg_dark and colors.fg5.hex or colors.dark_bg.hex })               -- Popup menu: Selected item.
    hl.set('PmenuSbar', { bg = colors.bg3.hex })                                                          -- Popup menu: Scrollbar.
    hl.set('PmenuThumb', { bg = colors.fg5.hex })                                                         -- Popup menu: Thumb of the scrollbar.
    hl.set('Question', { fg = colors.other_keywords.hex })                                                -- |hit-enter| prompt and yes/no questions
    hl.set('QuickFixLine', { link = 'Normal' })                                                           -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    hl.set('Search', { bg = colors.bg4.hex, fg = colors.fg.hex })                                         -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    hl.set('SpecialKey', { fg = colors.other_keywords.hex })                                              -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    hl.set('SpellBad', { fg = colors.red.hex })                                                           -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    hl.set('SpellCap', { fg = colors.orange.hex })                                                        -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    hl.set('SpellLocal', { fg = colors.orange.hex })                                                      -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    hl.set('SpellRare', { fg = colors.orange.hex })                                                       -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    hl.set('StatusLine', {
        bg = (config.transparent_background.status_line and 'NONE')
            or colors.bg4.hex,
        fg = colors.fg2.hex
    }) -- Status line of current window
    hl.set('StatusLineNC', {
        bg = (config.transparent_background.status_line and 'NONE')
            or colors.bg2.hex,
        fg = colors.fg4.hex
    })                                                                                     -- Status lines of not-current windows. Note: If this is equal to 'StatusLine' Vim will use '^^^' in the status line of the current window.
    hl.set('TabLine', { bg = hl.get('StatusLine').bg, fg = colors.fg3.hex })               -- Tab pages line, not active tab page label
    hl.set('TabLineFill', { link = 'TabLine' })                                            -- Tab pages line, where there are no labels
    hl.set('TabLineSel', { bg = colors.bg2.hex, fg = colors.fg2.hex })                     -- Tab pages line, active tab page label
    hl.set('Visual', { bg = config.is_bg_dark and colors.bg4.hex or colors.dark_bg2.hex }) -- Visual mode selection
    hl.set('VisualNOS', { bg = colors.bg3.hex })                                           -- Visual mode selection when vim is 'Not Owning the Selection'.
    hl.set('WarningMsg', { fg = colors.red.hex })                                          -- Warning messages
    hl.set('Whitespace', { fg = colors.fg5.hex })                                          -- 'nbsp', 'space', 'tab' and 'trail' in 'listchars'
    hl.set('WinSeparator', { link = 'VertSplit' })                                         -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    hl.set('WildMenu', { link = 'PmenuSel' })                                              -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.
    hl.set('Comment', { fg = colors.comments.hex, style = config.styles.comments or {} })              -- Any comment
    hl.set('Constant', { fg = colors.constants.hex })                                                  -- (*) Any constant
    hl.set('String', { fg = colors.strings.hex, style = config.styles.strings or {} })                 --   A string constant: 'this is a string'
    hl.set('Character', { fg = hl.get('String').fg })                                                  --   A character constant: 'c', '\n'
    hl.set('Number', { link = 'Constant', style = config.styles.numbers or {} })                       --   A number constant: 234, 0xff
    hl.set('Boolean', { link = 'Constant', style = config.styles.booleans or {} })                     --   A boolean constant: TRUE, false
    hl.set('Float', { link = 'Constant', style = config.styles.numbers or {} })                        --   A floating point constant: 2.3e10
    hl.set('Identifier', { fg = colors.fg.hex, style = config.styles.variables or {} })                -- (*) Any variable name
    hl.set('Function', { fg = colors.functions.hex, style = config.styles.functions or {} })           --   Function name (also: methods for classes)
    hl.set('Statement', { fg = colors.other_keywords.hex })                                            -- (*) Any statement
    hl.set('Conditional', { fg = colors.main_keywords.hex, style = config.styles.conditionals or {} }) --   if, then, else, endif, switch, etc.
    hl.set('Repeat', { fg = colors.main_keywords.hex, style = config.styles.loops or {} })             --   for, do, while, etc.
    hl.set('Label', { fg = colors.main_keywords.hex, style = config.styles.keywords or {} })           --   case, default, etc.
    hl.set('Operator', {
        fg = config.is_bg_dark and colors.operators.hex or colors.fg3.hex,
        style = config.styles.operators or {}
    })                                                                           --   'sizeof', '+', '*', etc.
    hl.set('Keyword', { fg = colors.other_keywords.hex })                        --   any other keyword
    hl.set('Exception', { fg = colors.other_keywords.hex })                      --   try, catch, throw
    hl.set('PreProc', { fg = colors.functions.hex })                             -- (*) Generic Preprocessor
    hl.set('Include', { link = 'PreProc' })                                      --   Preprocessor #include
    hl.set('Define', { link = 'PreProc' })                                       --   Preprocessor #define
    hl.set('Macro', { link = 'PreProc' })                                        --   Same as Define
    hl.set('PreCondit', { link = 'PreProc' })                                    --   Preprocessor #if, #else, #endif, etc.
    hl.set('Type', { fg = colors.types.hex, style = config.styles.types or {} }) -- (*) int, long, char, etc.
    hl.set('StorageClass', { link = 'Type' })                                    --   static, register, volatile, etc.
    hl.set('Structure', { link = 'Type' })                                       --   struct, union, enum, etc.
    hl.set('Typedef', { link = 'Type' })                                         --   A typedef
    hl.set('Special', { fg = colors.other_keywords.hex })                        -- (*) Any special symbol
    hl.set('SpecialChar', { link = 'Special' })                                  --   Special character in a constant
    hl.set('Tag', { link = 'Special' })                                          --   You can use CTRL-] on this
    hl.set('Delimiter', { link = 'Operator' })                                   --   Character that needs attention
    hl.set('SpecialComment', { link = 'Special' })                               --   Special things inside a comment (e.g. '\n')
    hl.set('Debug', { link = 'Special' })                                        --   Debugging statements
    hl.set('Underlined', { underline = true, fg = colors.fg3.hex })              -- Text that stands out, HTML links
    hl.set('Bold', { bold = config.bold })
    hl.set('Italic', { italic = config.italic })
    hl.set('Ignore', { fg = colors.fg5.hex })                       -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    hl.set('Error', { fg = colors.red.hex })                        -- Any erroneous construct
    hl.set('Todo', { bg = colors.strings.hex, fg = colors.bg.hex }) -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.
    hl.set('LspReferenceText', { bg = colors.bg3.hex })            -- Used for highlighting 'text' references
    hl.set('LspReferenceRead', { link = 'LspReferenceText' })      -- Used for highlighting 'read' references
    hl.set('LspReferenceWrite', { link = 'LspReferenceText' })     -- Used for highlighting 'write' references
    hl.set('LspCodeLens', { bg = colors.bg2.hex })                 -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    hl.set('LspCodeLensSeparator', { fg = colors.fg5.hex })        -- Used to color the seperator between two or more code lens.
    hl.set('LspSignatureActiveParameter', { bg = colors.bg4.hex }) -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
    ---
    hl.set('DiagnosticError', { fg = colors.red.hex })             -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    hl.set('DiagnosticWarn', { fg = colors.orange.hex })           -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    hl.set('DiagnosticInfo', { fg = colors.blue.hex })             -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    hl.set('DiagnosticHint', { fg = colors.purple.hex })           -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    hl.set('DiagnosticVirtualTextError', {
        fg = hl.get('DiagnosticError').fg,
        bg = (config.transparent_background.enabled and 'NONE') or colors.bg3.hex
    }) -- Used for 'Error' diagnostic virtual text.
    hl.set('DiagnosticVirtualTextWarn', {
        fg = hl.get('DiagnosticWarn').fg,
        bg = (config.transparent_background.enabled and 'NONE') or colors.bg3.hex
    }) -- Used for 'Warn' diagnostic virtual text.
    hl.set('DiagnosticVirtualTextInfo', {
        fg = hl.get('DiagnosticInfo').fg,
        bg = (config.transparent_background.enabled and 'NONE') or colors.bg3.hex
    }) -- Used for 'Info' diagnostic virtual text.
    hl.set('DiagnosticVirtualTextHint', {
        fg = hl.get('DiagnosticHint').fg,
        bg = (config.transparent_background.enabled and 'NONE') or colors.bg3.hex
    })                                                       -- Used for 'Hint' diagnostic virtual text.
    hl.set('DiagnosticUnderlineError', { underline = true }) -- Used to underline 'Error' diagnostics.
    hl.set('DiagnosticUnderlineWarn', { underline = true })  -- Used to underline 'Warn' diagnostics.
    hl.set('DiagnosticUnderlineInfo', { underline = true })  -- Used to underline 'Info' diagnostics.
    hl.set('DiagnosticUnderlineHint', { underline = true })  -- Used to underline 'Hint' diagnostics.
    -- DiagnosticFloatingError    = { } , -- Used to color 'Error' diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     = { } , -- Used to color 'Warn' diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     = { } , -- Used to color 'Info' diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     = { } , -- Used to color 'Hint' diagnostic messages in diagnostics float.
    hl.set('DiagnosticSignError', { fg = hl.get('DiagnosticError').fg, bg = hl.get('LineNr').bg }) -- Used for 'Error' signs in sign column.
    hl.set('DiagnosticSignWarn', { fg = hl.get('DiagnosticWarn').fg, bg = hl.get('LineNr').bg })   -- Used for 'Warn' signs in sign column.
    hl.set('DiagnosticSignInfo', { fg = hl.get('DiagnosticInfo').fg, bg = hl.get('LineNr').bg })   -- Used for 'Info' signs in sign column.
    hl.set('DiagnosticSignHint', { fg = hl.get('DiagnosticHint').fg, bg = hl.get('LineNr').bg })   -- Used for 'Hint' signs in sign column.
end

return M
