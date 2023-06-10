local M = {}

local highlights = {}

function M.set(name, attributes)
    if attributes.style then
        for style_name, val in pairs(attributes.style) do
            attributes[style_name] = val
        end
    end
    attributes.style = nil
    highlights[name] = attributes
end

function M.get(name)
    local attributes = highlights[name]
    if attributes.link then
        return M.get(attributes.link)
    end
    return attributes
end

function M.apply_all()
    for name, attributes in pairs(highlights) do
        vim.api.nvim_set_hl(0, name, attributes)
    end
end

return M
