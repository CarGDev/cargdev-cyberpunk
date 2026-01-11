local M = {}

---Generate highlight groups based on colors and config
---@param colors table Color palette
---@param config table Configuration options
---@return table Highlight groups
function M.get_groups(colors, config)
  local c = colors
  local cfg = config

  -- Helper for conditional styles
  local function style(bold, italic)
    local s = {}
    if bold then s.bold = true end
    if italic then s.italic = true end
    return s
  end

  local bold_kw = cfg.bold_keywords and { bold = true } or {}
  local bold_fn = cfg.bold_functions and { bold = true } or {}
  local bold_ty = cfg.bold_types and { bold = true } or {}
  local italic_comment = cfg.italic_comments and { italic = true } or {}

  local bg_primary = cfg.transparent and "NONE" or c.bg.primary

  return {
    -- ============================================================
    -- Editor UI
    -- ============================================================
    Normal = { fg = c.fg.primary, bg = bg_primary },
    NormalFloat = { fg = c.fg.primary, bg = c.bg.float },
    NormalNC = { fg = c.fg.primary, bg = bg_primary },
    FloatBorder = { fg = c.fg.accent, bg = c.bg.float },
    FloatTitle = { fg = c.fg.accent, bg = c.bg.float, bold = true },

    -- Line numbers
    LineNr = { fg = c.fg.muted },
    LineNrAbove = { fg = c.fg.muted },
    LineNrBelow = { fg = c.fg.muted },
    CursorLineNr = { fg = c.fg.accent, bold = true },
    SignColumn = { fg = c.fg.muted, bg = bg_primary },
    FoldColumn = { fg = c.fg.muted, bg = bg_primary },

    -- Cursor
    Cursor = { fg = c.bg.primary, bg = c.fg.accent },
    lCursor = { fg = c.bg.primary, bg = c.fg.accent },
    CursorIM = { fg = c.bg.primary, bg = c.fg.accent },
    CursorLine = { bg = c.bg.highlight },
    CursorColumn = { bg = c.bg.highlight },
    ColorColumn = { bg = c.bg.secondary },
    Conceal = { fg = c.fg.muted },

    -- Visual
    Visual = { bg = c.bg.selection },
    VisualNOS = { bg = c.bg.selection },

    -- Search
    Search = { fg = c.bg.primary, bg = c.special.warning },
    IncSearch = { fg = c.bg.primary, bg = c.syntax.number },
    CurSearch = { fg = c.bg.primary, bg = c.special.warning, bold = true },
    Substitute = { fg = c.bg.primary, bg = c.special.error },

    -- Status line
    StatusLine = { fg = c.fg.primary, bg = c.bg.secondary },
    StatusLineNC = { fg = c.fg.muted, bg = c.bg.secondary },
    StatusLineTerm = { fg = c.fg.primary, bg = c.bg.secondary },
    StatusLineTermNC = { fg = c.fg.muted, bg = c.bg.secondary },
    WinBar = { fg = c.fg.primary, bg = bg_primary },
    WinBarNC = { fg = c.fg.muted, bg = bg_primary },
    WinSeparator = { fg = c.bg.tertiary, bg = bg_primary },
    VertSplit = { fg = c.bg.tertiary, bg = bg_primary },

    -- Tab line
    TabLine = { fg = c.fg.muted, bg = c.bg.secondary },
    TabLineFill = { bg = c.bg.secondary },
    TabLineSel = { fg = c.fg.accent, bg = c.bg.tertiary, bold = true },

    -- Popup menu
    Pmenu = { fg = c.fg.primary, bg = c.bg.float },
    PmenuSel = { fg = c.bg.primary, bg = c.fg.accent },
    PmenuSbar = { bg = c.bg.float },
    PmenuThumb = { bg = c.bg.highlight },

    -- Messages
    ModeMsg = { fg = c.fg.primary, bold = true },
    MsgArea = { fg = c.fg.primary },
    MsgSeparator = { fg = c.fg.muted },
    MoreMsg = { fg = c.special.info },
    Question = { fg = c.special.info },
    ErrorMsg = { fg = c.special.error, bold = true },
    WarningMsg = { fg = c.special.warning, bold = true },

    -- Folds
    Folded = { fg = c.fg.muted, bg = c.bg.secondary },
    MatchParen = { fg = c.special.warning, bg = c.bg.selection, bold = true },
    NonText = { fg = c.fg.muted },
    SpecialKey = { fg = c.fg.muted },
    Whitespace = { fg = c.bg.selection },
    EndOfBuffer = { fg = c.bg.primary },

    -- Directory
    Directory = { fg = c.syntax["function"], bold = true },
    Title = { fg = c.syntax.keyword, bold = true },

    -- Diff
    DiffAdd = { fg = c.special.diff_add, bg = "#1a3a1a" },
    DiffChange = { fg = c.special.diff_change, bg = "#3a3a1a" },
    DiffDelete = { fg = c.special.diff_delete, bg = "#3a1a1a" },
    DiffText = { fg = c.fg.primary, bg = c.special.diff_change },

    -- Spell
    SpellBad = { sp = c.special.error, undercurl = true },
    SpellCap = { sp = c.special.warning, undercurl = true },
    SpellLocal = { sp = c.special.info, undercurl = true },
    SpellRare = { sp = c.special.success, undercurl = true },

    -- ============================================================
    -- Syntax highlighting (Vim defaults)
    -- ============================================================
    Comment = vim.tbl_extend("force", { fg = c.syntax.comment }, italic_comment),
    String = { fg = c.syntax.string },
    Character = { fg = c.syntax.string },
    Number = { fg = c.syntax.number },
    Boolean = { fg = c.syntax.constant },
    Float = { fg = c.syntax.number },

    Identifier = { fg = c.syntax.variable },
    Function = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),

    Statement = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    Conditional = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    Repeat = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    Label = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    Operator = vim.tbl_extend("force", { fg = c.syntax.operator }, bold_kw),
    Keyword = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    Exception = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),

    PreProc = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    Include = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    Define = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    Macro = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    PreCondit = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),

    Type = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    StorageClass = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    Structure = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    Typedef = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),

    Special = { fg = c.syntax.property },
    SpecialChar = { fg = c.syntax.property },
    Tag = { fg = c.syntax.property },
    Delimiter = { fg = c.syntax.operator },
    SpecialComment = { fg = c.syntax.comment },
    Debug = { fg = c.syntax.property },

    Underlined = { underline = true },
    Ignore = { fg = c.fg.muted },
    Error = { fg = c.special.error, bold = true },
    Todo = { fg = c.special.warning, bold = true },

    -- ============================================================
    -- Treesitter highlights
    -- ============================================================
    ["@text"] = { fg = c.fg.primary },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.strike"] = { strikethrough = true },
    ["@text.literal"] = { fg = c.syntax.string },
    ["@text.uri"] = { fg = c.syntax["function"], underline = true },
    ["@text.title"] = { fg = c.syntax.keyword, bold = true },
    ["@text.reference"] = { fg = c.fg.accent },

    ["@comment"] = vim.tbl_extend("force", { fg = c.syntax.comment }, italic_comment),
    ["@comment.documentation"] = { fg = c.syntax.comment },
    ["@comment.error"] = { fg = c.special.error },
    ["@comment.warning"] = { fg = c.special.warning },
    ["@comment.todo"] = { fg = c.special.warning, bold = true },
    ["@comment.note"] = { fg = c.special.info },

    ["@constant"] = { fg = c.syntax.constant },
    ["@constant.builtin"] = { fg = c.syntax.constant },
    ["@constant.macro"] = { fg = c.syntax.constant },

    ["@define"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@macro"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),

    ["@string"] = { fg = c.syntax.string },
    ["@string.escape"] = { fg = c.syntax.property },
    ["@string.special"] = { fg = c.syntax.property },
    ["@string.regex"] = { fg = c.syntax.property },

    ["@character"] = { fg = c.syntax.string },
    ["@character.special"] = { fg = c.syntax.property },
    ["@number"] = { fg = c.syntax.number },
    ["@number.float"] = { fg = c.syntax.number },
    ["@boolean"] = { fg = c.syntax.constant },

    ["@function"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@function.builtin"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@function.macro"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@function.call"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@function.method"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@function.method.call"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),

    ["@parameter"] = { fg = c.syntax.variable },
    ["@method"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@method.call"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@field"] = { fg = c.syntax.property, bold = true },
    ["@property"] = { fg = c.syntax.property, bold = true },
    ["@constructor"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),

    ["@conditional"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@conditional.ternary"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@repeat"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@label"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@operator"] = vim.tbl_extend("force", { fg = c.syntax.operator }, bold_kw),
    ["@keyword"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@keyword.function"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@keyword.operator"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@keyword.return"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@keyword.import"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@keyword.export"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@exception"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),

    ["@variable"] = { fg = c.syntax.variable },
    ["@variable.builtin"] = { fg = c.syntax.constant, bold = true },
    ["@variable.parameter"] = { fg = c.syntax.variable },
    ["@variable.member"] = { fg = c.syntax.property, bold = true },

    ["@type"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@type.qualifier"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@type.builtin"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@type.definition"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),

    ["@storageclass"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@structure"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@namespace"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@module"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@include"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@preproc"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@debug"] = { fg = c.syntax.property, bold = true },

    ["@tag"] = { fg = c.syntax.keyword, bold = true },
    ["@tag.attribute"] = { fg = c.syntax.property },
    ["@tag.delimiter"] = { fg = c.fg.muted },

    ["@punctuation"] = { fg = c.fg.secondary },
    ["@punctuation.bracket"] = { fg = c.fg.secondary },
    ["@punctuation.delimiter"] = { fg = c.fg.secondary },
    ["@punctuation.special"] = { fg = c.syntax.property },

    -- ============================================================
    -- LSP semantic tokens
    -- ============================================================
    ["@lsp.type.comment"] = vim.tbl_extend("force", { fg = c.syntax.comment }, italic_comment),
    ["@lsp.type.namespace"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@lsp.type.type"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@lsp.type.class"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@lsp.type.enum"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@lsp.type.interface"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@lsp.type.struct"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@lsp.type.typeParameter"] = vim.tbl_extend("force", { fg = c.syntax.type }, bold_ty),
    ["@lsp.type.parameter"] = { fg = c.syntax.variable },
    ["@lsp.type.variable"] = { fg = c.syntax.variable },
    ["@lsp.type.property"] = { fg = c.syntax.property, bold = true },
    ["@lsp.type.enumMember"] = { fg = c.syntax.constant, bold = true },
    ["@lsp.type.function"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@lsp.type.method"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@lsp.type.macro"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@lsp.type.decorator"] = { fg = c.syntax.property, bold = true },

    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.readonly"] = { fg = c.syntax.constant },
    ["@lsp.mod.defaultLibrary"] = { fg = c.syntax.constant },

    -- ============================================================
    -- Diagnostics
    -- ============================================================
    DiagnosticError = { fg = c.special.error },
    DiagnosticWarn = { fg = c.special.warning },
    DiagnosticInfo = { fg = c.special.info },
    DiagnosticHint = { fg = c.special.hint },
    DiagnosticOk = { fg = c.special.success },

    DiagnosticVirtualTextError = { fg = c.special.error, italic = true },
    DiagnosticVirtualTextWarn = { fg = c.special.warning, italic = true },
    DiagnosticVirtualTextInfo = { fg = c.special.info, italic = true },
    DiagnosticVirtualTextHint = { fg = c.special.hint, italic = true },
    DiagnosticVirtualTextOk = { fg = c.special.success, italic = true },

    DiagnosticUnderlineError = { sp = c.special.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.special.warning, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.special.info, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.special.hint, undercurl = true },
    DiagnosticUnderlineOk = { sp = c.special.success, undercurl = true },

    DiagnosticFloatingError = { fg = c.special.error },
    DiagnosticFloatingWarn = { fg = c.special.warning },
    DiagnosticFloatingInfo = { fg = c.special.info },
    DiagnosticFloatingHint = { fg = c.special.hint },
    DiagnosticFloatingOk = { fg = c.special.success },

    DiagnosticSignError = { fg = c.special.error },
    DiagnosticSignWarn = { fg = c.special.warning },
    DiagnosticSignInfo = { fg = c.special.info },
    DiagnosticSignHint = { fg = c.special.hint },
    DiagnosticSignOk = { fg = c.special.success },

    -- ============================================================
    -- LSP
    -- ============================================================
    LspReferenceText = { bg = c.bg.selection },
    LspReferenceRead = { bg = c.bg.selection },
    LspReferenceWrite = { bg = c.bg.selection },
    LspSignatureActiveParameter = { fg = c.special.warning, bold = true },
    LspCodeLens = { fg = c.fg.muted, italic = true },
    LspCodeLensSeparator = { fg = c.fg.muted },
    LspInlayHint = { fg = c.fg.muted, italic = true },

    -- ============================================================
    -- Git (built-in)
    -- ============================================================
    diffAdded = { fg = c.special.diff_add },
    diffRemoved = { fg = c.special.diff_delete },
    diffChanged = { fg = c.special.diff_change },
    diffOldFile = { fg = c.special.diff_delete },
    diffNewFile = { fg = c.special.diff_add },
    diffFile = { fg = c.fg.accent },
    diffLine = { fg = c.fg.muted },
    diffIndexLine = { fg = c.fg.accent },

    -- ============================================================
    -- Plugin: GitSigns
    -- ============================================================
    GitSignsAdd = { fg = c.special.diff_add },
    GitSignsChange = { fg = c.special.diff_change },
    GitSignsDelete = { fg = c.special.diff_delete },
    GitSignsAddNr = { fg = c.special.diff_add },
    GitSignsChangeNr = { fg = c.special.diff_change },
    GitSignsDeleteNr = { fg = c.special.diff_delete },
    GitSignsAddLn = { bg = "#1a3a1a" },
    GitSignsChangeLn = { bg = "#3a3a1a" },
    GitSignsDeleteLn = { bg = "#3a1a1a" },
    GitSignsCurrentLineBlame = { fg = c.fg.muted, italic = true },

    -- ============================================================
    -- Plugin: Telescope
    -- ============================================================
    TelescopeBorder = { fg = c.fg.accent, bg = c.bg.float },
    TelescopeNormal = { fg = c.fg.primary, bg = c.bg.float },
    TelescopeTitle = { fg = c.fg.accent, bold = true },
    TelescopePromptBorder = { fg = c.fg.accent, bg = c.bg.float },
    TelescopePromptNormal = { fg = c.fg.primary, bg = c.bg.float },
    TelescopePromptTitle = { fg = c.syntax.keyword, bold = true },
    TelescopePromptPrefix = { fg = c.syntax.keyword },
    TelescopeResultsBorder = { fg = c.fg.accent, bg = c.bg.float },
    TelescopeResultsNormal = { fg = c.fg.primary, bg = c.bg.float },
    TelescopeResultsTitle = { fg = c.fg.accent, bold = true },
    TelescopePreviewBorder = { fg = c.fg.accent, bg = c.bg.float },
    TelescopePreviewNormal = { fg = c.fg.primary, bg = c.bg.float },
    TelescopePreviewTitle = { fg = c.syntax["function"], bold = true },
    TelescopeSelection = { fg = c.fg.primary, bg = c.bg.selection },
    TelescopeSelectionCaret = { fg = c.syntax.keyword },
    TelescopeMatching = { fg = c.special.warning, bold = true },

    -- ============================================================
    -- Plugin: NvimTree
    -- ============================================================
    NvimTreeNormal = { fg = c.fg.primary, bg = c.bg.secondary },
    NvimTreeNormalNC = { fg = c.fg.primary, bg = c.bg.secondary },
    NvimTreeRootFolder = { fg = c.syntax.keyword, bold = true },
    NvimTreeFolderName = { fg = c.syntax["function"] },
    NvimTreeFolderIcon = { fg = c.fg.accent },
    NvimTreeOpenedFolderName = { fg = c.syntax["function"], bold = true },
    NvimTreeEmptyFolderName = { fg = c.fg.muted },
    NvimTreeIndentMarker = { fg = c.bg.tertiary },
    NvimTreeGitDirty = { fg = c.special.diff_change },
    NvimTreeGitNew = { fg = c.special.diff_add },
    NvimTreeGitDeleted = { fg = c.special.diff_delete },
    NvimTreeGitStaged = { fg = c.special.success },
    NvimTreeSpecialFile = { fg = c.syntax.keyword, underline = true },
    NvimTreeImageFile = { fg = c.fg.secondary },
    NvimTreeSymlink = { fg = c.fg.accent },
    NvimTreeWinSeparator = { fg = c.bg.tertiary, bg = c.bg.secondary },

    -- ============================================================
    -- Plugin: Neo-tree
    -- ============================================================
    NeoTreeNormal = { fg = c.fg.primary, bg = c.bg.secondary },
    NeoTreeNormalNC = { fg = c.fg.primary, bg = c.bg.secondary },
    NeoTreeRootName = { fg = c.syntax.keyword, bold = true },
    NeoTreeDirectoryName = { fg = c.syntax["function"] },
    NeoTreeDirectoryIcon = { fg = c.fg.accent },
    NeoTreeFileName = { fg = c.fg.primary },
    NeoTreeFileIcon = { fg = c.fg.secondary },
    NeoTreeGitAdded = { fg = c.special.diff_add },
    NeoTreeGitModified = { fg = c.special.diff_change },
    NeoTreeGitDeleted = { fg = c.special.diff_delete },
    NeoTreeGitConflict = { fg = c.special.error },
    NeoTreeGitUntracked = { fg = c.fg.muted },
    NeoTreeIndentMarker = { fg = c.bg.tertiary },
    NeoTreeWinSeparator = { fg = c.bg.tertiary, bg = c.bg.secondary },

    -- ============================================================
    -- Plugin: nvim-cmp
    -- ============================================================
    CmpItemAbbr = { fg = c.fg.primary },
    CmpItemAbbrDeprecated = { fg = c.fg.muted, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.special.warning, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.special.warning, bold = true },
    CmpItemKind = { fg = c.fg.accent },
    CmpItemMenu = { fg = c.fg.muted },
    CmpItemKindClass = { fg = c.syntax.type },
    CmpItemKindColor = { fg = c.syntax.number },
    CmpItemKindConstant = { fg = c.syntax.constant },
    CmpItemKindConstructor = { fg = c.syntax["function"] },
    CmpItemKindEnum = { fg = c.syntax.type },
    CmpItemKindEnumMember = { fg = c.syntax.constant },
    CmpItemKindEvent = { fg = c.syntax.keyword },
    CmpItemKindField = { fg = c.syntax.property },
    CmpItemKindFile = { fg = c.fg.secondary },
    CmpItemKindFolder = { fg = c.syntax["function"] },
    CmpItemKindFunction = { fg = c.syntax["function"] },
    CmpItemKindInterface = { fg = c.syntax.type },
    CmpItemKindKeyword = { fg = c.syntax.keyword },
    CmpItemKindMethod = { fg = c.syntax["function"] },
    CmpItemKindModule = { fg = c.syntax.type },
    CmpItemKindOperator = { fg = c.syntax.operator },
    CmpItemKindProperty = { fg = c.syntax.property },
    CmpItemKindReference = { fg = c.fg.accent },
    CmpItemKindSnippet = { fg = c.syntax.string },
    CmpItemKindStruct = { fg = c.syntax.type },
    CmpItemKindText = { fg = c.fg.primary },
    CmpItemKindTypeParameter = { fg = c.syntax.type },
    CmpItemKindUnit = { fg = c.syntax.number },
    CmpItemKindValue = { fg = c.syntax.constant },
    CmpItemKindVariable = { fg = c.syntax.variable },

    -- ============================================================
    -- Plugin: indent-blankline
    -- ============================================================
    IndentBlanklineChar = { fg = c.bg.tertiary, nocombine = true },
    IndentBlanklineContextChar = { fg = c.fg.muted, nocombine = true },
    IndentBlanklineContextStart = { sp = c.fg.muted, underline = true },
    IblIndent = { fg = c.bg.tertiary, nocombine = true },
    IblScope = { fg = c.fg.muted, nocombine = true },

    -- ============================================================
    -- Plugin: which-key
    -- ============================================================
    WhichKey = { fg = c.syntax.keyword },
    WhichKeyGroup = { fg = c.fg.accent },
    WhichKeyDesc = { fg = c.fg.primary },
    WhichKeySeparator = { fg = c.fg.muted },
    WhichKeyFloat = { bg = c.bg.float },
    WhichKeyValue = { fg = c.fg.muted },

    -- ============================================================
    -- Plugin: Lazy.nvim
    -- ============================================================
    LazyButton = { fg = c.fg.primary, bg = c.bg.secondary },
    LazyButtonActive = { fg = c.bg.primary, bg = c.fg.accent, bold = true },
    LazyComment = { fg = c.fg.muted },
    LazyCommit = { fg = c.fg.accent },
    LazyCommitIssue = { fg = c.syntax.number },
    LazyCommitScope = { fg = c.syntax.property },
    LazyCommitType = { fg = c.syntax.keyword },
    LazyDimmed = { fg = c.fg.muted },
    LazyDir = { fg = c.syntax["function"] },
    LazyH1 = { fg = c.bg.primary, bg = c.fg.accent, bold = true },
    LazyH2 = { fg = c.fg.accent, bold = true },
    LazyNoCond = { fg = c.special.error },
    LazyNormal = { fg = c.fg.primary, bg = c.bg.float },
    LazyProgressDone = { fg = c.special.success },
    LazyProgressTodo = { fg = c.fg.muted },
    LazyProp = { fg = c.fg.muted },
    LazyReasonCmd = { fg = c.syntax.keyword },
    LazyReasonEvent = { fg = c.syntax.number },
    LazyReasonFt = { fg = c.syntax.type },
    LazyReasonImport = { fg = c.syntax.keyword },
    LazyReasonKeys = { fg = c.syntax.string },
    LazyReasonPlugin = { fg = c.syntax["function"] },
    LazyReasonSource = { fg = c.syntax.property },
    LazyReasonStart = { fg = c.special.success },
    LazySpecial = { fg = c.fg.accent },
    LazyTaskOutput = { fg = c.fg.primary },
    LazyUrl = { fg = c.syntax["function"], underline = true },
    LazyValue = { fg = c.syntax.string },

    -- ============================================================
    -- Plugin: Mason
    -- ============================================================
    MasonHeader = { fg = c.bg.primary, bg = c.fg.accent, bold = true },
    MasonHeaderSecondary = { fg = c.bg.primary, bg = c.syntax.keyword, bold = true },
    MasonHighlight = { fg = c.fg.accent },
    MasonHighlightBlock = { fg = c.bg.primary, bg = c.fg.accent },
    MasonHighlightBlockBold = { fg = c.bg.primary, bg = c.fg.accent, bold = true },
    MasonHighlightSecondary = { fg = c.syntax.keyword },
    MasonMuted = { fg = c.fg.muted },
    MasonMutedBlock = { fg = c.fg.primary, bg = c.bg.secondary },

    -- ============================================================
    -- Plugin: Copilot
    -- ============================================================
    CopilotSuggestion = { fg = "#999999", italic = true },
    CopilotAnnotation = { fg = "#999999", italic = true },

    -- ============================================================
    -- Plugin: nvim-notify
    -- ============================================================
    NotifyERRORBorder = { fg = c.special.error },
    NotifyWARNBorder = { fg = c.special.warning },
    NotifyINFOBorder = { fg = c.special.info },
    NotifyDEBUGBorder = { fg = c.fg.muted },
    NotifyTRACEBorder = { fg = c.syntax.type },
    NotifyERRORIcon = { fg = c.special.error },
    NotifyWARNIcon = { fg = c.special.warning },
    NotifyINFOIcon = { fg = c.special.info },
    NotifyDEBUGIcon = { fg = c.fg.muted },
    NotifyTRACEIcon = { fg = c.syntax.type },
    NotifyERRORTitle = { fg = c.special.error },
    NotifyWARNTitle = { fg = c.special.warning },
    NotifyINFOTitle = { fg = c.special.info },
    NotifyDEBUGTitle = { fg = c.fg.muted },
    NotifyTRACETitle = { fg = c.syntax.type },
    NotifyERRORBody = { fg = c.fg.primary },
    NotifyWARNBody = { fg = c.fg.primary },
    NotifyINFOBody = { fg = c.fg.primary },
    NotifyDEBUGBody = { fg = c.fg.primary },
    NotifyTRACEBody = { fg = c.fg.primary },

    -- ============================================================
    -- Plugin: noice.nvim
    -- ============================================================
    NoiceCmdline = { fg = c.fg.primary },
    NoiceCmdlineIcon = { fg = c.fg.accent },
    NoiceCmdlineIconSearch = { fg = c.special.warning },
    NoiceCmdlinePopup = { fg = c.fg.primary, bg = c.bg.float },
    NoiceCmdlinePopupBorder = { fg = c.fg.accent },
    NoiceCmdlinePopupBorderSearch = { fg = c.special.warning },
    NoiceConfirm = { fg = c.fg.primary, bg = c.bg.float },
    NoiceConfirmBorder = { fg = c.fg.accent },
    NoiceMini = { fg = c.fg.primary, bg = c.bg.secondary },
    NoicePopup = { fg = c.fg.primary, bg = c.bg.float },
    NoicePopupBorder = { fg = c.fg.accent },
    NoiceScrollbar = { bg = c.bg.secondary },
    NoiceScrollbarThumb = { bg = c.fg.muted },

    -- ============================================================
    -- Plugin: bufferline.nvim
    -- ============================================================
    BufferLineFill = { bg = c.bg.secondary },
    BufferLineBackground = { fg = c.fg.muted, bg = c.bg.secondary },
    BufferLineBuffer = { fg = c.fg.muted, bg = c.bg.secondary },
    BufferLineBufferSelected = { fg = c.fg.primary, bg = c.bg.primary, bold = true },
    BufferLineBufferVisible = { fg = c.fg.secondary, bg = c.bg.tertiary },
    BufferLineCloseButton = { fg = c.fg.muted, bg = c.bg.secondary },
    BufferLineCloseButtonSelected = { fg = c.special.error, bg = c.bg.primary },
    BufferLineCloseButtonVisible = { fg = c.fg.muted, bg = c.bg.tertiary },
    BufferLineIndicatorSelected = { fg = c.fg.accent, bg = c.bg.primary },
    BufferLineIndicatorVisible = { fg = c.bg.tertiary, bg = c.bg.tertiary },
    BufferLineModified = { fg = c.special.warning, bg = c.bg.secondary },
    BufferLineModifiedSelected = { fg = c.special.warning, bg = c.bg.primary },
    BufferLineModifiedVisible = { fg = c.special.warning, bg = c.bg.tertiary },
    BufferLineSeparator = { fg = c.bg.secondary, bg = c.bg.secondary },
    BufferLineSeparatorSelected = { fg = c.bg.secondary, bg = c.bg.primary },
    BufferLineSeparatorVisible = { fg = c.bg.secondary, bg = c.bg.tertiary },
    BufferLineTab = { fg = c.fg.muted, bg = c.bg.secondary },
    BufferLineTabSelected = { fg = c.fg.accent, bg = c.bg.primary, bold = true },
    BufferLineTabClose = { fg = c.special.error, bg = c.bg.secondary },

    -- ============================================================
    -- Plugin: lualine.nvim
    -- ============================================================
    lualine_a_normal = { fg = c.bg.primary, bg = c.syntax["function"], bold = true },
    lualine_b_normal = { fg = c.fg.primary, bg = c.bg.tertiary },
    lualine_c_normal = { fg = c.fg.secondary, bg = c.bg.secondary },
    lualine_a_insert = { fg = c.bg.primary, bg = c.syntax.keyword, bold = true },
    lualine_a_visual = { fg = c.bg.primary, bg = c.syntax.type, bold = true },
    lualine_a_replace = { fg = c.bg.primary, bg = c.special.error, bold = true },
    lualine_a_command = { fg = c.bg.primary, bg = c.syntax.number, bold = true },
    lualine_a_inactive = { fg = c.fg.muted, bg = c.bg.secondary },
    lualine_b_inactive = { fg = c.fg.muted, bg = c.bg.secondary },
    lualine_c_inactive = { fg = c.fg.muted, bg = c.bg.secondary },

    -- ============================================================
    -- Plugin: dashboard-nvim
    -- ============================================================
    DashboardHeader = { fg = c.syntax.keyword },
    DashboardCenter = { fg = c.fg.accent },
    DashboardFooter = { fg = c.fg.muted },
    DashboardShortCut = { fg = c.syntax["function"] },

    -- ============================================================
    -- Plugin: alpha-nvim
    -- ============================================================
    AlphaHeader = { fg = c.syntax.keyword },
    AlphaButtons = { fg = c.fg.accent },
    AlphaShortcut = { fg = c.syntax["function"] },
    AlphaFooter = { fg = c.fg.muted, italic = true },

    -- ============================================================
    -- Plugin: trouble.nvim
    -- ============================================================
    TroubleText = { fg = c.fg.primary },
    TroubleCount = { fg = c.syntax.keyword, bg = c.bg.tertiary },
    TroubleNormal = { fg = c.fg.primary, bg = c.bg.float },

    -- ============================================================
    -- Markdown
    -- ============================================================
    markdownH1 = { fg = c.syntax.keyword, bold = true },
    markdownH2 = { fg = c.syntax["function"], bold = true },
    markdownH3 = { fg = c.syntax.type, bold = true },
    markdownH4 = { fg = c.syntax.number, bold = true },
    markdownH5 = { fg = c.syntax.property, bold = true },
    markdownH6 = { fg = c.fg.accent, bold = true },
    markdownCode = { fg = c.syntax.string, bg = c.bg.secondary },
    markdownCodeBlock = { fg = c.syntax.string },
    markdownBold = { bold = true },
    markdownItalic = { italic = true },
    markdownLinkText = { fg = c.fg.accent, underline = true },
    markdownUrl = { fg = c.syntax["function"], underline = true },
  }
end

return M
