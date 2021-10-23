-- Dracula color scheme

vim.api.nvim_command("set background=dark")
vim.g.colors_name = "dracula"
local colors = require('devenv.colors').colors
local hil = require('devenv.colors.hil')

vim.g.terminal_color_0 = colors.back
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.purple
vim.g.terminal_color_5 = colors.pink
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.selection
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

--         Comment = { fg = M.colors.comment, style = "italic"},
--         DraculaSubtle = { bg = M.colors.subtle, fg = M.colors.subtle},

-- Group = {Foreground, Backgroud, Attribute, Special}
local dracula = {
    Normal = { colors.fg, colors.bg, nil, nil},
    NormalFloat = { colors.fg, colors.bg, nil, nil},
    Comment = { colors.comment, nil, "italic", nil},
    Constant = { colors.yellow, nil, nil, nil},
    String = { colors.yellow, nil, nil, nil},
    Character = { colors.green, nil, nil, nil},
    Number = { colors.orange, nil, nil, nil},
    Boolean = { colors.cyan, nil, nil, nil},
    Float = { colors.orange, nil, nil, nil},
    FloatBorder = { colors.white, nil, nil, nil},
    Operator = { colors.purple, nil, nil, nil},
    Keywords = { colors.cyan, nil, nil, nil},
    Identifier = { colors.cyan, nil, nil, nil},
    Function = { colors.yellow, nil, nil, nil},
    Statement = { colors.purple, nil, nil, nil},
    Conditional = { colors.pink, nil, nil, nil},
    Repeat = { colors.pink, nil, nil, nil},
    Label = { colors.cyan, nil, nil, nil},
    Exception = { colors.purple, nil, nil, nil},
    PreProc = { colors.yellow, nil, nil, nil},
    Include = { colors.purple, nil, nil, nil},
    Define = { colors.purple, nil, nil, nil},
    Title = { colors.cyan, nil, nil, nil},
    Macro = { colors.purple, nil, nil, nil},
    PreCondit = { colors.cyan, nil, nil, nil},
    Type = { colors.cyan, nil, nil, nil},
    StorageClass = { colors.pink, nil, nil, nil},
    Structure = { colors.yellow, nil, nil, nil},
    TypeDef = { colors.yellow, nil, nil, nil},
    Special = { colors.green, nil, nil, nil},
    SpecialComment = { colors.comment, nil, "italic", nil},
    Error = { colors.bright_red, nil, nil, nil},
    Todo = { colors.purple, nil, "bold,italic",  nil},
    Underlined = { colors.cyan, nil, "underline",  nil},

    ColorColumn = {nil, colors.ruler, nil, nil},
    Cursor = { nil, nil, "reverse",  nil},
    CursorLineNr = { colors.yellow, nil, "bold",  nil},
    SignColumn = { nil, colors.bg, nil, nil},
    Conceal = { colors.comment, nil, nil, nil},
    CursorColumn = { nil, colors.ruler, nil, nil},
    CursorLine = { nil, colors.ruler, nil, nil},

    StatusLine = { colors.white, colors.black, nil, nil},
    StatusLineNC = { colors.comment, nil, nil, nil},
    StatusLineTerm = { colors.white, colors.black, nil, nil},
    StatusLineTermNC = { colors.comment, nil, nil, nil},

    Directory = { colors.cyan, nil, nil, nil},
    DiffAdd = { colors.bg, colors.green, nil, nil},
    DiffChange = { colors.orange, nil, nil, nil},
    DiffDelete = { colors.red, nil, nil, nil},
    DiffText = { colors.comment, nil, nil, nil},

    ErrorMsg = { colors.bright_red, nil, nil, nil},
    VertSplit = { colors.black, nil, nil, nil},
    Folded = { colors.comment, nil, nil, nil},
    FoldColumn = { nil, nil, nil, nil},
    Search = { colors.black, colors.orange, nil, nil},
    IncSearch = { colors.orange, colors.comment, nil, nil},
    LineNr = { colors.violet1, colors.bg, nil, nil},
    MatchParen = { colors.fg, nil, "underline",  nil},
    NonText = { colors.nontext, nil, nil, nil},
    Pmenu = { colors.white, colors.grey1 , nil, nil},
    PmenuSel = { colors.menu, colors.violet, nil, nil},
    PmenuSbar = { nil, colors.bg, nil, nil},
    PmenuThumb = { nil, colors.selection, nil, nil},

    Question = { colors.purple, nil, nil, nil},
    QuickFixLine = { colors.black, colors.yellow, nil, nil},
    SpecialKey = { colors.nontext, nil, nil, nil},

    SpellBad = { colors.bright_red, nil, "underline",  nil},
    SpellCap = { colors.yellow, nil, nil, nil},
    SpellLocal = { colors.yellow, nil, nil, nil},
    SpellRare = { colors.yellow, nil, nil, nil},

    TabLine = { colors.comment, nil, nil, nil},
    TabLineSel = { colors.white, nil, nil, nil},
    TabLineFill = { nil, colors.bg, nil, nil},
    Terminal = { colors.white, colors.black, nil, nil},
    Visual = { nil, colors.visual, nil, nil},
    VisualNOS = { colors.visual, nil, nil, nil},
    WarningMsg = { colors.yellow, nil, nil, nil},
    WildMenu = { colors.black, colors.white, nil, nil},
    EndOfBuffer = { colors.subtle, colors.subtle, nil, nil},

    -- TreeSitter
    TSError = { colors.bright_red, nil, nil, nil},
    TSPunctDelimiter = { colors.fg, nil, nil, nil},
    TSPunctBracket = { colors.fg, nil, nil, nil},
    TSPunctSpecial = { colors.fg, nil, nil, nil},

    TSConstant = { colors.purple, nil, nil, nil},
    TSConstantBuiltin = { colors.purple, nil, nil, nil},

    TSConstMacro = { colors.cyan, nil, nil, nil},
    TSStringRegex = { colors.red, nil, nil, nil},
    TSString = { colors.yellow, nil, nil, nil},
    TSStringEscape = { colors.cyan, nil, nil, nil},
    TSCharacter = { colors.green, nil, nil, nil},
    TSNumber = { colors.purple, nil, nil, nil},
    TSBoolean = { colors.purple, nil, nil, nil},
    TSFloat = { colors.green, nil, nil, nil},
    TSAnnotation = { colors.yellow, nil, nil, nil},
    TSAttribute = { colors.cyan, nil, nil, nil},
    TSNamespace = { "#FF00FF",  nil, nil, nil},

    TSFuncBuiltin = { colors.cyan, nil, nil, nil},
    TSFunction = { colors.green, nil, nil, nil},
    TSFuncMacro = { colors.green, nil, nil, nil},
    TSParameter = { colors.orange, nil, nil, nil},
    TSParameterReference = { colors.orange, nil, nil, nil},
    TSMethod = { colors.green, nil, nil, nil},
    TSField = { colors.orange, nil, nil, nil},
    TSProperty = { colors.white, nil, nil, nil},
    TSConstructor = { colors.cyan, nil, nil, nil},


    TSConditional = { colors.pink, nil, nil, nil},
    TSRepeat = { colors.pink, nil, nil, nil},
    TSLabel = { colors.cyan, nil, nil, nil},

    TSKeyword = { colors.pink, nil, nil, nil},
    TSKeywordFunction = { colors.cyan, nil, nil, nil},
    TSKeywordOperator = { colors.pink, nil, nil, nil},
    TSOperator = { colors.pink, nil, nil, nil},
    TSException = { colors.purple, nil, nil, nil},
    TSType = { colors.pink, nil, nil, nil},
    TSTypeBuiltin = { colors.cyan, nil, "italic",  nil},
    TSStructure = { colors.purple, nil, nil, nil},
    TSSymbol = { nil, colors.grey1, nil, nil},
    TSInclude = { colors.pink, nil, nil, nil},


    TSVariable = { colors.fg, nil, nil, nil},
    TSVariableBuiltin = { colors.purple, nil, nil, nil},

    TSText = { colors.orange,  nil, nil, nil},
    TSStrong = { colors.orange,  nil, nil, nil},
    TSEmphasis = { colors.orange,  nil, nil, nil},
    TSUnderline = { colors.orange,  nil, nil, nil},
    TSTitle = { colors.orange,  nil, nil, nil},
    TSLiteral = { colors.orange,  nil, nil, nil},
    TSURI = { colors.orange,  nil, nil, nil},

    TSTag = { colors.cyan, nil, nil, nil},
    TSTagDelimiter = { colors.white, nil, nil, nil},

    -- HTML
    htmlArg = { colors.yellow, nil, nil, nil},
    htmlBold = { colors.yellow, nil, "bold",  nil},
    htmlEndTag = { colors.white, nil, nil, nil},
    htmlH1 = { colors.pink, nil, nil, nil},
    htmlH2 = { colors.pink, nil, nil, nil},
    htmlH3 = { colors.pink, nil, nil, nil},
    htmlH4 = { colors.pink, nil, nil, nil},
    htmlH5 = { colors.pink, nil, nil, nil},
    htmlH6 = { colors.pink, nil, nil, nil},
    htmlItalic = { colors.purple, nil, "italic",  nil},
    htmlLink = { colors.purple, nil, "underline",  nil},
    htmlSpecialChar = { colors.yellow, nil, nil, nil},
    htmlSpecialTagName = { colors.cyan, nil, nil, nil},
    htmlTag = { colors.pink, nil, nil, nil},
    htmlTagN = { colors.pink, nil, nil, nil},
    htmlTagName = { colors.cyan, nil, nil, nil},
    htmlTitle = { colors.white, nil, nil, nil},

    -- Markdown
    markdownBlockquote = { colors.yellow, nil, "italic",  nil},
    markdownBold = { colors.orange, nil, "bold",  nil},
    markdownCode = { colors.green, nil, nil, nil},
    markdownCodeBlock = { colors.orange, nil, nil, nil},
    markdownCodeDelimiter = { colors.red, nil, nil, nil},
    markdownH1 = { colors.pink, nil, "bold",  nil},
    markdownH2 = { colors.pink, nil, "bold",  nil},
    markdownH3 = { colors.pink, nil, "bold",  nil},
    markdownH4 = { colors.pink, nil, "bold",  nil},
    markdownH5 = { colors.pink, nil, "bold",  nil},
    markdownH6 = { colors.pink, nil, "bold",  nil},
    markdownHeadingDelimiter = { colors.red, nil, nil, nil},
    markdownHeadingRule = { colors.comment, nil, nil, nil},
    markdownId = { colors.purple, nil, nil, nil},
    markdownIdDeclaration = { colors.cyan, nil, nil, nil},
    markdownIdDelimiter = { colors.purple, nil, nil, nil},
    markdownItalic = { colors.yellow, nil, "italic",  nil},
    markdownLinkDelimiter = { colors.purple, nil, nil, nil},
    markdownLinkText = { colors.pink, nil, nil, nil},
    markdownListMarker = { colors.cyan, nil, nil, nil},
    markdownOrderedListMarker = { colors.red, nil, nil, nil},
    markdownRule = { colors.comment, nil, nil, nil},

    --  Diff
    diffAdded = { colors.green, nil, nil, nil},
    diffRemoved = { colors.red, nil, nil, nil},
    diffFileId = { colors.yellow, nil, "bold,reverse", nil},
    diffFile = { colors.nontext, nil, nil, nil},
    diffNewFile = { colors.green, nil, nil, nil},
    diffOldFile = { colors.red, nil, nil, nil},

    debugPc = { nil, colors.cyan, nil, nil},
    debugBreakpoint = { colors.red, nil, "reverse", nil},

    -- Git Signs
    GitSignsAdd = { colors.bright_green, nil, nil, nil},
    GitSignsChange = { colors.cyan, nil, nil, nil},
    GitSignsDelete = { colors.bright_red, nil, nil, nil},
    GitSignsAddLn = { colors.black, colors.bright_green, nil, nil},
    GitSignsChangeLn = { colors.black, colors.cyan, nil, nil},
    GitSignsDeleteLn = { colors.black, colors.bright_red, nil, nil},

    -- Telescope
    TelescopePromptBorder = { colors.green, nil, nil, nil},
    TelescopeResultsBorder = { colors.bright_blue, nil, nil, nil},
    TelescopePreviewBorder = { colors.pink, nil, nil, nil},
    TelescopeSelection = { colors.white, colors.ruler, nil, nil},
    TelescopeMultiSelection = { colors.purple, colors.ruler, nil, nil},
    TelescopeNormal = { colors.fg, colors.bg, nil, nil},
    TelescopeMatching = { colors.green, nil, nil, nil},
    TelescopePromptPrefix = { colors.purple, nil, nil, nil},

    -- NvimTree
    NvimTreeRootFolder = { colors.purple, nil, 'bold', nil},
    NvimTreeNormal  = { colors.bright_blue, nil, nil, nil},
    NvimTreeGitDirty = { colors.yellow, nil, nil, nil},
    NvimTreeGitNew = { colors.bright_green, nil, nil, nil},
    NvimTreeImageFile = { colors.pink, nil, nil, nil},
    NvimTreeFolderIcon = { colors.purple, nil, nil, nil},
    NvimTreeIndentMarker = { colors.nontext, nil, nil, nil},
    NvimTreeEmptyFolderName = { colors.comment, nil, nil, nil},
    NvimTreeFolderName = { colors.bright_blue, nil, nil, nil},
    NvimTreeSpecialFile = { colors.pink, nil, 'underline', nil},

    -- Bufferline
    BufferLineIndicatorSelected = { colors.purple , nil, nil, nil},
    BufferLineFill = { nil , colors.black, nil, nil},

    -- LSP
    LspDiagnosticsDefaultError = { colors.red, nil, nil, nil},
    LspDiagnosticsDefaultWarning = { colors.yellow, nil, nil, nil},
    LspDiagnosticsDefaultInformation = { colors.cyan, nil, nil, nil},
    LspDiagnosticsDefaultHint = { colors.cyan, nil, nil, nil},
    LspDiagnosticsUnderlineError = { colors.red, nil, "undercurl",  nil},
    LspDiagnosticsUnderlineWarning = { colors.yellow, nil, "undercurl",  nil},
    LspDiagnosticsUnderlineInformation = { colors.cyan, nil, "undercurl",  nil},
    LspDiagnosticsUnderlineHint = { colors.cyan, nil, "undercurl",  nil},
    LspReferenceText = { nil, colors.grey1, nil, nil},
    LspReferenceRead = { nil, colors.grey1, nil, nil},
    LspReferenceWrite = { nil, colors.grey1, nil, nil},
}
hil.colors(dracula)
