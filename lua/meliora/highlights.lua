return function(colors)
    ---@diagnostic disable: undefined-global
    local lush = require 'lush'
    local hsl = lush.hsl
    local config = require 'meliora'.config

    return lush(function()
        return {
            Normal       { bg = colors.bg, fg = colors.fg }, -- Normal text
            NormalNC     { bg = (config.dim_inactive and colors.dark_bg) or Normal.bg }, -- normal text in non-current windows
            ColorColumn  { bg = colors.dark_bg }, -- Columns set with 'colorcolumn'
            Conceal      { fg = colors.fg5 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
            Cursor       { bg = colors.orange, fg = colors.bg }, -- Character under the cursor
            lCursor      { Cursor }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
            CursorIM     { Cursor }, -- Like Cursor, but used when in IME mode |CursorIM|
            CursorColumn { bg = colors.bg2 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
            CursorLine   { bg = colors.bg2 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
            Directory    { fg = colors.blue }, -- Directory names (and other special names in listings)
            DiffAdd      { bg = colors.green.mix(colors.bg, 70), fg = colors.green }, -- Diff mode: Added line |diff.txt|
            DiffChange   { bg = colors.orange.mix(colors.bg, 70), fg = colors.orange }, -- Diff mode: Changed line |diff.txt|
            DiffDelete   { bg = colors.red.mix(colors.bg, 70), fg = colors.red }, -- Diff mode: Deleted line |diff.txt|
            DiffText     { Normal }, -- Diff mode: Changed text within a changed line |diff.txt|
            EndOfBuffer  { fg = colors.bg }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
            TermCursor   { Cursor }, -- Cursor in a focused terminal
            TermCursorNC { bg = colors.fg5 }, -- Cursor in an unfocused terminal
            ErrorMsg     { fg = colors.basic_red }, -- Error messages on the command line
            VertSplit    { fg = colors.fg5, bg = (config.dim_inactive and NormalNC.bg) or Normal.bg }, -- Column separating vertically split windows
            Folded       { bg = colors.bg3, fg = colors.fg3, gui = config.styles.folds }, -- Line used for closed folds
            FoldColumn   { Normal }, -- 'foldcolumn'
            LineNr       { fg = colors.fg4, bg = colors.dark_bg }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
            SignColumn   { LineNr }, -- Column where |signs| are displayed
            IncSearch    { bg = colors.orange, fg = colors.bg }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
            Substitute   { IncSearch }, -- |:substitute| replacement text highlighting
            CursorLineNr { bg = CursorLine.bg, fg = LineNr.fg }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
            MatchParen   { bg = colors.comment, fg = colors.fg }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
            ModeMsg      { fg = colors.fg3 }, -- 'showmode' message (e.g., "-- INSERT -- ")
            MsgArea      { Normal }, -- Area for messages and cmdline
            MsgSeparator { VertSplit }, -- Separator for scrolled messages, `msgsep` flag of 'display'
            MoreMsg      { fg = colors.orange }, -- |more-prompt|
            NonText      { Conceal }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
            NormalFloat  { bg = colors.bg4 }, -- Normal text in floating windows.
            Pmenu        { bg = colors.bg4, fg = config.dark and colors.fg3 or colors.fg4 }, -- Popup menu: Normal item.
            PmenuSel     { bg = config.dark and colors.fg5 or colors.dark_bg }, -- Popup menu: Selected item.
            PmenuSbar    { bg = colors.bg3 }, -- Popup menu: Scrollbar.
            PmenuThumb   { bg = colors.fg5 }, -- Popup menu: Thumb of the scrollbar.
            Question     { fg = colors.orange }, -- |hit-enter| prompt and yes/no questions
            QuickFixLine { Normal }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
            Search       { bg = colors.bg4, fg = colors.fg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
            SpecialKey   { fg = colors.orange }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
            SpellBad     { fg = colors.basic_red }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
            SpellCap     { fg = colors.basic_orange }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
            SpellLocal   { fg = colors.basic_orange }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
            SpellRare    { fg = colors.basic_orange }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
            StatusLine   { bg = colors.bg4, fg = colors.fg2 }, -- Status line of current window
            StatusLineNC { bg = colors.bg3, fg = colors.fg3 }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            TabLine      { bg = StatusLine.bg, fg = colors.fg3 }, -- Tab pages line, not active tab page label
            TabLineFill  { TabLine }, -- Tab pages line, where there are no labels
            TabLineSel   { bg = colors.bg2, fg = colors.fg2 }, -- Tab pages line, active tab page label
            Title        { fg = colors.orange }, -- Titles for output from ":set all", ":autocmd" etc.
            Visual       { bg = config.dark and colors.bg4 or colors.dark_bg2 }, -- Visual mode selection
            VisualNOS    { bg = colors.bg3 }, -- Visual mode selection when vim is "Not Owning the Selection".
            WarningMsg   { fg = colors.basic_red }, -- Warning messages
            Whitespace   { fg = colors.fg5 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
            WinSeparator { VertSplit }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
            WildMenu     { PmenuSel }, -- Current match in 'wildmenu' completion

            -- Common vim syntax groups used for all kinds of code and markup.
            -- Commented-out groups should chain up to their preferred (*) group
            -- by default.
            --
            -- See :h group-name
            --
            -- Uncomment and edit if you want more specific syntax highlighting.

            Comment        { fg = colors.comment, gui = config.styles.comments }, -- Any comment

            Constant       { fg = colors.purple }, -- (*) Any constant
            String         { fg = colors.yellow, gui = config.styles.strings }, --   A string constant: "this is a string"
            Character      { fg = String.fg }, --   A character constant: 'c', '\n'
            Number         { Constant, gui = config.styles.numbers }, --   A number constant: 234, 0xff
            Boolean        { Constant, gui = config.styles.booleans }, --   A boolean constant: TRUE, false
            Float          { Constant, gui = config.styles.numbers }, --   A floating point constant: 2.3e10

            Identifier     { fg = colors.fg, gui = config.styles.variables }, -- (*) Any variable name
            Function       { fg = colors.blue, gui = config.styles.functions }, --   Function name (also: methods for classes)

            Statement      { fg = colors.orange }, -- (*) Any statement
            Conditional    { fg = colors.red, gui = config.styles.conditionals }, --   if, then, else, endif, switch, etc.
            Repeat         { fg = colors.red, gui = config.styles.loops }, --   for, do, while, etc.
            Label          { fg = colors.red, gui = config.styles.keywords }, --   case, default, etc.
            Operator       { fg = config.dark and colors.khaki or colors.fg3, gui = config.styles.operators }, --   "sizeof", "+", "*", etc.
            Keyword        { fg = colors.orange }, --   any other keyword
            Exception      { fg = colors.orange }, --   try, catch, throw

            PreProc        { fg = colors.blue }, -- (*) Generic Preprocessor
            Include        { PreProc }, --   Preprocessor #include
            Define         { PreProc }, --   Preprocessor #define
            Macro          { PreProc }, --   Same as Define
            PreCondit      { PreProc }, --   Preprocessor #if, #else, #endif, etc.

            Type           { fg = colors.khaki, gui = config.styles.types }, -- (*) int, long, char, etc.
            StorageClass   { Type }, --   static, register, volatile, etc.
            Structure      { Type }, --   struct, union, enum, etc.
            Typedef        { Type }, --   A typedef

            Special        { fg = colors.orange }, -- (*) Any special symbol
            SpecialChar    { Special }, --   Special character in a constant
            Tag            { Special }, --   You can use CTRL-] on this
            Delimiter      { Special }, --   Character that needs attention
            SpecialComment { Special }, --   Special things inside a comment (e.g. '\n')
            Debug          { Special }, --   Debugging statements

            Underlined     { gui = "underline", fg = colors.fg3 }, -- Text that stands out, HTML links
            Bold { bold = config.bold },
            Italic { italic = config.italic },
            Ignore         { fg = colors.fg5 }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
            Error          { fg = colors.basic_red }, -- Any erroneous construct
            Todo           { fg = colors.red }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

            -- These groups are for the native LSP client and diagnostic system. Some
            -- other LSP clients may use these groups, or use their own. Consult your
            -- LSP client's documentation.

            -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
            --
            LspReferenceText            { bg = colors.bg3 } , -- Used for highlighting "text" references
            LspReferenceRead            { LspReferenceText } , -- Used for highlighting "read" references
            LspReferenceWrite           { LspReferenceText } , -- Used for highlighting "write" references
            LspCodeLens                 { bg = colors.bg2 } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
            LspCodeLensSeparator        { fg = colors.fg5 } , -- Used to color the seperator between two or more code lens.
            LspSignatureActiveParameter { bg = colors.bg4 } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

            -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
            --
            DiagnosticError            { fg = colors.basic_red } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
            DiagnosticWarn             { fg = colors.basic_orange } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
            DiagnosticInfo             { fg = colors.basic_blue } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
            DiagnosticHint             { fg = colors.basic_purple } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
            DiagnosticVirtualTextError { fg = DiagnosticError.fg, bg = colors.bg3 } , -- Used for "Error" diagnostic virtual text.
            DiagnosticVirtualTextWarn  { fg = DiagnosticWarn.fg, bg = colors.bg3 } ,  -- Used for "Warn" diagnostic virtual text.
            DiagnosticVirtualTextInfo  { fg = DiagnosticInfo.fg, bg = colors.bg3 } ,  -- Used for "Info" diagnostic virtual text.
            DiagnosticVirtualTextHint  { fg = DiagnosticHint.fg, bg = colors.bg3 } ,  -- Used for "Hint" diagnostic virtual text.
            DiagnosticUnderlineError   { gui = "underline" } , -- Used to underline "Error" diagnostics.
            DiagnosticUnderlineWarn    { gui = "underline" } , -- Used to underline "Warn" diagnostics.
            DiagnosticUnderlineInfo    { gui = "underline" } , -- Used to underline "Info" diagnostics.
            DiagnosticUnderlineHint    { gui = "underline" } , -- Used to underline "Hint" diagnostics.
            -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
            -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
            -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
            -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
            DiagnosticSignError        { fg = DiagnosticError.fg, bg = LineNr.bg } , -- Used for "Error" signs in sign column.
            DiagnosticSignWarn         { fg = DiagnosticWarn.fg, bg = LineNr.bg } , -- Used for "Warn" signs in sign column.
            DiagnosticSignInfo         { fg = DiagnosticInfo.fg, bg = LineNr.bg } , -- Used for "Info" signs in sign column.
            DiagnosticSignHint         { fg = DiagnosticHint.fg, bg = LineNr.bg } , -- Used for "Hint" signs in sign column.

            -- Tree-Sitter syntax groups. Most link to corresponding
            -- vim syntax groups (e.g. TSKeyword => Keyword) by default.
            --
            -- See :h nvim-treesitter-highlights, some groups may not be listed, submit a PR fix to lush-template!

            TSAttribute          { fg = colors.orange } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
            TSBoolean            { Boolean } , -- Boolean literals: `True` and `False` in Python.
            TSCharacter          { Character } , -- Character literals: `'a'` in C.
            TSCharacterSpecial   { Character } , -- Special characters.
            TSComment            { Comment } , -- Line comments and block comments.
            TSConditional        { Conditional } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
            TSConstant           { Constant } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
            TSConstBuiltin       { Constant } , -- Built-in constant values: `nil` in Lua.
            TSConstMacro         { Constant } , -- Constants defined by macros: `NULL` in C.
            TSConstructor        { Function } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
            TSDebug              { fg = colors.orange } , -- Debugging statements.
            TSDefine             { PreProc } , -- Preprocessor #define statements.
            TSError              { Error } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
            TSException          { Exception, gui = config.styles.keywords } , -- Exception related keywords: `try`, `except`, `finally` in Python.
            TSField              { fg = colors.fg, gui = config.styles.properties } , -- Object and struct fields.
            TSFloat              { Float } , -- Floating-point number literals.
            TSFunction           { Function } , -- Function calls and definitions.
            TSFuncBuiltin        { Function } , -- Built-in functions: `print` in Lua.
            TSFuncMacro          { Function } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
            TSInclude            { Function, gui = 'NONE'} , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
            TSKeyword            { Keyword } , -- Keywords that don't fit into other categories.
            TSKeywordFunction    { fg = colors.red, gui = config.styles.keywords } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
            TSKeywordOperator    { fg = colors.orange, gui = config.styles.operators } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
            TSKeywordReturn      { fg = colors.red, gui = config.styles.keywords } , -- Keywords like `return` and `yield`.
            TSLabel              { Label } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
            TSMethod             { Function } , -- Method calls and definitions.
            TSNamespace          { Type, gui = 'NONE'} , -- Identifiers referring to modules and namespaces.
            -- TSNone               { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
            TSNumber             { Number } , -- Numeric literals that don't fit into other categories.
            TSOperator           { Operator } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
            TSParameter          { fg = colors.fg } , -- Parameters of a function.
            TSParameterReference { TSParameter } , -- References to parameters of a function.
            TSPreProc            { PreProc } , -- Preprocessor #if, #else, #endif, etc.
            TSProperty           { TSField } , -- Same as `TSField`.
            TSPunctDelimiter     { Operator, gui = 'NONE' } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
            TSPunctBracket       { Operator, gui =  'NONE' } , -- Brackets, braces, parentheses, etc.
            TSPunctSpecial       { Operator, gui =  'NONE' } , -- Special punctuation that doesn't fit into the previous categories.
            TSRepeat             { Repeat } , -- Keywords related to loops: `for`, `while`, etc.
            TSStorageClass       { StorageClass } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
            TSString             { String } , -- String literals.
            TSStringRegex        { Character, gui = config.styles.strings } , -- Regular expression literals.
            TSStringEscape       { Character, gui = config.styles.strings } , -- Escape characters within a string: `\n`, `\t`, etc.
            TSStringSpecial      { Character, gui = config.styles.strings } , -- Strings with special meaning that don't fit into the previous categories.
            TSSymbol             { Character } , -- Identifiers referring to symbols or atoms.
            TSTag                { Keyword } , -- Tags like HTML tag names.
            TSTagAttribute       { Function, gui = 'NONE' } , -- HTML tag attributes.
            TSTagDelimiter       { Operator, gui = 'NONE' } , -- Tag delimiters like `<` `>` `/`.
            TSText               { Normal } , -- Non-structured text. Like text in a markup language.
            TSStrong             { gui = "bold" } , -- Text to be represented in bold.
            TSEmphasis           { gui = "italic" } , -- Text to be represented with emphasis.
            TSUnderline          { gui = "underline" } , -- Text to be represented with an underline.
            TSStrike             { gui = "strikethrough" } , -- Strikethrough text.
            TSTitle              { fg = colors.orange } , -- Text that is part of a title.
            TSLiteral            { fg = Character.fg } , -- Literal or verbatim text.
            TSURI                { fg = colors.fg3 } , -- URIs like hyperlinks or email addresses.
            TSMath               { fg = colors.orange } , -- Math environments like LaTeX's `$ ... $`
            TSTextReference      { fg = colors.purple } , -- Footnotes, text references, citations, etc.
            TSEnvironment        { fg = colors.orange } , -- Text environments of markup languages.
            TSEnvironmentName    { TSEnvironment } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
            TSNote               { fg = colors.green } , -- Text representation of an informational note.
            TSWarning            { fg = colors.orange } , -- Text representation of a warning note.
            TSDanger             { fg = colors.red } , -- Text representation of a danger note.
            TSType               { Type } , -- Type (and class) definitions and annotations.
            TSTypeBuiltin        { Type } , -- Built-in types: `i32` in Rust.
            TSVariable           { Identifier } , -- Variable names that don't fit into other categories.
            TSVariableBuiltin    { fg = colors.orange } , -- Variable names defined by the language: `this` or `self` in Javascript.
        }
    end)
end

