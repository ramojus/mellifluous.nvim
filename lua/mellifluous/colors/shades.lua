local M = {}

function M.get_recipes(is_bg_dark)
    if is_bg_dark then
        return {
            fg2 = { target = 'fg', action = 'da', val = 16 },
            fg3 = { target = 'fg', action = 'da', val = 32 },
            fg4 = { target = 'fg', action = 'da', val = 48 },
            fg5 = { target = 'fg', action = 'da', val = 64 },
            dark_bg = { target = 'bg', action = 'da', val = 2.5 },
            bg2 = { target = 'bg', action = 'li', val = 4 },
            bg3 = { target = 'bg', action = 'li', val = 6 },
            bg4 = { target = 'bg', action = 'li', val = 8 },
            bg5 = { target = 'bg', action = 'li', val = 10 },
        }
    else
        return {
            fg2 = { target = 'fg', action = 'li', val = 16 },
            fg3 = { target = 'fg', action = 'li', val = 32 },
            fg4 = { target = 'fg', action = 'li', val = 48 },
            fg5 = { target = 'fg', action = 'li', val = 64 },
            dark_bg2 = { target = 'bg', action = 'da', val = 8 },
            dark_bg = { target = 'bg', action = 'da', val = 2.5 },
            bg2 = { target = 'bg', action = 'li', val = 4 },
            bg3 = { target = 'bg', action = 'li', val = 6 },
            bg4 = { target = 'bg', action = 'li', val = 8 },
        }
    end
end

return M

