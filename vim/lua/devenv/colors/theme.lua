-- Dracula color scheme

vim.api.nvim_command("set background=dark")
local colors                         = require('devenv.colors').colors()
local hil                            = require('devenv.colors.hil')

local function mapcommon(clrs)
    clrs.error          = clrs.red
    clrs.link           = clrs.dark_blue
    clrs.ruler          = clrs.bright_grey2
    clrs.cursor         = clrs.ruler
    clrs.border         = clrs.ruler
    clrs.sidebar        = clrs.ruler

    clrs.active         = clrs.grey
    clrs.bg_alt         = clrs.black
    clrs.line_numbers   = clrs.brighter_paleblue
    clrs.text           = clrs.dark_white
    clrs.title          = clrs.aqua
    clrs.highlight      = clrs.grey
    clrs.selection      = clrs.grey
    clrs.disabled       = clrs.paleblue
    clrs.float          = clrs.bright_black
    clrs.menu           = clrs.bright_black
    clrs.accent         = clrs.dark_black
    clrs.nontext        = clrs.dark_grey
    clrs.visual         = clrs.dark_grey1
    clrs.gutter_fg      = clrs.grey1

    clrs.CurrentLine    = clrs.grey
    clrs.bg             = clrs.black
    clrs.subtle         = clrs.dark_black
    clrs.fg             = clrs.dark_white
    clrs.comment        = clrs.bright_grey1
    clrs.comments       = clrs.comment
end

mapcommon(colors)

vim.g.colors_name                    = colors.name

vim.g.terminal_color_0               = colors.black
vim.g.terminal_color_1               = colors.red
vim.g.terminal_color_2               = colors.green
vim.g.terminal_color_3               = colors.yellow
vim.g.terminal_color_4               = colors.purple
vim.g.terminal_color_5               = colors.pink
vim.g.terminal_color_6               = colors.cyan
vim.g.terminal_color_7               = colors.white
vim.g.terminal_color_8               = colors.selection
vim.g.terminal_color_9               = colors.bright_red
vim.g.terminal_color_11              = colors.bright_yellow
vim.g.terminal_color_12              = colors.bright_blue
vim.g.terminal_color_13              = colors.bright_magenta
vim.g.terminal_color_14              = colors.bright_cyan
vim.g.terminal_color_15              = colors.bright_white
vim.g.terminal_color_background      = colors.bg
vim.g.terminal_color_foreground      = colors.fg

-- Group                                 = {Foreground, Backgroud, Attribute, Special}
local editor = {
    CursorIM          = { fg = colors.cursor, style = 'reverse' }, -- like Cursor, but used when in IME mode
    ModeMsg           = { fg = colors.accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MoreMsg           = { fg = colors.accent }, -- |more-prompt|
    qfLineNr          = { fg = colors.highlight, bg = colors.title, style = 'reverse' }, -- Line numbers for quickfix lists
    TablineSel        = { fg = colors.bg, bg = colors.accent }, -- tab pages line, active tab page label
    Tabline           = { fg = colors.fg },
    Whitespace        = { fg = colors.selection }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    NormalMode        = { fg = colors.accent, style = 'reverse' }, -- Normal mode message in the cmdline
    InsertMode        = { fg = colors.green, style = 'reverse' }, -- Insert mode message in the cmdline
    ReplacelMode      = { fg = colors.red, style = 'reverse' }, -- Replace mode message in the cmdline
    VisualMode        = { bg = colors.selection, style = 'reverse' }, -- Visual mode message in the cmdline
    CommandMode       = { fg = colors.gray, style = 'reverse' }, -- Command mode message in the cmdline
    Warnings          = { fg = colors.yellow },

    healthError       = { fg = colors.error },
    healthSuccess     = { fg = colors.green },
    healthWarning     = { fg = colors.yellow },

    -- Dashboard
    DashboardShortCut = { fg = colors.red },
    DashboardHeader   = { fg = colors.comments },
    DashboardCenter   = { fg = colors.accent },
    DashboardFooter   = { fg = colors.green, style = 'italic' },
    Normal            = { colors.fg, colors.bg, nil, nil},
    NormalFloat       = { colors.fg, colors.bg, nil, nil},
    FloatBorder       = { colors.white, nil, nil, nil},

    ColorColumn       = { nil, colors.ruler, nil, nil},
    Cursor            = { nil, nil, "reverse",  nil},
    CursorLineNr      = { colors.yellow, nil, "bold",  nil},
    SignColumn        = { nil, colors.bg, nil, nil},
    Conceal           = { colors.comment, nil, nil, nil},
    CursorColumn      = { nil, colors.ruler, nil, nil},
    CursorLine        = { nil, colors.ruler, nil, nil},

    StatusLine        = { colors.white, colors.black, nil, nil},
    StatusLineNC      = { colors.comment, nil, nil, nil},
    StatusLineTerm    = { colors.white, colors.black, nil, nil},
    StatusLineTermNC  = { colors.comment, nil, nil, nil},

    Directory         = { colors.cyan, nil, nil, nil},
    DiffAdd           = { colors.bg, colors.green, nil, nil},
    DiffChange        = { colors.orange, nil, nil, nil},
    DiffDelete        = { colors.red, nil, nil, nil},
    DiffText          = { colors.comment, nil, nil, nil},

    ErrorMsg          = { colors.bright_red, nil, nil, nil},
    VertSplit         = { colors.black, nil, nil, nil},
    Folded            = { colors.comment, nil, nil, nil},
    Search            = { colors.black, colors.orange, nil, nil},
    IncSearch         = { colors.orange, colors.comment, nil, nil},
    LineNr            = { colors.line_numbers, colors.bg, nil, nil},
    MatchParen        = { colors.fg, nil, "underline",  nil},
    NonText           = { colors.nontext, nil, nil, nil},
    Pmenu             = { colors.white, colors.dark_grey , nil, nil},
    PmenuSel          = { colors.menu, colors.violet, nil, nil},
    PmenuSbar         = { nil, colors.bg, nil, nil},
    PmenuThumb        = { nil, colors.selection, nil, nil},

    Question          = { colors.purple, nil, nil, nil},
    QuickFixLine      = { colors.black, colors.yellow, nil, nil},
    SpecialKey        = { colors.nontext, nil, nil, nil},

    SpellBad          = { colors.bright_red, nil, "underline",  nil},
    SpellCap          = { colors.yellow, nil, nil, nil},
    SpellLocal        = { colors.yellow, nil, nil, nil},
    SpellRare         = { colors.yellow, nil, nil, nil},

    TabLine           = { colors.comment, nil, nil, nil},
    TabLineSel        = { colors.white, nil, nil, nil},
    TabLineFill       = { nil, colors.bg, nil, nil},
    Terminal          = { colors.white, colors.black, nil, nil},
    Visual            = { nil, colors.selection, nil, nil},
    VisualNOS         = { nil, colors.selection, nil, nil},
    WarningMsg        = { colors.yellow, nil, nil, nil},
    WildMenu          = { colors.black, colors.white, nil, nil},
    EndOfBuffer       = { colors.subtle, colors.subtle, nil, nil},
    htmlLink           = { fg = colors.link, style = 'underline' },
}
hil.colors(editor)

local html = {
    htmlLink           = { fg = colors.link, style = 'underline' },
    htmlH1             = { fg = colors.cyan, style = 'bold' },
    htmlH2             = { fg = colors.red, style = 'bold' },
    htmlH3             = { fg = colors.green, style = 'bold' },
    htmlH4             = { fg = colors.yellow, style = 'bold' },
    htmlH5             = { fg = colors.purple, style = 'bold' },
    htmlH6             = { colors.pink, nil, nil, nil},
    htmlArg            = { colors.yellow, nil, nil, nil},
    htmlBold           = { colors.yellow, nil, "bold",  nil},
    htmlEndTag         = { colors.white, nil, nil, nil},
    htmlItalic         = { colors.purple, nil, "italic",  nil},
    htmlSpecialChar    = { colors.yellow, nil, nil, nil},
    htmlSpecialTagName = { colors.cyan, nil, nil, nil},
    htmlTag            = { colors.pink, nil, nil, nil},
    htmlTagN           = { colors.pink, nil, nil, nil},
    htmlTagName        = { colors.cyan, nil, nil, nil},
    htmlTitle          = { colors.white, nil, nil, nil},
}
hil.colors(html)

local markdown = {
    markdownH1Delimiter       = { fg = colors.cyan },
    markdownH2Delimiter       = { fg = colors.red },
    markdownH3Delimiter       = { fg = colors.green },

    markdownBlockquote        = { colors.yellow, nil, "italic",  nil},
    markdownBold              = { colors.orange, nil, "bold",  nil},
    markdownCode              = { colors.green, nil, nil, nil},
    markdownCodeBlock         = { colors.orange, nil, nil, nil},
    markdownCodeDelimiter     = { colors.red, nil, nil, nil},
    markdownH1                = { fg = colors.cyan, style = 'bold' },
    markdownH2                = { fg = colors.red, style = 'bold' },
    markdownH3                = { fg = colors.green, style = 'bold' },
    markdownH4                = { colors.blue, nil, "bold",  nil},
    markdownH5                = { colors.purple, nil, "bold",  nil},
    markdownH6                = { colors.grey, nil, "bold",  nil},
    markdownHeadingDelimiter  = { colors.red, nil, nil, nil},
    markdownHeadingRule       = { colors.comment, nil, nil, nil},
    markdownId                = { colors.purple, nil, nil, nil},
    markdownIdDeclaration     = { colors.cyan, nil, nil, nil},
    markdownIdDelimiter       = { colors.purple, nil, nil, nil},
    markdownItalic            = { colors.yellow, nil, "italic",  nil},
    markdownLinkDelimiter     = { colors.purple, nil, nil, nil},
    markdownLinkText          = { colors.pink, nil, nil, nil},
    markdownListMarker        = { colors.cyan, nil, nil, nil},
    markdownOrderedListMarker = { colors.red, nil, nil, nil},
    markdownRule              = { colors.comment, nil, nil, nil},
}
hil.colors(markdown)

local syntax = {
    Macro           = { colors.purple, nil, nil, nil},
    StorageClass    = { colors.pink, nil, nil, nil},
    Structure       = { colors.yellow, nil, nil, nil},
    Special         = { colors.green, nil, nil, nil},
    SpecialComment  = { colors.gray, nil, "italic", nil},
    Comment         = { colors.comment, nil, "italic", nil},
    Type            = { fg = colors.pink, style = "italic" }, -- int, long, char, etc.
    Constant        = { fg = colors.bright_salmon }, -- any constant
    Character       = { fg = colors.cyan }, -- any character constant: 'c', '\n'
    Number          = { fg = colors.darker_blue }, -- a number constant: 5
    Boolean         = { fg = colors.blue }, -- a boolean constant: TRUE, false
    Float           = { fg = colors.aqua}, -- a floating point constant: 2.3e10
    Statement       = { fg = colors.pink }, -- any statement
    Label           = { fg = colors.green }, -- case, default, etc.
    Operator        = { fg = colors.cyan }, -- sizeof", "+", "*", etc.
    Exception       = { fg = colors.cyan }, -- try, catch, throw
    PreProc         = { fg = colors.purple }, -- generic Preprocessor
    Include         = { fg = colors.pink }, -- preprocessor #include
    Define          = { fg = colors.pink }, -- preprocessor #define
    TypeDef         = { colors.yellow, nil, "italic", nil},
    Typedef         = { fg = colors.yellow, style = "italic" }, -- A typedef
    PreCondit       = { fg = colors.cyan }, -- preprocessor #if, #else, #endif, etc.
    SpecialChar     = { fg = colors.pink }, -- special character in a constant
    Tag             = { fg = colors.red }, -- you can use CTRL-] on this
    Delimiter       = { fg = colors.cyan }, -- character that needs attention like , or .
    Debug           = { fg = colors.red }, -- debugging statements
    Underlined      = { fg = colors.link, style = 'underline' }, -- text that stands out, HTML links
    Ignore          = { fg = colors.disabled }, -- left blank, hidden
    Error           = { fg = colors.error, style = 'bold,underline' }, -- any erroneous construct
    Todo            = { fg = colors.yellow, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
    Conditional     = { fg = colors.dark_pink , style = "italic"}, -- normal if, then, else, endif, switch, etc.
    Keywords        = { colors.cyan, nil, nil, nil},
    Keyword         = { fg = colors.dark_yellow, style = "italic" }, -- normal for, do, while, etc.
    Repeat          = { fg = colors.bright_violet, style = "bold,italic" }, -- normal any other keyword

    Function        = { fg = colors.bright_blue, style = 'italic' }, -- italic funtion names
    Identifier      = { fg = colors.fg }, -- any variable name

    String          = { fg = colors.yellow }, -- any string
    helpExample     = { colors.beige, nil, "italic", nil}
}
hil.colors(syntax)

local treesitter = {
    TSAnnotation         = { colors.yellow, nil, nil, nil},
    TSAttribute          = { fg = colors.yellow }, -- (unstable) TODO: docs
    TSConstructor        = { fg = colors.purple }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    TSConstBuiltin       = { fg = colors.bright_red }, -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro         = { fg = colors.purple }, -- For constants that are defined by macros: `NULL` in C.
    TSField              = { fg = colors.bright_orange }, -- For fields.
    TSFuncMacro          = { fg = colors.blue }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSKeywordOperator    = { fg = colors.red }, -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
    TSKeywordReturn      = { fg = colors.cyan },
    TSNamespace          = { fg = colors.yellow }, -- For identifiers referring to modules and namespaces.
    TSParameter          = { fg = colors.beige }, -- For parameters of a function.
    TSParameterReference = { fg = colors.beige }, -- For references to parameters of a function.
    TSProperty           = { fg = colors.bright_white }, -- Same as `TSField`,accesing for struct members in C.
    TSPunctDelimiter     = { fg = colors.cyan }, -- For delimiters ie: `.`
    TSPunctBracket       = { fg = colors.cyan }, -- For brackets and parens.
    TSPunctSpecial       = { fg = colors.cyan }, -- For special punctutation that does not fall in the catagories before.
    TSStringRegex        = { fg = colors.blue }, -- For regexes.
    TSStringEscape       = { fg = colors.disabled }, -- For escape characters within a string.
    TSSymbol             = { fg = colors.yellow }, -- For identifiers referring to symbols or atoms.
    TSStrong             = { fg = colors.paleblue, style = 'bold' }, -- Text to be represented in bold.
    TSTagDelimiter       = { fg = colors.cyan }, -- Tag delimiter like `<` `>` `/`
    TSTagAttribute       = { fg = colors.gray }, -- HTML tag attributes.
    TSText               = { fg = colors.fg }, -- For strings considered text in a markup language.
    TSTextReference      = { fg = colors.yellow }, -- FIXME
    TSEmphasis           = { fg = colors.paleblue }, -- For text to be represented with emphasis.
    TSUnderline          = { fg = colors.fg, style = 'underline' }, -- For text to be represented with an underline.
    TSStrike             = { }, -- For strikethrough text.
    TSTitle              = { fg = colors.title, style = 'bold' }, -- Text that is part of a title.
    TSLiteral            = { fg = colors.fg }, -- Literal text.
    TSURI                = { fg = colors.link }, -- Any URI like a link or email.
    TSMath               = { fg = colors.blue }, -- Math environments like LaTeX's `$ ... $`
    TSType               = { fg = colors.bright_violet, style = "italic" }, --Custom types
    --TSNone             = { }, -- TODO: docs


    TSString             = { fg = colors.yellow }, -- For strings.

    TSKeywordFunction    = { fg = colors.purple, style = "italic"}, -- For keywords used to define a fuction.
    TSFuncBuiltin        = { fg = colors.cyan, style = 'italic' }, -- For builtin functions: `table.insert` in Lua.
    TSVariable           = { fg = colors.fg }, -- Any variable name that does not have another highlight.
    TSVariableBuiltin    = { fg = colors.brighter_paleblue }, -- Variable names that are defined by the languages, like `this` or `self`.

    TSConstantBuiltin    = "TSConstBuiltin",
    TSFloat              = "Float", -- For floats.
    TSStructure          = "Structure",
    TSBoolean            = "Boolean", -- For booleans.
    TSCharacter          = "Character", -- For characters.
    TSConstant           = "Constant", -- For constants
    TSError              = "Error", -- For syntax/parser errors.
    TSException          = "Exception", -- For exception related keywords.
    TSInclude            = "Include", -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSLabel              = "Label", -- For labels: `label:` in C and `:label:` in Lua.
    TSNumber             = "Number", -- For all numbers
    TSOperator           = "Operator", -- For any operator: `+`, but also `->` and `*` in C.
    TSTypeBuiltin        = "Type", -- For builtin types.
    TSTag                = "Tag", -- Tags like html tag names.
    TSComment            = "Comment", -- For comment blocks.
    TSConditional        = "Conditional", -- For keywords related to conditionnals.
    TSKeyword            = "Keyword", -- For keywords that don't fall in previous categories.
    TSRepeat             = "Repeat", -- For keywords related to loops.
    TSFunction           = "Function", -- For fuction (calls and definitions).
    TSMethod             = "Function", -- For method calls and definitions.

    --vim help
    helpHyperTextJump    = "Function"
}
hil.colors(treesitter)

local lsp = {
    LspDiagnosticsDefaultError           = { fg = colors.error }, -- used for "Error" diagnostic virtual text
    LspDiagnosticsSignError              = { fg = colors.error }, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError          = { fg = colors.error }, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextError       = { fg = colors.error }, -- Virtual text "Error"
    LspDiagnosticsUnderlineError         = { style = 'undercurl', sp = colors.error }, -- used to underline "Error" diagnostics.
    LspDiagnosticsDefaultWarning         = { fg = colors.yellow }, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning            = { fg = colors.yellow }, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning        = { fg = colors.yellow }, -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextWarning     = { fg = colors.yellow }, -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning       = { style = 'undercurl', sp = colors.yellow }, -- used to underline "Warning" diagnostics.
    LspDiagnosticsDefaultInformation     = { fg = colors.paleblue }, -- used for "Information" diagnostic virtual text
    LspDiagnosticsSignInformation        = { fg = colors.paleblue },  -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation    = { fg = colors.paleblue }, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextInformation = { fg = colors.paleblue }, -- Virtual text "Information"
    LspDiagnosticsUnderlineInformation   = { style = 'undercurl', sp = colors.paleblue }, -- used to underline "Information" diagnostics.
    LspDiagnosticsDefaultHint            = { fg = colors.purple  },  -- used for "Hint" diagnostic virtual text
    LspDiagnosticsSignHint               = { fg = colors.purple  }, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsFloatingHint           = { fg = colors.purple  }, -- used for "Hint" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextHint        = { fg = colors.purple  }, -- Virtual text "Hint"
    LspDiagnosticsUnderlineHint          = { style = 'undercurl', sp = colors.paleblue }, -- used to underline "Hint" diagnostics.
    LspReferenceText                     = { bg = colors.highlight }, -- used for highlighting "text" references
    LspReferenceRead                     = { bg = colors.highlight }, -- used for highlighting "read" references
    LspReferenceWrite                    = { bg = colors.highlight }, -- used for highlighting "write" references

    DiagnosticVirtualTextWarn  = { link = "LspDiagnosticsVirtualTextWarning" },
    DiagnosticUnderlineWarn    = { link = "LspDiagnosticsUnderlineWarning" },
    DiagnosticFloatingWarn     = { link = "LspDiagnosticsFloatingWarning" },
    DiagnosticSignWarn         = { link = "LspDiagnosticsSignWarning" },
    DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
    DiagnosticUnderlineError   = { link = "LspDiagnosticsUnderlineError" },
    DiagnosticFloatingError    = { link = "LspDiagnosticsFloatingError" },
    DiagnosticSignError        = { link = "LspDiagnosticsSignError" },
    DiagnosticVirtualTextInfo  = { link = "LspDiagnosticsVirtualTextInformation" },
    DiagnosticUnderlineInfo    = { link = "LspDiagnosticsUnderlineInformation" },
    DiagnosticFloatingInfo     = { link = "LspDiagnosticsFloatingInformation" },
    DiagnosticSignInfo         = { link = "LspDiagnosticsSignInformation" },
    DiagnosticVirtualTextHint  = { link = "LspDiagnosticsVirtualTextHint" },
    DiagnosticUnderlineHint    = { link = "LspDiagnosticsUnderlineHint" },
    DiagnosticFloatingHint     = { link = "LspDiagnosticsFloatingHint" },
    DiagnosticSignHint         = { link = "LspDiagnosticsSignHint" },
}
hil.colors(lsp)

local plugins = {

    -- LspTrouble
    LspTroubleText                = { fg = colors.text },
    LspTroubleCount               = { fg = colors.purple, bg = colors.active },
    LspTroubleNormal              = { fg = colors.fg, bg = colors.sidebar },

    -- Diff
    diffAdded                  = { fg = colors.green },
    diffRemoved                = { fg = colors.red },
    diffChanged                = { fg = colors.blue },
    diffOldFile                = { fg = colors.text },
    diffNewFile                = { fg = colors.title },
    diffFile                   = { fg = colors.gray },
    diffLine                   = { fg = colors.cyan },
    diffIndexLine              = { fg = colors.purple },

    -- Below are possible syntax for git and diff so please dont remove
    -- diffOnly                = {},
    -- diffIdentical           = {},
    -- diffDiffer              = {},
    -- diffBDiffer             = {},
    -- diffIsA                 = {},
    -- diffNoEOL               = {},
    -- diffCommon              = {},
    -- diffSubname             = {},
    -- diffComment             = {},
    gitcommitDiff              = {},
    gitcommitFirstLine         = {colors.pink, nil, "bold", nil},
    gitcommitSummary           = {colors.pink, nil, "bold", nil},
    -- gitcommitOverflow       = {},
    -- gitcommitBlank          = {},
    gitcommitComment           = "Comment",
    -- gitcommitHead           = {},
    -- gitcommitBranch         = {},
    -- gitcommitOnBranch       = {},
    -- gitcommitNoBranch       = {},
    gitcommitHeader            = {colors.dark_orange, nil, "bold", nil},
    gitcommitAuthor            = {colors.cyan, nil, "italic", nil},
    -- gitcommitNoChanges      = {},
    gitcommitUntracked         = {colors.pink, nil, "bold", nil},
    gitcommitUntrackedFile     = {colors.pink, nil, "italic", nil},
    gitcommitSelected          = {colors.dark_green, nil, "bold", nil},
    gitcommitSelectedType      = {colors.green, nil, "bold", nil},
    gitcommitSelectedFile      = {colors.green, nil, 'italic', nil},
    gitcommitDiscarded         = {colors.dark_violet, nil, 'bold', nil},
    gitcommitDiscardedType     = {colors.violet, nil, 'bold', nil},
    gitcommitDiscardedFile     = {colors.violet, nil, 'italic', nil},
    gitcommitUnmerged          = {colors.dark_red, nil, 'bold', nil},
    gitcommitUnmergedType      = {colors.red, nil, 'bold', nil},
    gitcommitUnmergedFile      = {colors.red, nil, 'italic', nil},
    -- gitcommitDiscardedArrow = {},
    -- gitcommitSelectedArrow  = {},
    -- gitcommitUnmergedArrow  = {},
    gitcommitWarning           = {colors.dark_orange, nil, 'bold', nil},

    -- Neogit
    NeogitBranch                  = { fg = colors.paleblue },
    NeogitRemote                  = { fg = colors.purple },
    NeogitHunkHeader              = { fg = colors.fg, bg = colors.highlight },
    NeogitHunkHeaderHighlight     = { fg = colors.blue, bg = colors.contrast },
    NeogitDiffContextHighlight    = { fg = colors.text, bg = colors.contrast },
    NeogitDiffDeleteHighlight     = { fg = colors.red },
    NeogitDiffAddHighlight        = { fg = colors.green },

    -- GitGutter
    GitGutterAdd                  = { fg = colors.green }, -- diff mode: Added line |diff.txt|
    GitGutterChange               = { fg = colors.blue }, -- diff mode: Changed line |diff.txt|
    GitGutterDelete               = { fg = colors.red }, -- diff mode: Deleted line |diff.txt|

    -- Git Signs
    GitSignsAdd                   = { colors.bright_green, nil, nil, nil},
    GitSignsChange                = { colors.cyan, nil, nil, nil},
    GitSignsDelete                = { colors.bright_red, nil, nil, nil},
    GitSignsAddLn                 = { colors.bright_green, nil, nil, nil},
    GitSignsChangeLn              = { colors.cyan, nil, nil, nil},
    GitSignsDeleteLn              = { colors.bright_red, nil, nil, nil},

    -- Telescope
    TelescopePromptBorder         = { colors.green, nil, nil, nil},
    TelescopeResultsBorder        = { colors.bright_blue, nil, nil, nil},
    TelescopePreviewBorder        = { colors.pink, nil, nil, nil},
    TelescopeSelection            = { colors.white, colors.ruler, nil, nil},
    TelescopeMultiSelection       = { colors.purple, colors.ruler, nil, nil},
    TelescopeNormal               = { colors.fg, colors.bg, nil, nil},
    TelescopeMatching             = { colors.green, nil, nil, nil},
    TelescopePromptPrefix         = { colors.purple, nil, nil, nil},
    TelescopeSelectionCaret       = { fg = colors.purple },

    -- NvimTree
    NvimTreeRootFolder            = { fg = colors.fg, style = 'italic' },
    NvimTreeFolderName            = { fg = colors.text },
    NvimTreeFolderIcon            = { fg = colors.accent, bg = colors.sidebar },
    NvimTreeEmptyFolderName       = { fg = colors.disabled },
    NvimTreeOpenedFolderName      = { fg = colors.beige, style = 'italic' },
    NvimTreeIndentMarker          = { fg = colors.disabled },
    NvimTreeGitDirty              = { fg = colors.blue },
    NvimTreeGitNew                = { fg = colors.green },
    NvimTreeGitStaged             = { fg = colors.comments },
    NvimTreeGitDeleted            = { fg = colors.red },
    NvimTreeOpenedFile            = { fg = colors.beige },
    NvimTreeImageFile             = { fg = colors.yellow },
    NvimTreeMarkdownFile          = { fg = colors.pink },
    NvimTreeExecFile              = { fg = colors.green },
    NvimTreeSpecialFile           = { fg = colors.purple , style = 'underline' },
    LspDiagnosticsError           = { fg = colors.error },
    LspDiagnosticsWarning         = { fg = colors.yellow },
    LspDiagnosticsInformation     = { fg = colors.paleblue },
    LspDiagnosticsHint            = { fg = colors.purple },

    -- WhichKey
    WhichKey                      = { fg = colors.accent , style = 'bold'},
    WhichKeyGroup                 = { fg = colors.text },
    WhichKeyDesc                  = { fg = colors.blue, style = 'italic' },
    WhichKeySeperator             = { fg = colors.fg },
    WhichKeyFloating              = { bg = colors.float },
    WhichKeyFloat                 = { bg = colors.float },

    -- LspSaga
    LspFloatWinNormal             = { fg = colors.text, bg = colors.bg },
    LspFloatWinBorder             = { fg = colors.purple },
    DiagnosticError               = { fg = colors.error },
    DiagnosticWarning             = { fg = colors.yellow },
    DiagnosticInformation         = { fg = colors.paleblue },
    DiagnosticHint                = { fg = colors.purple },
    LspSagaDiagnosticBorder       = { fg = colors.gray },
    LspSagaDiagnosticHeader       = { fg = colors.blue },
    LspSagaDiagnosticTruncateLine = { fg = colors.border },
    LspLinesDiagBorder            = { fg = colors.contrast },
    ProviderTruncateLine          = { fg = colors.border },
    LspSagaShTruncateLine         = { fg = colors.border },
    LspSagaDocTruncateLine        = { fg = colors.border },
    LineDiagTruncateLine          = { fg = colors.border },
    LspSagaBorderTitle            = { fg = colors.cyan },
    LspSagaHoverBorder            = { fg = colors.paleblue },
    LspSagaRenameBorder           = { fg = colors.green },
    LspSagaDefPreviewBorder       = { fg = colors.green },
    LspSagaCodeActionTitle        = { fg = colors.paleblue },
    LspSagaCodeActionContent      = { fg = colors.purple },
    LspSagaCodeActionBorder       = { fg = colors.blue },
    LspSagaCodeActionTruncateLine = { fg = colors.border },
    LspSagaSignatureHelpBorder    = { fg = colors.pink },
    LspSagaFinderSelection        = { fg = colors.green },
    -- LspSagaAutoPreview         = { fg = colors.red },
    ReferencesCount               = { fg = colors.purple },
    DefinitionCount               = { fg = colors.purple },
    DefinitionPreviewTitle        = { fg = colors.green },
    DefinitionIcon                = { fg = colors.blue },
    ReferencesIcon                = { fg = colors.blue },
    TargetWord                    = { fg = colors.cyan },

    -- BufferLine
    BufferLineIndicatorSelected   = { fg = colors.accent },
    BufferLineFill                = { bg = colors.bg },

    -- Sneak
    Sneak                         = { fg = colors.bg, bg = colors.accent },
    SneakScope                    = { bg = colors.selection },

    -- Indent Blankline
    IndentBlanklineChar           = { fg = colors.highlight },
    IndentBlanklineContextChar    = { fg = colors.fg },

    -- Nvim dap
    DapBreakpoint                 = { fg = colors.red },
    DapStopped                    = { fg = colors.green },

    -- Illuminate
    illuminatedWord               = { bg = colors.highight },
    illuminatedCurWord            = { bg = colors.highight },

    -- Hop
    HopNextKey                    = { fg = colors.accent, style = 'bold' },
    HopNextKey1                   = { fg = colors.purple, style = 'bold' },
    HopNextKey2                   = { fg = colors.blue },
    HopUnmatched                  = { fg = colors.comments },

    -- Fern
    FernBranchText                = { fg = colors.blue },
    NvimTreeNormal                = { fg = colors.comments},

    -- debug/dap
    debugPc         = { nil, colors.cyan, nil, nil},
    debugBreakpoint = { colors.red, nil, "reverse", nil},
}
hil.colors(plugins)
