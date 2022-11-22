return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require 'lush'
    local config = require 'meliora'.config

    return lush(function(injected_functions)
        local sym = injected_functions.sym
        return {
            sym("@attribute")           { fg = colors.other_keywords } , -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
            sym("@boolean")             { highlights.Boolean } , -- Boolean literals: `True` and `False` in Python.
            sym("@character")           { highlights.Character } , -- Character literals: `'a'` in C.
            sym("@character.special")   { highlights.Character } , -- Special characters.
            sym("@comment")             { highlights.Comment } , -- Line comments and block comments.
            sym("@conditional")         { highlights.Conditional } , -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
            sym("@constant")            { highlights.Constant } , -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
            sym("@constant.builtin")    { highlights.Constant } , -- Built-in constant values: `nil` in Lua.
            sym("@constant.macro")      { highlights.Constant } , -- Constants defined by macros: `NULL` in C.
            sym("@constructor")         { highlights.Function } , -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
            sym("@debug")               { fg = colors.other_keywords } , -- Debugging statements.
            sym("@define")              { highlights.PreProc } , -- Preprocessor #define statements.
            sym("@error")               { highlights.Error } , -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
            sym("@exception")           { highlights.Exception, gui = config.styles.keywords } , -- Exception related keywords: `try`, `except`, `finally` in Python.
            sym("@field")               { fg = colors.fg, gui = config.styles.properties } , -- Object and struct fields.
            sym("@float")               { highlights.Float } , -- Floating-point number literals.
            sym("@function")            { highlights.Function } , -- Function calls and definitions.
            sym("@function.builtin")    { highlights.Function } , -- Built-in functions: `print` in Lua.
            sym("@function.macro")      { highlights.Function } , -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
            sym("@include")             { highlights.Function, gui = 'NONE'} , -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
            sym("@keyword")             { highlights.Keyword } , -- Keywords that don't fit into other categories.
            sym("@keyword.function")    { fg = colors.main_keywords, gui = config.styles.keywords } , -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
            sym("@keyword.operator")    { fg = colors.other_keywords, gui = config.styles.operators } , -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
            sym("@keyword.return")      { fg = colors.main_keywords, gui = config.styles.keywords } , -- Keywords like `return` and `yield`.
            sym("@label")               { highlights.Label } , -- GOTO labels: `label:` in C, and `::label::` in Lua.
            sym("@method")              { highlights.Function } , -- Method calls and definitions.
            sym("@namespace")           { highlights.Type, gui = 'NONE'} , -- Identifiers referring to modules and namespaces.
            -- sym("@none")                { } , -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
            sym("@number")              { highlights.Number } , -- Numeric literals that don't fit into other categories.
            sym("@operator")            { highlights.Operator } , -- Binary or unary operators: `+`, and also `->` and `*` in C.
            sym("@parameter")           { fg = colors.fg } , -- Parameters of a function.
            sym("@parameter.reference") { sym("@parameter") } , -- References to parameters of a function.
            sym("@preProc")             { highlights.PreProc } , -- Preprocessor #if, #else, #endif, etc.
            sym("@property")            { sym("@field") } , -- Same as `TSField`.
            sym("@punctuation.delimiter") { highlights.Operator, gui = 'NONE' } , -- Punctuation delimiters: Periods, commas, semicolons, etc.
            sym("@punctuation.bracket") { highlights.Operator, gui =  'NONE' } , -- Brackets, braces, parentheses, etc.
            sym("@punctuation.special") { highlights.Operator, gui =  'NONE' } , -- Special punctuation that doesn't fit into the previous categories.
            sym("@repeat")              { highlights.Repeat } , -- Keywords related to loops: `for`, `while`, etc.
            sym("@storage.class")       { highlights.StorageClass } , -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
            sym("@string")              { highlights.String } , -- String literals.
            sym("@string.regex")        { highlights.Character, gui = config.styles.strings } , -- Regular expression literals.
            sym("@string.escape")       { highlights.Character, gui = config.styles.strings } , -- Escape characters within a string: `\n`, `\t`, etc.
            sym("@string.special")      { highlights.Character, gui = config.styles.strings } , -- Strings with special meaning that don't fit into the previous categories.
            sym("@symbol")              { highlights.Character } , -- Identifiers referring to symbols or atoms.
            sym("@tag")                 { highlights.Keyword } , -- Tags like HTML tag names.
            sym("@tag.attribute")       { highlights.Function, gui = 'NONE' } , -- HTML tag attributes.
            sym("@tag.delimiter")       { highlights.Operator, gui = 'NONE' } , -- Tag delimiters like `<` `>` `/`.
            sym("@text")                { bg = 'NONE' } , -- Non-structured text. Like text in a markup language.
            sym("@text.strong")         { gui = "bold" } , -- Text to be represented in bold.
            sym("@text.emphasis")       { gui = "italic" } , -- Text to be represented with emphasis.
            sym("@text.underline")      { gui = "underline" } , -- Text to be represented with an underline.
            sym("@text.strike")         { gui = "strikethrough" } , -- Strikethrough text.
            sym("@text.title")          { fg = colors.other_keywords } , -- Text that is part of a title.
            sym("@text.literal")        { highlights.Character } , -- Literal or verbatim text.
            sym("@text.uri")            { fg = colors.fg3 } , -- URIs like hyperlinks or email addresses.
            sym("@math")                { fg = colors.other_keywords } , -- Math environments like LaTeX's `$ ... $`
            sym("@text.reference")      { fg = colors.constants } , -- Footnotes, text references, citations, etc.
            sym("@environment")         { fg = colors.other_keywords } , -- Text environments of markup languages.
            sym("@environment.name")    { sym("@environment") } , -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
            sym("@note")                { fg = colors.special_comments } , -- Text representation of an informational note.
            sym("@warning")             { fg = colors.orange } , -- Text representation of a warning note.
            sym("@danger")              { fg = colors.red } , -- Text representation of a danger note.
            sym("@type")                { highlights.Type } , -- Type (and class) definitions and annotations.
            sym("@type.builtin")        { highlights.Type } , -- Built-in types: `i32` in Rust.
            sym("@variable")            { highlights.Identifier } , -- Variable names that don't fit into other categories.
            sym("@variable.builtin")    { fg = colors.other_keywords } , -- Variable names defined by the language: `this` or `self` in Javascript.
        }
    end)
end
