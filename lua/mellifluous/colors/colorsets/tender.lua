local M = {}
local color = require("mellifluous.color")

function M.get_bg_dark()
    return color.new("#282828")
end

function M.get_colors_dark(bg)
    local fg = color.new("#eeeeee")
    local red1 = color.new("#f43753")
    local red2 = color.new("#c5152f")
    local red3 = color.new("#79313c")

    local blue1 = color.new("#b3deef")
    local blue2 = color.new("#73cef4")
    local blue3 = color.new("#44778d")
    local blue4 = color.new("#335261")
    local blue5 = color.new("#293b44")

    local green1 = color.new("#c9d05c")
    local green2 = color.new("#9faa00")
    local green3 = color.new("#6a6b3f")
    local green4 = color.new("#464632")

    local yellow1 = color.new("#d3b987")
    local yellow2 = color.new("#ffc24b")
    local yellow3 = color.new("#715b2f")

    return {
        main_keywords = green1,
        other_keywords = blue2,
        types = blue2,
        operators = blue1,
        strings = yellow1,
        functions = blue1,
        constants = yellow2,
        comments = fg:darkened(45),

        fg = fg,
        bg = bg,

        red = red1:lightened(30), -- errors, deletes, bad spellings
        orange = yellow2, -- warnings, changes, other (strange) spellings
        green = green1, -- staged, additions
        blue = blue1, -- information, new files
        purple = blue2, -- hints, merge
        yellow = yellow1,
    }
end

function M.get_ui_color_base_lightness()
    return 70
end

return M
