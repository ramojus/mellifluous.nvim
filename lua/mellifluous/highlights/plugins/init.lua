local M = {}

function M.set(hl, colors)
    for plugin in pairs(Config.plugins) do
        if (type(Config.plugins[plugin]) == 'table' and Config.plugins[plugin].enabled == true)
            or (type(Config.plugins[plugin]) == 'boolean' and Config.plugins[plugin] == true) then
            require('mellifluous.highlights.plugins.' .. plugin).set(hl, colors)
        end
    end

    require('mellifluous.highlights.plugins.treesitter').set(hl, colors)
    require('mellifluous.highlights.plugins.semantic_tokens').set(hl, colors)
end

return M
