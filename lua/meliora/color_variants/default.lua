local lush = require('lush')
local hsl = lush.hsl

local get = function(bg)
    local fg = bg.li(80)

    return {
        red = hsl(0, 44, 70),
        orange = hsl(30, 40, 67),
        yellow = hsl(40, 30, 67),

        blue = hsl(255, 18, 65),
        magenta = hsl(309, 18, 65),
        green = hsl(60, 18, 65),

        comment = hsl(60, 24, 36),

        bg = bg,
        fg = fg,

        fg2 = fg.da(16),
        fg3 = fg.da(32),
        fg4 = fg.da(64),
        alt_fg = hsl(28, 20, 67),

        dark_bg = bg.da(12),
        bg2 = bg.li(3),
        bg3 = bg.li(6),
        bg4 = bg.li(8),
        bg5 = bg.li(10),

        simple_red = hsl(05, 50, 69),
        simple_orange = hsl(35, 50, 69),
        simple_blue = hsl(215, 30, 69),
        simple_magenta = hsl(270, 30, 69),
    }
end

return get
