local M = {}

function M.set(hl)
    hl.set('LazyProgressTodo', { fg = hl.get('LineNr').fg })
end

return M
