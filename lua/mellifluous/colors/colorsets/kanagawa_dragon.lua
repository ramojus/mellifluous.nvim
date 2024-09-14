local M = {}
local color = require("mellifluous.color")

function M.get_bg_dark()
    return color.new("#181616")
end

function M.get_colors_dark(bg)
    local fg = bg:lightened(75)
    local dragonWhite = color.new("#c5c9c5")
    -- local fg = dragonWhite

    local dragonBlack0 = color.new("#0d0c0c")
    local dragonBlack1 = color.new("#12120f")
    local dragonBlack2 = color.new("#1D1C19")
    local dragonBlack3 = color.new("#181616")
    local dragonBlack4 = color.new("#282727")
    local dragonBlack5 = color.new("#393836")
    local dragonBlack6 = color.new("#625e5a")

    local dragonGreen = color.new("#87a987")
    local dragonGreen2 = color.new("#8a9a7b")
    local dragonPink = color.new("#a292a3")
    local dragonOrange = color.new("#b6927b")
    local dragonOrange2 = color.new("#b98d7b")
    local dragonGray = color.new("#a6a69c")
    local dragonGray2 = color.new("#9e9b93")
    local dragonGray3 = color.new("#7a8382")
    local dragonBlue2 = color.new("#8ba4b0")
    local dragonViolet = color.new("#8992a7")
    local dragonRed = color.new("#c4746e")
    local dragonAqua = color.new("#8ea4a2")
    local dragonAsh = color.new("#737c73")
    local dragonTeal = color.new("#949fb5")
    local dragonYellow = color.new("#c4b28a")

    return {
        main_keywords = dragonRed,
        other_keywords = dragonViolet, -- original-like
        -- other_keywords = dragonOrange2, -- mellifluous-like
        types = dragonAqua, -- original-like
        -- types = dragonOrange, -- mellifluous-like
        operators = dragonGray2,
        -- strings = dragonGreen, -- original-like
        strings = dragonYellow, -- mellifluous-like
        functions = dragonBlue2,
        constants = dragonOrange, -- used for constants
        -- constants = dragonPink, -- used for numbers
        comments = dragonAsh,

        fg = fg,
        bg = bg,

        red = dragonRed, -- errors, deletes, bad spellings
        orange = dragonOrange2, -- warnings, changes, other (strange) spellings
        green = dragonGreen2, -- staged, additions
        blue = dragonBlue2, -- information, new files
        purple = dragonPink, -- hints, merge
        yellow = dragonYellow,

        -- optional (for better terminal highlights)
        cyan = dragonAqua,
    }
end

function M.get_ui_color_base_lightness()
    return 55
end

return M
