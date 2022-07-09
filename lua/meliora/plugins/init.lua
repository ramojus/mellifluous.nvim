return function(specs, highlights, colors)
    local config = require 'meliora'.config

    for plugin in pairs(config.plugins) do
        if (type(config.plugins[plugin]) == 'table' and config.plugins[plugin]['enabled'] == true)
                or (type(config.plugins[plugin]) == 'boolean' and config.plugins[plugin] == true) then
            table.insert(specs, require('meliora.plugins.' .. plugin)(highlights, colors))
        end
    end

    return specs
end
