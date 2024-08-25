local M = {}

function M.set(hl, colors)
    local shader = require("mellifluous.utils.shader")
    local config = require("mellifluous.config").config
    local groups = require("mellifluous.highlights.custom_groups").get(colors)

    -- Identifiers
    hl.set("@variable", { link = "Identifier" }) -- Variable names that don't fit into other categories.
    hl.set("@variable.builtin", { fg = colors.other_keywords }) -- Variable names defined by the language: `this` or `self` in Javascript.
    hl.set("@variable.parameter", { fg = colors.fg }) -- Parameters of a function.
    hl.set("@variable.parameter.reference", { link = "@variable.parameter" }) -- References to parameters of a function.
    hl.set("@variable.member", { fg = colors.fg }) -- Object and struct fields.
    hl.set("@constant", { link = "Constant" }) -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    hl.set("@constant.builtin", { link = "Constant" }) -- Built-in constant values: `nil` in Lua.
    hl.set("@constant.macro", { link = "Constant" }) -- Constants defined by macros: `NULL` in C.
    hl.set("@module", { link = "Type", style = {} }) -- Identifiers referring to modules and namespaces.
    hl.set("@label", { link = "Label" }) -- GOTO labels: `label:` in C, and `::label::` in Lua.
    hl.set("@label.markdown", { fg = colors.comments }) -- Code block language

    -- Literals
    hl.set("@string", { link = "String" }) -- String literals.
    hl.set("@string.documentation", { fg = colors.green }) -- String documenting code (e.g. Python docstrings)
    hl.set("@string.regexp", { link = "Character", style = config.styles.strings }) -- Regular expression literals.
    hl.set("@string.escape", { link = "Character", style = config.styles.strings }) -- Escape characters within a string: `\n`, `\t`, etc.
    hl.set("@string.special", { link = "Character", style = config.styles.strings }) -- Strings with special meaning that don't fit into the previous categories.
    hl.set("@string.special.symbol", { link = "Character" }) -- Identifiers referring to symbols or atoms.
    hl.set("@string.special.url", {
        fg = shader.get_lower_contrast(colors.blue, 15),
        style = { underline = true },
    }) -- URIs (e.g. hyperlinks)
    hl.set("@string.special.path", { link = "@string.special.url" }) -- Filenames
    hl.set("@character", { link = "Character" }) -- Character literals: `'a'` in C.
    hl.set("@character.special", { link = "Character" }) -- Special characters.
    hl.set("@boolean", { link = "Boolean" }) -- Boolean literals: `True` and `False` in Python.
    hl.set("@number", { link = "Number" }) -- Numeric literals that don't fit into other categories.
    hl.set("@number.float", { link = "Float" }) -- Floating-point number literals.

    -- Types
    hl.set("@type", { link = "Type" }) -- Type (and class) definitions and annotations.
    hl.set("@type.builtin", { link = "Type" }) -- Built-in types: `i32` in Rust.
    hl.set("@type.definition", { link = "Type" }) -- Identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
    hl.set("@type.qualifier", { link = "Type" }) -- Type qualifiers (e.g. `const`)
    hl.set("@attribute", { fg = colors.other_keywords }) -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    hl.set("@property", { link = "@variable.member" }) -- The key in key/value pairs

    -- Functions
    hl.set("@function", { link = "Function" }) -- Function definitions.
    hl.set("@function.builtin", { link = "Function" }) -- Built-in functions: `print` in Lua.
    hl.set("@function.call", { link = "Function" }) -- Function calls
    hl.set("@function.macro", { link = "Function" }) -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    hl.set("@function.method", { link = "Function" }) -- Method definitions.
    hl.set("@function.method.call", { link = "Function" }) -- Method calls.
    hl.set("@constructor", { link = "Function" }) -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    hl.set("@operator", { link = "Operator" }) -- Binary or unary operators: `+`, and also `->` and `*` in C.

    -- Keywords
    hl.set("@keyword", { link = "Keyword" }) -- Keywords that don't fit into other categories.
    hl.set("@keyword.coroutine", groups.MainKeyword) -- Keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    hl.set("@keyword.function", groups.MainKeyword) -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    hl.set("@keyword.operator", { fg = colors.other_keywords, style = config.styles.operators }) -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    hl.set("@keyword.import", { link = "Function" }) -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    hl.set("@keyword.storage", { link = "StorageClass" }) -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
    hl.set("@keyword.repeat", { link = "Repeat" }) -- Keywords related to loops: `for`, `while`, etc.
    hl.set("@keyword.return", groups.MainKeyword) -- Keywords like `return` and `yield`.
    hl.set("@keyword.debug", { link = "Keyword" }) -- Debugging statements.
    hl.set("@keyword.exception", { link = "Exception" }) -- Exception related keywords: `try`, `except`, `finally` in Python.
    hl.set("@keyword.conditional", { link = "Conditional" }) -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    hl.set("@keyword.conditional.ternary", { link = "Conditional" }) -- Ternary operator (e.g. `?` / `:`)
    hl.set("@keyword.directive", { link = "PreProc" }) -- Preprocessor #if, #else, #endif, etc.
    hl.set("@keyword.directive.define", { link = "PreProc" }) -- Preprocessor #define statements.

    -- Punctuation
    hl.set("@punctuation.delimiter", { link = "Operator", style = {} }) -- Punctuation delimiters: Periods, commas, semicolons, etc.
    hl.set("@punctuation.bracket", { link = "Operator", style = {} }) -- Brackets, braces, parentheses, etc.
    hl.set("@punctuation.special", { link = "Operator", style = {} }) -- Special punctuation that doesn't fit into the previous categories.

    -- Comments
    hl.set("@comment", { link = "Comment" }) -- Line comments and block comments.
    hl.set("@comment.documentation", { fg = hl.get("@string.documentation").fg, style = hl.get("Comment").style }) -- Line comments and block comments.
    hl.set("@comment.error", { bg = colors.bg:with_overlay(colors.ui_red, 20), fg = colors.ui_red }) -- Error-type comments (e.g., `DEPRECATED:`, `FIXME:`)
    hl.set("@comment.warning", { bg = colors.bg:with_overlay(colors.ui_orange, 20), fg = colors.ui_orange }) -- Warning-type comments (e.g., `WARNING:`)
    hl.set("@comment.note", { bg = colors.bg:with_overlay(colors.ui_purple, 20), fg = colors.ui_purple }) -- Note-type comments (e.g., `NOTE:`)
    hl.set("@comment.info", { bg = colors.bg:with_overlay(colors.ui_blue, 20), fg = colors.ui_blue }) -- Info-type comments
    hl.set("@comment.todo", { bg = colors.bg:with_overlay(colors.ui_green, 20), fg = colors.ui_green }) -- Todo-type comments (e.g. `TODO:`)

    -- Markup
    hl.set("@markup", { bg = "NONE" }) -- Non-structured text. Like text in a markup language.
    hl.set("@markup.strong", { style = { bold = true } }) -- Text to be represented in bold.
    hl.set("@markup.italic", { style = { italic = true } }) -- Text to be represented with emphasis.
    hl.set("@markup.strikethrough", { style = { strikethrough = true } }) -- Strikethrough text.
    hl.set("@markup.underline", { style = { underline = true } }) -- Text to be represented with an underline.
    hl.set("@markup.heading", { fg = colors.other_keywords }) -- Text that is part of a title.
    hl.set("@markup.quote", { fg = colors.other_keywords }) -- Quote blocks
    hl.set("@markup.math", { fg = colors.other_keywords }) -- Math environments like LaTeX's `$ ... $`
    hl.set("@markup.environment", { fg = colors.other_keywords }) -- Text environments of markup languages.
    hl.set("@markup.environment.name", { link = "@markup.environment" }) -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    hl.set("@markup.link", { fg = colors.constants, style = { underline = true } }) -- Footnotes, text references, citations, etc.
    hl.set("@markup.link.markdown_inline", { fg = hl.get("@markup.link").fg }) -- Everything in a markdown link that's not a label or url (`[]()`)
    hl.set("@markup.link.label", { link = "@markup.link" }) -- Link, reference descriptions
    hl.set("@markup.link.url", { link = "@string.special.url" }) -- URIs like hyperlinks or email addresses.
    hl.set("@markup.raw", { fg = colors.fg2 }) -- Literal or verbatim text (e.g., inline code)
    hl.set("@markup.raw.block", { link = "@markup.raw" }) -- Literal or verbatim text as a stand-alone block
    hl.set("@markup.list", { link = "Operator" }) -- List markers
    hl.set("@markup.list.unchecked", { link = "Todo" }) -- Unchecked todo-style list markers
    hl.set("@markup.list.checked", { fg = hl.get("@markup.list.unchecked").fg, bg = "NONE" }) -- Checked todo-style list markers
    hl.set("@diff.plus", { link = "DiffAdd" }) -- added text (for diff files)
    hl.set("@diff.minus", { link = "DiffDelete" }) -- deleted text (for diff files)
    hl.set("@diff.delta", { link = "DiffChange" }) -- changed text (for diff files)
    hl.set("@tag", { link = "Keyword" }) -- Tags like HTML tag names.
    hl.set("@tag.attribute", { link = "Function", style = {} }) -- HTML tag attributes.
    hl.set("@tag.delimiter", { link = "Operator", style = {} }) -- Tag delimiters like `<` `>` `/`.
    hl.set("@markup.heading.1.marker", { fg = colors.ui_red, style = {} })
    hl.set("@markup.heading.2.marker", { fg = colors.ui_orange, style = {} })
    hl.set("@markup.heading.3.marker", { fg = colors.ui_yellow, style = {} })
    hl.set("@markup.heading.4.marker", { fg = colors.ui_green, style = {} })
    hl.set("@markup.heading.5.marker", { fg = colors.ui_blue, style = {} })
    hl.set("@markup.heading.6.marker", { fg = colors.ui_purple, style = {} })
    hl.set("@markup.heading.1", {
        fg = shader.get_higher_contrast(colors.ui_red, 10),
        bg = colors.bg:with_overlay(colors.ui_red, 16),
        style = config.styles.markup.headings,
    })
    hl.set("@markup.heading.2", {
        fg = shader.get_higher_contrast(colors.ui_orange, 10),
        bg = colors.bg:with_overlay(colors.ui_orange, 16),
        style = config.styles.markup.headings,
    })
    hl.set("@markup.heading.3", {
        fg = shader.get_higher_contrast(colors.ui_yellow, 10),
        bg = colors.bg:with_overlay(colors.ui_yellow, 16),
        style = config.styles.markup.headings,
    })
    hl.set("@markup.heading.4", {
        fg = shader.get_higher_contrast(colors.ui_green, 10),
        bg = colors.bg:with_overlay(colors.ui_green, 16),
        style = config.styles.markup.headings,
    })
    hl.set("@markup.heading.5", {
        fg = shader.get_higher_contrast(colors.ui_blue, 10),
        bg = colors.bg:with_overlay(colors.ui_blue, 16),
        style = config.styles.markup.headings,
    })
    hl.set("@markup.heading.6", {
        fg = shader.get_higher_contrast(colors.ui_purple, 10),
        bg = colors.bg:with_overlay(colors.ui_purple, 16),
        style = config.styles.markup.headings,
    })
    hl.set("@markup.heading", { link = "@markup.heading.1" })
    hl.set("@markup.heading.gitcommit", { fg = hl.get("@markup.heading").fg })
    hl.set("@markup.heading.1.vimdoc", { fg = hl.get("@markup.heading").fg })
    hl.set("@markup.heading.2.vimdoc", { fg = hl.get("@markup.heading").fg })
    hl.set("@markup.heading.3.vimdoc", { fg = hl.get("@markup.heading").fg })
    hl.set("@markup.heading.4.vimdoc", { fg = hl.get("@markup.heading").fg })
    hl.set("@markup.heading.5.vimdoc", { fg = hl.get("@markup.heading").fg })
    hl.set("@markup.heading.6.vimdoc", { fg = hl.get("@markup.heading").fg })

    -- For compatitibilty with older neovim versions (TODO: remove after a few months)
    hl.set("@parameter", { link = "@variable.parameter" })
    hl.set("@field", { link = "@variable.member" })
    hl.set("@namespace", { link = "@module" })
    hl.set("@float", { link = "number.float" })
    hl.set("@symbol", { link = "@string.special.symbol" })
    hl.set("@string.regex", { link = "@string.regexp" })

    hl.set("@text", { link = "@markup" })
    hl.set("@text.strong", { link = "@markup.strong" })
    hl.set("@text.emphasis", { link = "@markup.italic" })
    hl.set("@text.underline", { link = "@markup.underline" })
    hl.set("@text.strike", { link = "@markup.strikethrough" })
    hl.set("@text.uri", { link = "@string.special.url" })
    hl.set("@text.math", { link = "@markup.math" })
    hl.set("@text.reference", { link = "@markup.link" })
    hl.set("@text.environment", { link = "@markup.environment" })
    hl.set("@text.environment.name", { link = "@markup.environment.name" })
    hl.set("@text.title", { link = "@markup.heading" })
    hl.set("@text.literal", { link = "@markup.raw" })

    hl.set("@text.danger", { link = "comment.error" })
    hl.set("@text.warning", { link = "comment.warning" })
    hl.set("@text.note", { link = "comment.note" })
    hl.set("@text.todo", { link = "comment.todo" })

    hl.set("@method", { link = "@function.method" })
    hl.set("@define", { link = "@keyword.directive.define" })
    hl.set("@preproc", { link = "@keyword.directive" })
    hl.set("@storage.class", { link = "@keyword.storage" })
    hl.set("@conditional", { link = "@keyword.conditional" })
    hl.set("@exception", { link = "@keyword.exception" })
    hl.set("@include", { link = "@keyword.import" })
    hl.set("@repeat", { link = "@keyword.repeat" })
    hl.set("@debug", { link = "@keyword.debug" })

    -- :TSModuleInfo
    hl.set("TSModuleInfoGood", { fg = colors.ui_green, bold = true })
    hl.set("TSModuleInfoBad", { fg = colors.ui_red, bold = true })
end

return M
