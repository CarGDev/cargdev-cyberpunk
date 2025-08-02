local colors = {
  bg = {
    primary = "#002B36",
    secondary = "#003B46",
    tertiary = "#004B56",
    float = "#003B46",
    highlight = "#112233",
    selection = "#44475A",
  },
  
  fg = {
    primary = "#E0E0E0",
    secondary = "#B8B8B8",
    muted = "#888888",
    accent = "#8BE9FD",
  },
  
  syntax = {
    keyword = "#FF79C6",
    ["function"] = "#50FA7B",
    string = "#8BE9FD",
    number = "#FFB86C",
    comment = "#8BE9FD",
    type = "#BD93F9",
    constant = "#FFB86C",
    operator = "#FF79C6",
    variable = "#BD93F9",
    property = "#50FA7B",
  },
  
  special = {
    error = "#FF5555",
    warning = "#FFB86C",
    info = "#8BE9FD",
    success = "#50FA7B",
    diff_add = "#50FA7B",
    diff_delete = "#FF5555",
    diff_change = "#FFB86C",
  }
}

function colors.override(new_colors)
  for category, values in pairs(new_colors) do
    if colors[category] then
      for key, value in pairs(values) do
        colors[category][key] = value
      end
    end
  end
end

return colors 