local M = {}

function M.set(hl, colors)
    local shader = require('mellifluous.utils.shader')
    local config = require('mellifluous.config').config

    hl.set('@attribute', { fg = colors.other_keywords })                                                   -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
    hl.set('@boolean', { link = 'Boolean' })                                                               -- Boolean literals: `True` and `False` in Python.
    hl.set('@character', { link = 'Character' })                                                           -- Character literals: `'a'` in C.
    hl.set('@character.special', { link = 'Character' })                                                   -- Special characters.
    hl.set('@comment', { link = 'Comment' })                                                               -- Line comments and block comments.
    hl.set('@conditional', { link = 'Conditional' })                                                       -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
    hl.set('@constant', { link = 'Constant' })                                                             -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
    hl.set('@constant.builtin', { link = 'Constant' })                                                     -- Built-in constant values: `nil` in Lua.
    hl.set('@constant.macro', { link = 'Constant' })                                                       -- Constants defined by macros: `NULL` in C.
    hl.set('@constructor', { link = 'Function' })                                                          -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
    hl.set('@debug', { fg = colors.other_keywords })                                                       -- Debugging statements.
    hl.set('@define', { link = 'PreProc' })                                                                -- Preprocessor #define statements.
    hl.set('@error', { link = 'Error' })                                                                   -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
    hl.set('@exception', { link = 'Exception', style = config.styles.keywords })                           -- Exception related keywords: `try`, `except`, `finally` in Python.
    hl.set('@field', { fg = colors.fg, style = config.styles.properties })                                 -- Object and struct fields.
    hl.set('@float', { link = 'Float' })                                                                   -- Floating-point number literals.
    hl.set('@function', { link = 'Function' })                                                             -- Function calls and definitions.
    hl.set('@function.builtin', { link = 'Function' })                                                     -- Built-in functions: `print` in Lua.
    hl.set('@function.macro', { link = 'Function' })                                                       -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
    hl.set('@include', { link = 'Function', style = {} })                                                  -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
    hl.set('@keyword', { link = 'Keyword' })                                                               -- Keywords that don't fit into other categories.
    hl.set('@keyword.function', { fg = colors.main_keywords, style = config.styles.keywords })             -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
    hl.set('@keyword.operator', { fg = colors.other_keywords, style = config.styles.operators })           -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    hl.set('@keyword.return', { fg = colors.main_keywords, style = config.styles.keywords })               -- Keywords like `return` and `yield`.
    hl.set('@label', { link = 'Label' })                                                                   -- GOTO labels: `label:` in C, and `::label::` in Lua.
    hl.set('@label.markdown', { fg = colors.comments })                                                    -- Code block language
    hl.set('@method', { link = 'Function' })                                                               -- Method calls and definitions.
    hl.set('@namespace', { link = 'Type', style = {} })                                                    -- Identifiers referring to modules and namespaces.
    hl.set('@number', { link = 'Number' })                                                                 -- Numeric literals that don't fit into other categories.
    hl.set('@operator', { link = 'Operator' })                                                             -- Binary or unary operators: `+`, and also `->` and `*` in C.
    hl.set('@parameter', { fg = colors.fg })                                                               -- Parameters of a function.
    hl.set('@parameter.reference', { link = '@parameter' })                                                -- References to parameters of a function.
    hl.set('@preProc', { link = 'PreProc' })                                                               -- Preprocessor #if, #else, #endif, etc.
    hl.set('@property', { link = '@field' })                                                               -- Same as `TSField`.
    hl.set('@punctuation.delimiter', { link = 'Operator', style = {} })                                    -- Punctuation delimiters: Periods, commas, semicolons, etc.
    hl.set('@punctuation.bracket', { link = 'Operator', style = {} })                                      -- Brackets, braces, parentheses, etc.
    hl.set('@punctuation.special', { link = 'Operator', style = {} })                                      -- Special punctuation that doesn't fit into the previous categories.
    hl.set('@repeat', { link = 'Repeat' })                                                                 -- Keywords related to loops: `for`, `while`, etc.
    hl.set('@storage.class', { link = 'StorageClass' })                                                    -- Keywords that affect how a variable is stored: `static`, `comptime`, `extern`, etc.
    hl.set('@string', { link = 'String' })                                                                 -- String literals.
    hl.set('@string.regex', { link = 'Character', style = config.styles.strings })                         -- Regular expression literals.
    hl.set('@string.escape', { link = 'Character', style = config.styles.strings })                        -- Escape characters within a string: `\n`, `\t`, etc.
    hl.set('@string.special', { link = 'Character', style = config.styles.strings })                       -- Strings with special meaning that don't fit into the previous categories.
    hl.set('@symbol', { link = 'Character' })                                                              -- Identifiers referring to symbols or atoms.
    hl.set('@tag', { link = 'Keyword' })                                                                   -- Tags like HTML tag names.
    hl.set('@tag.attribute', { link = 'Function', style = {} })                                            -- HTML tag attributes.
    hl.set('@tag.delimiter', { link = 'Operator', style = {} })                                            -- Tag delimiters like `<` `>` `/`.
    hl.set('@text', { bg = 'NONE' })                                                                       -- Non-structured text. Like text in a markup language.
    hl.set('@text.strong', { style = { bold = true } })                                                    -- Text to be represented in bold.
    hl.set('@text.emphasis', { style = { italic = true } })                                                -- Text to be represented with emphasis.
    hl.set('@text.underline', { style = { underline = true } })                                            -- Text to be represented with an underline.
    hl.set('@text.strike', { style = { strikethrough = true } })                                           -- Strikethrough text.
    hl.set('@text.title', { fg = colors.other_keywords })                                                  -- Text that is part of a title.
    hl.set('@text.literal', { link = 'Character' })                                                        -- Literal or verbatim text.
    hl.set('@text.uri', { fg = shader.get_lower_contrast(colors.blue, 15), style = { underline = true } }) -- URIs like hyperlinks or email addresses.
    hl.set('@text.todo', { link = 'Todo' })
    hl.set('@text.danger', { bg = colors.bg:with_overlay(colors.ui_orange, 20), fg = colors.ui_orange })
    hl.set('@text.warning', { bg = colors.bg:with_overlay(colors.ui_red, 20), fg = colors.ui_red })
    hl.set('@math', { fg = colors.other_keywords })             -- Math environments like LaTeX's `$ ... $`
    hl.set('@text.reference', { fg = colors.constants })        -- Footnotes, text references, citations, etc.
    hl.set('@environment', { fg = colors.other_keywords })      -- Text environments of markup languages.
    hl.set('@environment.name', { link = '@environment' })      -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
    hl.set('@note', { fg = colors.special_comments })           -- Text representation of an informational note.
    hl.set('@warning', { fg = colors.orange })                  -- Text representation of a warning note.
    hl.set('@danger', { fg = colors.red })                      -- Text representation of a danger note.
    hl.set('@type', { link = 'Type' })                          -- Type (and class) definitions and annotations.
    hl.set('@type.builtin', { link = 'Type' })                  -- Built-in types: `i32` in Rust.
    hl.set('@variable', { link = 'Identifier' })                -- Variable names that don't fit into other categories.
    hl.set('@variable.builtin', { fg = colors.other_keywords }) -- Variable names defined by the language: `this` or `self` in Javascript.
end

return M
