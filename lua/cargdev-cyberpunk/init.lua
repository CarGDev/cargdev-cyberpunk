local M = {}

function M.setup(opts)
  opts = opts or {}
  M.apply_highlights()
end

function M.apply_highlights()
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
      string = "#FFFFFF",
      number = "#FFB86C",
      comment = "#666666",
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
  
  local groups = {
    Normal = { fg = colors.fg.primary, bg = colors.bg.primary },
    NormalFloat = { fg = colors.fg.primary, bg = colors.bg.float },
    NormalNC = { fg = colors.fg.primary, bg = colors.bg.primary },
    
    LineNr = { fg = colors.fg.muted },
    LineNrAbove = { fg = colors.fg.muted },
    LineNrBelow = { fg = colors.fg.muted },
    CursorLineNr = { fg = colors.fg.accent, bold = true },
    
    Cursor = { fg = colors.bg.primary, bg = colors.fg.accent },
    CursorLine = { bg = colors.bg.highlight },
    CursorColumn = { bg = colors.bg.highlight },
    
    Visual = { bg = colors.bg.selection },
    VisualNOS = { bg = colors.bg.selection },
    
    Search = { fg = colors.bg.primary, bg = colors.special.warning },
    IncSearch = { fg = colors.bg.primary, bg = colors.syntax.number },
    
    StatusLine = { fg = colors.fg.primary, bg = colors.bg.secondary },
    StatusLineNC = { fg = colors.fg.muted, bg = colors.bg.secondary },
    StatusLineTerm = { fg = colors.fg.primary, bg = colors.bg.secondary },
    StatusLineTermNC = { fg = colors.fg.muted, bg = colors.bg.secondary },
    
    TabLine = { fg = colors.fg.muted, bg = colors.bg.secondary },
    TabLineFill = { bg = colors.bg.secondary },
    TabLineSel = { fg = colors.fg.accent, bg = colors.bg.tertiary, bold = true },
    
    WinBar = { fg = colors.fg.primary, bg = colors.bg.primary },
    WinBarNC = { fg = colors.fg.muted, bg = colors.bg.primary },
    
    Pmenu = { fg = colors.fg.primary, bg = colors.bg.float },
    PmenuSel = { fg = colors.fg.primary, bg = colors.fg.accent },
    PmenuSbar = { bg = colors.bg.float },
    PmenuThumb = { bg = colors.bg.highlight },
    
    Comment = { fg = colors.syntax.comment, italic = true },
    String = { fg = colors.syntax.string },
    Character = { fg = colors.syntax.string },
    Number = { fg = colors.syntax.number },
    Boolean = { fg = colors.syntax.constant },
    Float = { fg = colors.syntax.number },
    
    Identifier = { fg = colors.syntax.variable },
    ["Function"] = { fg = colors.syntax["function"], bold = true },
    Statement = { fg = colors.syntax.keyword, bold = true },
    Conditional = { fg = colors.syntax.keyword, bold = true },
    Repeat = { fg = colors.syntax.keyword, bold = true },
    Label = { fg = colors.syntax.keyword, bold = true },
    Operator = { fg = colors.syntax.operator, bold = true },
    Keyword = { fg = colors.syntax.keyword, bold = true },
    Exception = { fg = colors.syntax.keyword, bold = true },
    
    PreProc = { fg = colors.syntax.keyword, bold = true },
    Include = { fg = colors.syntax.keyword, bold = true },
    Define = { fg = colors.syntax.keyword, bold = true },
    Macro = { fg = colors.syntax.keyword, bold = true },
    PreCondit = { fg = colors.syntax.keyword, bold = true },
    
    Type = { fg = colors.syntax.type, bold = true },
    StorageClass = { fg = colors.syntax.keyword, bold = true },
    Structure = { fg = colors.syntax.type, bold = true },
    Typedef = { fg = colors.syntax.type, bold = true },
    
    Special = { fg = colors.syntax.property },
    SpecialChar = { fg = colors.syntax.property },
    Tag = { fg = colors.syntax.property },
    Delimiter = { fg = colors.syntax.operator },
    SpecialComment = { fg = colors.syntax.comment },
    Debug = { fg = colors.syntax.property },
    
    Underlined = { underline = true },
    Ignore = { fg = colors.fg.muted },
    Error = { fg = colors.special.error, bold = true },
    Todo = { fg = colors.special.warning, bold = true },
    
    DiffAdd = { fg = colors.special.diff_add },
    DiffChange = { fg = colors.special.diff_change },
    DiffDelete = { fg = colors.special.diff_delete },
    DiffText = { fg = colors.fg.primary, bg = colors.special.diff_change },
    
    SpellBad = { sp = colors.special.error, underline = true },
    SpellCap = { sp = colors.special.warning, underline = true },
    SpellLocal = { sp = colors.special.info, underline = true },
    SpellRare = { sp = colors.special.success, underline = true },
    
    ["@text"] = { fg = colors.fg.primary },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.strike"] = { strikethrough = true },
    ["@text.literal"] = { fg = colors.syntax.string },
    ["@text.uri"] = { fg = colors.syntax["function"], underline = true },
    
    ["@comment"] = { fg = colors.syntax.comment, italic = true },
    ["@comment.documentation"] = { fg = colors.syntax.comment },
    
    ["@constant"] = { fg = colors.syntax.constant },
    ["@constant.builtin"] = { fg = colors.syntax.constant },
    ["@constant.macro"] = { fg = colors.syntax.constant },
    ["@define"] = { fg = colors.syntax.keyword },
    ["@macro"] = { fg = colors.syntax.keyword },
    ["@string"] = { fg = colors.syntax.string },
    ["@string.escape"] = { fg = colors.syntax.property },
    ["@string.special"] = { fg = colors.syntax.property },
    ["@character"] = { fg = colors.syntax.string },
    ["@character.special"] = { fg = colors.syntax.property },
    ["@number"] = { fg = colors.syntax.number },
    ["@boolean"] = { fg = colors.syntax.constant },
    ["@float"] = { fg = colors.syntax.number },
    
    ["@function"] = { fg = colors.syntax["function"], bold = true },
    ["@function.builtin"] = { fg = colors.syntax["function"], bold = true },
    ["@function.macro"] = { fg = colors.syntax["function"], bold = true },
    ["@parameter"] = { fg = colors.syntax.variable },
    ["@method"] = { fg = colors.syntax["function"], bold = true },
    ["@field"] = { fg = colors.syntax.property, bold = true },
    ["@property"] = { fg = colors.syntax.property, bold = true },
    ["@constructor"] = { fg = colors.syntax["function"], bold = true },
    
    ["@conditional"] = { fg = colors.syntax.keyword, bold = true },
    ["@repeat"] = { fg = colors.syntax.keyword, bold = true },
    ["@label"] = { fg = colors.syntax.keyword, bold = true },
    ["@operator"] = { fg = colors.syntax.operator, bold = true },
    ["@keyword"] = { fg = colors.syntax.keyword, bold = true },
    ["@exception"] = { fg = colors.syntax.keyword, bold = true },
    
    ["@variable"] = { fg = colors.syntax.variable },
    ["@variable.builtin"] = { fg = colors.syntax.constant, bold = true },
    ["@type"] = { fg = colors.syntax.type, bold = true },
    ["@type.qualifier"] = { fg = colors.syntax.keyword, bold = true },
    ["@type.builtin"] = { fg = colors.syntax.type, bold = true },
    ["@type.definition"] = { fg = colors.syntax.type, bold = true },
    ["@storageclass"] = { fg = colors.syntax.keyword, bold = true },
    ["@structure"] = { fg = colors.syntax.type, bold = true },
    ["@namespace"] = { fg = colors.syntax.type, bold = true },
    ["@include"] = { fg = colors.syntax.keyword, bold = true },
    ["@preproc"] = { fg = colors.syntax.keyword, bold = true },
    ["@debug"] = { fg = colors.syntax.property, bold = true },
    ["@tag"] = { fg = colors.syntax.property, bold = true },
    
    ["@lsp.type.comment"] = { fg = colors.syntax.comment, italic = true },
    ["@lsp.type.namespace"] = { fg = colors.syntax.type, bold = true },
    ["@lsp.type.type"] = { fg = colors.syntax.type, bold = true },
    ["@lsp.type.class"] = { fg = colors.syntax.type, bold = true },
    ["@lsp.type.enum"] = { fg = colors.syntax.type, bold = true },
    ["@lsp.type.interface"] = { fg = colors.syntax.type, bold = true },
    ["@lsp.type.struct"] = { fg = colors.syntax.type, bold = true },
    ["@lsp.type.parameter"] = { fg = colors.syntax.variable },
    ["@lsp.type.variable"] = { fg = colors.syntax.variable },
    ["@lsp.type.property"] = { fg = colors.syntax.property, bold = true },
    ["@lsp.type.enumMember"] = { fg = colors.syntax.constant, bold = true },
    ["@lsp.type.function"] = { fg = colors.syntax["function"], bold = true },
    ["@lsp.type.method"] = { fg = colors.syntax["function"], bold = true },
    ["@lsp.type.macro"] = { fg = colors.syntax.keyword, bold = true },
    ["@lsp.type.decorator"] = { fg = colors.syntax.property, bold = true },
    
    CopilotSuggestion = { fg = "#999999", italic = true },
    CopilotAnnotation = { fg = "#999999", italic = true },
    CopilotSuggestionPrefix = { fg = "#999999", italic = true },
    CopilotSuggestionSuffix = { fg = "#999999", italic = true },
  }
  
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M 