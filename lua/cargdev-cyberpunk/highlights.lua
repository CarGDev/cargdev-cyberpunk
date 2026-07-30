local M = {}

---Generate highlight groups based on colors and config
---@param colors table Color palette
---@param config table Configuration options
---@return table Highlight groups
function M.get_groups(colors, config)
  local c = colors
  local cfg = config

  local bold_kw = cfg.bold_keywords and { bold = true } or {}
  local bold_fn = cfg.bold_functions and { bold = true } or {}
  local bold_ty = cfg.bold_types and { bold = true } or {}
  local italic_comment = cfg.italic_comments and { italic = true } or {}

  local bg_primary = cfg.transparent and "NONE" or c.black

  return {
    -- ===========================================================e
    -- Editor UI
    -- ============================================================
    Normal = { fg = c.fg.secondary, bg = bg_primary },
    NormalFloat = { fg = c.fg.secondary, bg = c.bg0 },
    NormalNC = { fg = c.fg.secondary, bg = bg_primary },
    FloatBorder = { fg = c.purple, bg = c.bg0 },
    FloatTitle = { fg = c.purple, bg = c.bg0, bold = true },

    -- Line numbers
    LineNr = { fg = c.light_grey },
    LineNrAbove = { fg = c.light_grey },
    LineNrBelow = { fg = c.light_grey },
    CursorLineNr = { fg = c.purple, bold = true },
    SignColumn = { fg = c.light_grey, bg = bg_primary },
    FoldColumn = { fg = c.light_grey, bg = bg_primary },

    -- Cursor
    Cursor = { fg = c.black, bg = c.purple },
    lCursor = { fg = c.black, bg = c.purple },
    CursorIM = { fg = c.black, bg = c.purple },
    CursorLine = { bg = c.magenta },
    CursorColumn = { bg = c.magenta },
    ColorColumn = { bg = c.bg0 },
    Conceal = { fg = c.light_grey },

    -- Visual
    Visual = { fg = c.white, bg = c.magenta },
    VisualNOS = { fg = c.white, bg = c.magenta },

    -- Search
    Search = { fg = c.bg_blue, bg = c.bg_yellow },
    IncSearch = { fg = c.black, bg = c.bg_yellow },
    CurSearch = { fg = c.black, bg = c.bg_yellow, bold = true },
    Substitute = { fg = c.black, bg = c.bg_yellow, bold = true },

    -- Status line
    StatusLine = { fg = c.fg.secondary, bg = c.bg0 },
    StatusLineNC = { fg = c.light_grey, bg = c.bg0 },
    StatusLineTerm = { fg = c.fg.secondary, bg = c.bg0 },
    StatusLineTermNC = { fg = c.light_grey, bg = c.bg0 },
    WinBar = { fg = c.fg.secondary, bg = bg_primary },
    WinBarNC = { fg = c.light_grey, bg = bg_primary },
    WinSeparator = { fg = c.bg.tertiary, bg = bg_primary },
    VertSplit = { fg = c.bg.tertiary, bg = bg_primary },

    -- Tab line
    TabLine = { fg = c.light_grey, bg = c.bg0 },
    TabLineFill = { bg = c.bg0 },
    TabLineSel = { fg = c.purple, bg = c.bg.tertiary, bold = true },

    -- Popup menu
    Pmenu = { fg = c.fg.secondary, bg = c.bg0 },
    PmenuSel = { fg = c.black, bg = c.purple },
    PmenuSbar = { bg = c.bg0 },
    PmenuThumb = { bg = c.magenta },

    -- Messages
    ModeMsg = { fg = c.fg.secondary, bold = true },
    MsgArea = { fg = c.fg.secondary },
    MsgSeparator = { fg = c.light_grey },
    MoreMsg = { fg = c.special.info },
    Question = { fg = c.special.info },
    ErrorMsg = { fg = c.special.error, bold = true },
    WarningMsg = { fg = c.special.warning, bold = true },

    -- Folds
    Folded = { fg = c.light_grey, bg = c.bg0 },
    MatchParen = { fg = c.special.warning, bg = c.bright_red, bold = true },
    NonText = { fg = c.light_grey },
    SpecialKey = { fg = c.light_grey },
    Whitespace = { fg = c.bright_red },
    EndOfBuffer = { fg = c.black },

    -- Directory
    Directory = { fg = c.syntax["function"], bold = true },
    Title = { fg = c.syntax.keyword, bold = true },

    -- Diff
    DiffChange = { fg = c.special.diff_change, bg = c.green_bs },
    DiffText = { fg = c.fg.secondary, bg = c.special.diff_change },

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
    Function = vim.tbl_extend("force", { fg = c.bright_magenta }, bold_fn),

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
    Ignore = { fg = c.light_grey },
    Error = { fg = c.special.error, bold = true },
    Todo = { fg = c.special.warning, bold = true },

    -- ============================================================
    -- Language-specific (TypeScript/JavaScript)
    -- ============================================================
    typescriptBlock = { fg = c.purple },
    typescriptBraces = { fg = c.purple },
    typescriptParens = { fg = c.fg.bracket },
    typescriptEndColons = { fg = c.fg.bracket },
    typescriptIdentifierName = { fg = c.syntax.variable },
    typescriptVariable = { fg = c.syntax.variable },
    typescriptVariableDeclaration = { fg = c.syntax.variable },
    typescriptTypeReference = { fg = c.syntax.type },
    typescriptImport = { fg = c.syntax.keyword },
    typescriptExport = { fg = c.syntax.keyword },
    typescriptFuncKeyword = { fg = c.syntax.keyword },
    typescriptArrowFunc = { fg = c.syntax.keyword },
    typescriptCall = { fg = c.syntax["function"] },
    typescriptMember = { fg = c.syntax.property },

    -- ============================================================
    -- Treesitter highlights
    -- ============================================================
    ["@text"] = { fg = c.white },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.strike"] = { strikethrough = true },
    ["@text.literal"] = { fg = c.syntax.string },
    ["@text.uri"] = { fg = c.syntax["function"], underline = true },
    ["@text.title"] = { fg = c.syntax.keyword, bold = true },
    ["@text.reference"] = { fg = c.purple },

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
    ["@tag.delimiter"] = { fg = c.light_grey },

    ["@punctuation"] = { fg = c.fg.primary },
    ["@punctuation.bracket"] = { fg = c.fg.primary },
    ["@punctuation.delimiter"] = { fg = c.fg.primary },
    ["@punctuation.special"] = { fg = c.purple },

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
    ["@lsp.type.property"] = { fg = c.syntax.property, bold = true },
    ["@lsp.type.enumMember"] = { fg = c.syntax.constant, bold = true },
    ["@lsp.type.function"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@lsp.type.method"] = vim.tbl_extend("force", { fg = c.syntax["function"] }, bold_fn),
    ["@lsp.type.macro"] = vim.tbl_extend("force", { fg = c.syntax.keyword }, bold_kw),
    ["@lsp.type.decorator"] = { fg = c.syntax.property, bold = true },

    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.readonly"] = {}, -- Don't change color for const, keep variable color
    ["@lsp.mod.defaultLibrary"] = { fg = c.syntax.constant },
    ["@lsp.mod.unused"] = { fg = c.fg.unused }, -- Gray for unused variables/imports

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

    -- Unused code (for unused variables/imports)
    DiagnosticUnnecessary = { fg = c.fg.unused },

    -- ============================================================
    -- LSP
    -- ============================================================
    LspReferenceText = { fg = c.white, bg = c.dark_cyan },
    LspReferenceRead = { fg = c.white, bg = c.dark_cyan },
    LspReferenceWrite = { fg = c.white, bg = c.fg.bracket },
    LspSignatureActiveParameter = { fg = c.special.warning, bold = true },
    LspCodeLens = { fg = c.light_grey, italic = true },
    LspCodeLensSeparator = { fg = c.light_grey },
    LspInlayHint = { fg = c.light_grey, italic = true },

    -- ============================================================
    -- Git (built-in)
    -- ============================================================
    DiffAdd = { fg = c.bg.primary, bg = c.syntax.keyword, bold = true },
    DiffDelete = { bg = c.special.error, bold = true },
    diffRemoved = { fg = c.dark_red, bold = true },
    diffChanged = { fg = c.special.diff_change },
    diffOldFile = { fg = c.special.diff_delete },
    diffNewFile = { fg = c.special.diff_add },
    diffFile = { fg = c.purple },
    diffLine = { fg = c.light_grey },
    diffIndexLine = { fg = c.purple },

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
    GitSignsCurrentLineBlame = { fg = c.light_grey, italic = true },

    -- ============================================================
    -- Plugin: Telescope
    -- ============================================================
    TelescopeBorder = { fg = c.purple, bg = c.bg0 },
    TelescopeNormal = { fg = c.fg.secondary, bg = c.bg0 },
    TelescopeTitle = { fg = c.purple, bold = true },
    TelescopePromptBorder = { fg = c.purple, bg = c.bg0 },
    TelescopePromptNormal = { fg = c.fg.secondary, bg = c.bg0 },
    TelescopePromptTitle = { fg = c.syntax.keyword, bold = true },
    TelescopePromptPrefix = { fg = c.syntax.keyword },
    TelescopeResultsBorder = { fg = c.purple, bg = c.bg0 },
    TelescopeResultsNormal = { fg = c.fg.secondary, bg = c.bg0 },
    TelescopeResultsTitle = { fg = c.purple, bold = true },
    TelescopePreviewBorder = { fg = c.purple, bg = c.bg0 },
    TelescopePreviewNormal = { fg = c.fg.secondary, bg = c.bg0 },
    TelescopePreviewTitle = { fg = c.syntax["function"], bold = true },
    TelescopeSelection = { fg = c.fg.secondary, bg = c.bright_red },
    TelescopeSelectionCaret = { fg = c.syntax.keyword },
    TelescopeMatching = { fg = c.special.warning, bold = true },

    -- ============================================================
    -- Plugin: NvimTree
    -- ============================================================
    NvimTreeNormal = { fg = c.fg.secondary, bg = c.bg0 },
    NvimTreeNormalNC = { fg = c.fg.secondary, bg = c.bg0 },
    NvimTreeRootFolder = { fg = c.syntax.keyword, bold = true },
    NvimTreeFolderName = { fg = c.green },
    NvimTreeFolderIcon = { fg = c.green },
    NvimTreeOpenedFolderName = { fg = c.green, bold = true },
    NvimTreeEmptyFolderName = { fg = c.light_grey },
    NvimTreeIndentMarker = { fg = c.white },
    NvimTreeGitDirty = { fg = c.special.diff_change },
    NvimTreeGitNew = { fg = c.special.diff_add },
    NvimTreeGitDeleted = { fg = c.special.diff_delete },
    NvimTreeGitStaged = { fg = c.special.success },
    NvimTreeSpecialFile = { fg = c.syntax.keyword, underline = true },
    NvimTreeImageFile = { fg = c.fg.secondary },
    NvimTreeSymlink = { fg = c.purple },
    NvimTreeWinSeparator = { fg = c.green, bg = c.bg0 },

    -- ============================================================
    -- Plugin: Neo-tree
    -- ============================================================
    NeoTreeNormal = { fg = c.fg.secondary, bg = c.bg0 },
    NeoTreeNormalNC = { fg = c.fg.secondary, bg = c.bg0 },
    NeoTreeRootName = { fg = c.syntax.keyword, bold = true },
    NeoTreeDirectoryName = { fg = c.syntax["function"] },
    NeoTreeDirectoryIcon = { fg = c.purple },
    NeoTreeFileName = { fg = c.fg.secondary },
    NeoTreeFileIcon = { fg = c.fg.secondary },
    NeoTreeGitAdded = { fg = c.special.diff_add },
    NeoTreeGitModified = { fg = c.special.diff_change },
    NeoTreeGitDeleted = { fg = c.special.diff_delete },
    NeoTreeGitConflict = { fg = c.special.error },
    NeoTreeGitUntracked = { fg = c.light_grey },
    NeoTreeIndentMarker = { fg = c.bg.tertiary },
    NeoTreeWinSeparator = { fg = c.bg.tertiary, bg = c.bg0 },

    -- ============================================================
    -- Plugin: NERDTree
    -- ============================================================
    NERDTreeDir = { fg = c.syntax["function"] },
    NERDTreeDirSlash = { fg = c.syntax["function"] },
    NERDTreeOpenable = { fg = c.purple },
    NERDTreeClosable = { fg = c.purple },
    NERDTreeFile = { fg = c.white },
    NERDTreeExecFile = { fg = c.special.success, bold = true },
    NERDTreeUp = { fg = c.light_grey },
    NERDTreeCWD = { fg = c.syntax.keyword, bold = true },
    NERDTreeHelp = { fg = c.light_grey },
    NERDTreeToggleOn = { fg = c.special.success },
    NERDTreeToggleOff = { fg = c.special.error },
    NERDTreeFlags = { fg = c.purple },
    NERDTreeLinkFile = { fg = c.purple },
    NERDTreeLinkTarget = { fg = c.light_grey },
    NERDTreeLinkDir = { fg = c.purple },
    NERDTreeBookmarksHeader = { fg = c.syntax.keyword, bold = true },
    NERDTreeBookmarkName = { fg = c.purple },
    NERDTreeRO = { fg = c.special.warning },

    -- ============================================================
    -- Plugin: nvim-cmp
    -- ============================================================
    CmpItemAbbr = { fg = c.fg.secondary },
    CmpItemAbbrDeprecated = { fg = c.light_grey, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.special.warning, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.special.warning, bold = true },
    CmpItemKind = { fg = c.purple },
    CmpItemMenu = { fg = c.light_grey },
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
    CmpItemKindReference = { fg = c.purple },
    CmpItemKindSnippet = { fg = c.syntax.string },
    CmpItemKindStruct = { fg = c.syntax.type },
    CmpItemKindText = { fg = c.fg.secondary },
    CmpItemKindTypeParameter = { fg = c.syntax.type },
    CmpItemKindUnit = { fg = c.syntax.number },
    CmpItemKindValue = { fg = c.syntax.constant },
    CmpItemKindVariable = { fg = c.syntax.variable },

    -- ============================================================
    -- Plugin: indent-blankline
    -- ============================================================
    IndentBlanklineChar = { fg = c.bg.tertiary, nocombine = true },
    IndentBlanklineContextChar = { fg = c.light_grey, nocombine = true },
    IndentBlanklineContextStart = { sp = c.light_grey, underline = true },
    IblIndent = { fg = c.bg.tertiary, nocombine = true },
    IblScope = { fg = c.light_grey, nocombine = true },

    -- ============================================================
    -- Plugin: which-key
    -- ============================================================
    WhichKey = { fg = c.syntax.keyword },
    WhichKeyGroup = { fg = c.purple },
    WhichKeyDesc = { fg = c.fg.secondary },
    WhichKeySeparator = { fg = c.light_grey },
    WhichKeyFloat = { bg = c.bg0 },
    WhichKeyValue = { fg = c.light_grey },

    -- ============================================================
    -- Plugin: Lazy.nvim
    -- ============================================================
    LazyButton = { fg = c.fg.secondary, bg = c.bg0 },
    LazyButtonActive = { fg = c.black, bg = c.purple, bold = true },
    LazyComment = { fg = c.light_grey },
    LazyCommit = { fg = c.purple },
    LazyCommitIssue = { fg = c.syntax.number },
    LazyCommitScope = { fg = c.syntax.property },
    LazyCommitType = { fg = c.syntax.keyword },
    LazyDimmed = { fg = c.light_grey },
    LazyDir = { fg = c.syntax["function"] },
    LazyH1 = { fg = c.black, bg = c.purple, bold = true },
    LazyH2 = { fg = c.purple, bold = true },
    LazyNoCond = { fg = c.special.error },
    LazyNormal = { fg = c.fg.secondary, bg = c.bg0 },
    LazyProgressDone = { fg = c.special.success },
    LazyProgressTodo = { fg = c.light_grey },
    LazyProp = { fg = c.light_grey },
    LazyReasonCmd = { fg = c.syntax.keyword },
    LazyReasonEvent = { fg = c.syntax.number },
    LazyReasonFt = { fg = c.syntax.type },
    LazyReasonImport = { fg = c.syntax.keyword },
    LazyReasonKeys = { fg = c.syntax.string },
    LazyReasonPlugin = { fg = c.syntax["function"] },
    LazyReasonSource = { fg = c.syntax.property },
    LazyReasonStart = { fg = c.special.success },
    LazySpecial = { fg = c.purple },
    LazyTaskOutput = { fg = c.fg.secondary },
    LazyUrl = { fg = c.syntax["function"], underline = true },
    LazyValue = { fg = c.syntax.string },

    -- ============================================================
    -- Plugin: Mason
    -- ============================================================
    MasonHeader = { fg = c.black, bg = c.purple, bold = true },
    MasonHeaderSecondary = { fg = c.black, bg = c.syntax.keyword, bold = true },
    MasonHighlight = { fg = c.purple },
    MasonHighlightBlock = { fg = c.black, bg = c.purple },
    MasonHighlightBlockBold = { fg = c.black, bg = c.purple, bold = true },
    MasonHighlightSecondary = { fg = c.syntax.keyword },
    MasonMuted = { fg = c.light_grey },
    MasonMutedBlock = { fg = c.fg.secondary, bg = c.bg0 },

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
    NotifyDEBUGBorder = { fg = c.light_grey },
    NotifyTRACEBorder = { fg = c.syntax.type },
    NotifyERRORIcon = { fg = c.special.error },
    NotifyWARNIcon = { fg = c.special.warning },
    NotifyINFOIcon = { fg = c.special.info },
    NotifyDEBUGIcon = { fg = c.light_grey },
    NotifyTRACEIcon = { fg = c.syntax.type },
    NotifyERRORTitle = { fg = c.special.error },
    NotifyWARNTitle = { fg = c.special.warning },
    NotifyINFOTitle = { fg = c.special.info },
    NotifyDEBUGTitle = { fg = c.light_grey },
    NotifyTRACETitle = { fg = c.syntax.type },
    NotifyERRORBody = { fg = c.fg.secondary },
    NotifyWARNBody = { fg = c.fg.secondary },
    NotifyINFOBody = { fg = c.fg.secondary },
    NotifyDEBUGBody = { fg = c.fg.secondary },
    NotifyTRACEBody = { fg = c.fg.secondary },

    -- ============================================================
    -- Plugin: noice.nvim
    -- ============================================================
    NoiceCmdline = { fg = c.fg.secondary },
    NoiceCmdlineIcon = { fg = c.purple },
    NoiceCmdlineIconSearch = { fg = c.special.warning },
    NoiceCmdlinePopup = { fg = c.fg.secondary, bg = c.bg0 },
    NoiceCmdlinePopupBorder = { fg = c.purple },
    NoiceCmdlinePopupBorderSearch = { fg = c.special.warning },
    NoiceConfirm = { fg = c.fg.secondary, bg = c.bg0 },
    NoiceConfirmBorder = { fg = c.purple },
    NoiceMini = { fg = c.fg.secondary, bg = c.bg0 },
    NoicePopup = { fg = c.fg.secondary, bg = c.bg0 },
    NoicePopupBorder = { fg = c.purple },
    NoiceScrollbar = { bg = c.bg0 },
    NoiceScrollbarThumb = { bg = c.light_grey },

    -- ============================================================
    -- Plugin: bufferline.nvim
    -- ============================================================
    BufferLineFill = { bg = c.bg0 },
    BufferLineBackground = { fg = c.light_grey, bg = c.bg0 },
    BufferLineBuffer = { fg = c.light_grey, bg = c.bg0 },
    BufferLineBufferSelected = { fg = c.fg.secondary, bg = c.black, bold = true },
    BufferLineBufferVisible = { fg = c.fg.secondary, bg = c.bg.tertiary },
    BufferLineCloseButton = { fg = c.light_grey, bg = c.bg0 },
    BufferLineCloseButtonSelected = { fg = c.special.error, bg = c.black },
    BufferLineCloseButtonVisible = { fg = c.light_grey, bg = c.bg.tertiary },
    BufferLineIndicatorSelected = { fg = c.purple, bg = c.black },
    BufferLineIndicatorVisible = { fg = c.bg.tertiary, bg = c.bg.tertiary },
    BufferLineModified = { fg = c.special.warning, bg = c.bg0 },
    BufferLineModifiedSelected = { fg = c.special.warning, bg = c.black },
    BufferLineModifiedVisible = { fg = c.special.warning, bg = c.bg.tertiary },
    BufferLineSeparator = { fg = c.bg0, bg = c.bg0 },
    BufferLineSeparatorSelected = { fg = c.bg0, bg = c.black },
    BufferLineSeparatorVisible = { fg = c.bg0, bg = c.bg.tertiary },
    BufferLineTab = { fg = c.light_grey, bg = c.bg0 },
    BufferLineTabSelected = { fg = c.purple, bg = c.black, bold = true },
    BufferLineTabClose = { fg = c.special.error, bg = c.bg0 },

    -- ============================================================
    -- Plugin: lualine.nvim
    -- ============================================================
    lualine_a_normal = { fg = c.black, bg = c.syntax["function"], bold = true },
    lualine_b_normal = { fg = c.fg.secondary, bg = c.bg.tertiary },
    lualine_c_normal = { fg = c.fg.secondary, bg = c.bg0 },
    lualine_a_insert = { fg = c.black, bg = c.syntax.keyword, bold = true },
    lualine_a_visual = { fg = c.black, bg = c.syntax.type, bold = true },
    lualine_a_replace = { fg = c.black, bg = c.special.error, bold = true },
    lualine_a_command = { fg = c.black, bg = c.syntax.number, bold = true },
    lualine_a_inactive = { fg = c.light_grey, bg = c.bg0 },
    lualine_b_inactive = { fg = c.light_grey, bg = c.bg0 },
    lualine_c_inactive = { fg = c.light_grey, bg = c.bg0 },

    -- ============================================================
    -- Plugin: dashboard-nvim
    -- ============================================================
    DashboardHeader = { fg = c.syntax.keyword },
    DashboardCenter = { fg = c.purple },
    DashboardFooter = { fg = c.light_grey },
    DashboardShortCut = { fg = c.syntax["function"] },

    -- ============================================================
    -- Plugin: alpha-nvim
    -- ============================================================
    AlphaHeader = { fg = c.syntax.keyword },
    AlphaButtons = { fg = c.purple },
    AlphaShortcut = { fg = c.syntax["function"] },
    AlphaFooter = { fg = c.light_grey, italic = true },

    -- ============================================================
    -- Plugin: trouble.nvim
    -- ============================================================
    TroubleText = { fg = c.fg.secondary },
    TroubleCount = { fg = c.syntax.keyword, bg = c.bg.tertiary },
    TroubleNormal = { fg = c.fg.secondary, bg = c.bg0 },

    -- ============================================================
    -- Markdown
    -- ============================================================
    markdownH1 = { fg = c.syntax.keyword, bold = true },
    markdownH2 = { fg = c.syntax["function"], bold = true },
    markdownH3 = { fg = c.syntax.type, bold = true },
    markdownH4 = { fg = c.syntax.number, bold = true },
    markdownH5 = { fg = c.syntax.property, bold = true },
    markdownH6 = { fg = c.purple, bold = true },
    markdownCode = { fg = c.syntax.string, bg = c.bg0 },
    markdownCodeBlock = { fg = c.syntax.string },
    markdownBold = { bold = true },
    markdownItalic = { italic = true },
    markdownLinkText = { fg = c.purple, underline = true },
    markdownUrl = { fg = c.syntax["function"], underline = true },
  }
end

return M
