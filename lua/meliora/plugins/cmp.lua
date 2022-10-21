return function(highlights, colors)
    ---@diagnostic disable: undefined-global
    local lush = require 'lush'

    return lush(function()
        return {
            CmpDocumentationBorder { highlights.VertSplit },
            CmpItemAbbrDefault { fg = highlights.Pmenu.fg, blend = highlights.Pmenu.blend },
            CmpItemAbbrMatchDefault { fg = colors.fg },
            CmpItemAbbrMatchFuzzyDefault { fg = colors.fg },
            CmpItemKindDefault { highlights.Type, gui = 'NONE' },
            CmpItemKindClassDefault { highlights.Type, gui = 'NONE' },
            CmpItemKindColorDefault { highlights.Label },
            CmpItemKindConstantDefault { highlights.Constant },
            CmpItemKindConstructorDefault { highlights.Function },
            CmpItemKindEnumDefault { highlights.Constant },
            CmpItemKindEnumMemberDefault { highlights.Constant },
            CmpItemKindEventDefault { highlights.Repeat, gui = 'NONE' },
            CmpItemKindFieldDefault { highlights.Identifier, gui = 'NONE' },
            CmpItemKindFileDefault { highlights.Directory },
            CmpItemKindFolderDefault { CmpItemKindFileDefault },
            CmpItemKindFunctionDefault { highlights.Function, gui = 'NONE' },
            CmpItemKindInterfaceDefault { highlights.Type, gui = 'NONE' },
            CmpItemKindKeywordDefault { highlights.Keyword, gui = 'NONE' },
            CmpItemKindMethodDefault { CmpItemKindFunctionDefault },
            CmpItemKindModuleDefault { highlights.Function },
            CmpItemKindOperatorDefault { highlights.Operator, gui = 'NONE' },
            CmpItemKindPropertyDefault { CmpItemKindFieldDefault },
            CmpItemKindReferenceDefault { highlights.StorageClass },
            CmpItemKindSnippetDefault { highlights.Special },
            CmpItemKindStructDefault { highlights.Structure, gui = 'NONE' },
            CmpItemKindTextDefault { highlights.String, gui = 'NONE' },
            CmpItemKindTypeParameterDefault { highlights.Type, gui = 'NONE' },
            CmpItemKindUnitDefault { CmpItemKindStructDefault },
            CmpItemKindValueDefault { CmpItemKindConstantDefault },
            CmpItemKindVariableDefault { highlights.Identifier, gui = 'NONE' },
            CmpItemMenu { fg = colors.fg3 },
            CmpScrollThumb { highlights.PmenuThumb },
        }
    end)
end
