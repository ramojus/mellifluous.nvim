return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require('lush')
    local config = require('mellifluous').config
    local change_color = require('mellifluous.utils.change_color')

    return lush(function(injected_functions)
        local sym = injected_functions.sym
        return {
            sym('@lsp.type.comment')                { }, -- let treesitter handle those
            sym('@lsp.type.enum')                   { highlights.Type },
            sym('@lsp.type.enumMember')             { highlights.Constant },
            sym('@lsp.type.escapeSequence')         { fg = colors.fg3 },
            sym('@lsp.type.formatSpecifier')        { highlights.Operator },
            sym('@lsp.type.namespace')              { highlights.Type },
            sym('@lsp.type.operator')               { highlights.Operator },
            sym('@lsp.type.parameter')              { fg = colors.fg },
            sym('@lsp.type.property')               { fg = colors.fg },
            sym('@lsp.typemod.variable.constant')   { highlights.Constant },
            sym('@lsp.typemod.keyword.controlFlow') { fg = colors.main_keywords },
        }
    end)
end
