local M = {}

function M.set(hl, colors)
    local config = require("mellifluous.config").config

    require("mellifluous.highlights.plugins.treesitter").set(hl, colors)

    for plugin in pairs(config.plugins) do
        if
            (type(config.plugins[plugin]) == "table" and config.plugins[plugin].enabled == true)
            or (type(config.plugins[plugin]) == "boolean" and config.plugins[plugin] == true)
        then
            require("mellifluous.highlights.plugins." .. plugin).set(hl, colors)
        end
    end

    require("mellifluous.highlights.plugins.semantic_tokens").set(hl, colors)
end

return M
