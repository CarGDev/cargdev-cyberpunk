return {
  vibrant = {

    -- ============================================================
    -- Nested some semantic groups (used by highlights.lua)
    -- ============================================================
    bg = {
      primary = "#0c0e15",
      secondary = "#1a212e",
      tertiary = "#21283b",
    },
    fg = {
      primary = "#5fe37a", -- vibrant green: main/plain code text (was muted blue-grey)
      secondary = "#f8f8f8", -- muted, for less prominent UI text (statuslines, etc.)
      bracket = "#6c7d9c",
      unused = "#992525",
      white = "#ffffff",
    },
    syntax = {
      comment = "#5c7099", -- was #455574 — lifted so italic comments stay legible, not invisible
      string = "#7ee787", -- more saturated green, reads clearly as "string" vs plain code
      number = "#ffb86c", -- warmer, punchier orange — numbers should pop against text
      constant = "#56d4dd", -- brighter cyan for constants/booleans
      ["function"] = "#d600ff", -- vivid sky blue, more vibrant than #41a7fc
      variable = "#ffffff", -- vibrant near-white, per your earlier request
      operator = "#fefefe", -- lighter purple, distinct from keyword purple
      keyword = "#50fa7b", -- kept — this is your theme's signature purple, already vibrant
      type = "#fefefe", -- shifted to pink so types are visually distinct from keywords (both were c.purple before — now separated)
      property = "#ff6bc4", -- vivid magenta/pink
      type_property = "#74569b",
    },
    special = {
      error = "#f65866",
      warning = "#efbd5d",
      info = "#34bfd0",
      hint = "#8bcd5b",
      success = "#8bcd5b",
      diff_add = "#50fa7b",
      diff_delete = "#f65866",
      diff_change = "#ffd76e",
    },

    -- ============================================================
    -- Flat terminal/base colors
    -- ============================================================
    black = "#0c0e15",
    bg0 = "#1a212e",
    bg1 = "#21283b",
    bg2 = "#283347",
    bg3 = "#2a324a",
    bg_d = "#141b24",
    bg_blue = "#54b0fd",
    bg_yellow = "#f2cc81",

    white = "#ffffff",

    -- Base colors
    purple = "#c75ae8",
    magenta = "#e83abf",
    green = "#5fe37a",
    plain_green = "#5fe37a", -- vibrant green for plain code text, same as fg.primary
    orange = "#dd9046",
    blue = "#41a7fc",
    yellow = "#efbd5d",
    cyan = "#34bfd0",
    red = "#f65866",
    grey = "#455574",
    light_grey = "#6c7d9c",

    -- Dark variants
    dark_cyan = "#1b6a73",
    dark_red = "#992525",
    dark_yellow = "#8f610d",

    -- Diff colors
    diff_add = "#27341c",
    diff_delete = "#331c1e",
    diff_change = "#102b40",
    diff_text = "#1c4a6e",

    -- Bright variants
    bright_black = "#3b4d6b",
    bright_purple = "#ff79c6",
    bright_green = "#50fa7b",
    bright_orange = "#ffb86c",
    bright_magenta = "#ff5fd1",
    bright_blue = "#6fc3ff",
    bright_yellow = "#ffd76e",
    bright_white = "#f8f8f8",
    bright_cyan = "#8be9fd",
    bright_red = "#ff5555",
    bright_grey = "#5a6f94",
    bright_light_grey = "#8fa0c2",
    bright_dark_cyan = "#2a919e",
    bright_dark_red = "#c23636",
    green_bs = "#3a3a1a",
  },
}
