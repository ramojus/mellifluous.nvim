local M = {}

local highlights = {}

local function get_hex(color)
    if color then
        return color.hex or color
    else
        return nil
    end
end

function M.set(name, attributes)
    if not attributes.style then
        attributes.style = {}
    end

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
        for style_name, val in pairs(attributes.style or {}) do
            attributes[style_name] = val
        end
        attributes.style = nil
        attributes.fg = get_hex(attributes.fg)
        attributes.bg = get_hex(attributes.bg)
        attributes.sp = get_hex(attributes.sp)

        vim.api.nvim_set_hl(0, name, attributes)
    end
end

function M.clear_highlights()
    highlights = {}
end

return M
