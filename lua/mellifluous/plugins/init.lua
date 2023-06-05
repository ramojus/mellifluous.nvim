return function(highlights, colors)
    local config = require('mellifluous').config
    local specs = {}

    for plugin in pairs(config.plugins) do
        if (type(config.plugins[plugin]) == 'table' and config.plugins[plugin]['enabled'] == true)
                or (type(config.plugins[plugin]) == 'boolean' and config.plugins[plugin] == true) then
            table.insert(specs, require('mellifluous.plugins.' .. plugin)(highlights, colors))
        end
    end

    table.insert(specs, require('mellifluous.plugins.treesitter')(highlights, colors))
    table.insert(specs, require('mellifluous.plugins.semantic_tokens')(highlights, colors))

    return specs
end
