-- CargDev Cyberpunk - WezTerm Theme
--
-- Installation:
-- 1. Copy this file to your WezTerm config directory
-- 2. In your wezterm.lua, add:
--    local cargdev_cyberpunk = require("cargdev-cyberpunk-wezterm")
--    config.colors = cargdev_cyberpunk
--
-- Or define colors inline in your wezterm.lua config

return {
    foreground = "#E0E0E0",
    background = "#002B36",

    cursor_fg = "#002B36",
    cursor_bg = "#8BE9FD",
    cursor_border = "#8BE9FD",

    selection_fg = "#F8F8F2",
    selection_bg = "#44475A",

    scrollbar_thumb = "#44475A",
    split = "#44475A",

    ansi = {
        "#002B36", -- black
        "#FF5555", -- red
        "#50FA7B", -- green
        "#FFB86C", -- yellow
        "#BD93F9", -- blue
        "#FF79C6", -- magenta
        "#8BE9FD", -- cyan
        "#E0E0E0", -- white
    },

    brights = {
        "#44475A", -- bright black
        "#FF6E67", -- bright red
        "#5AF78E", -- bright green
        "#F4F99D", -- bright yellow
        "#CAA9FA", -- bright blue
        "#FF92DF", -- bright magenta
        "#9AEDFE", -- bright cyan
        "#F8F8F2", -- bright white
    },

    tab_bar = {
        background = "#002B36",
        active_tab = {
            bg_color = "#8BE9FD",
            fg_color = "#002B36",
        },
        inactive_tab = {
            bg_color = "#003B46",
            fg_color = "#E0E0E0",
        },
        inactive_tab_hover = {
            bg_color = "#004B56",
            fg_color = "#F8F8F2",
        },
        new_tab = {
            bg_color = "#003B46",
            fg_color = "#8BE9FD",
        },
        new_tab_hover = {
            bg_color = "#004B56",
            fg_color = "#8BE9FD",
        },
    },
}
