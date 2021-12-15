-- Dracula color scheme

vim.api.nvim_command("set background=dark")
local colors                         = require('devenv.colors').colors()
local hil                            = require('devenv.colors.hil')

local function mapcommon(clrs)
    clrs.error          = clrs.bright_red
    clrs.link           = clrs.purple
    clrs.ruler          = clrs.dark_grey
    clrs.cursor         = clrs.ruler
    clrs.border         = clrs.ruler
    clrs.sidebar        = clrs.ruler

    clrs.active         = clrs.grey
    clrs.bg_alt         = clrs.black
    clrs.line_numbers   = clrs.bright_paleblue
    clrs.text           = clrs.dark_white
    clrs.title          = clrs.aqua
    clrs.highlight      = clrs.brighter_grey2
    clrs.selection      = clrs.grey
    clrs.disabled       = clrs.paleblue
    clrs.float          = clrs.bright_black
    clrs.menu           = clrs.bright_grey2
    clrs.accent         = clrs.dark_black
    clrs.nontext        = clrs.bright_grey
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

local M = {}

M.apply = function()
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
        ModeMsg           = { fg = colors.accent }, -- 'showmode' message (e.g., "-- INSERT -- ")
        MoreMsg           = { fg = colors.accent }, -- |more-prompt|
        qfLineNr          = { fg = colors.highlight, bg = colors.title, style = 'reverse' }, -- Line numbers for quickfix lists
        TablineSel        = { fg = colors.bg, bg = colors.accent }, -- tab pages line, active tab page label
        Tabline           = { fg = colors.fg },
        Whitespace        = { fg = colors.nontext }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        NormalMode        = { fg = colors.accent, style = 'reverse' }, -- Normal mode message in the cmdline
        InsertMode        = { fg = colors.green, style = 'reverse' }, -- Insert mode message in the cmdline
        ReplacelMode      = { fg = colors.red, style = 'reverse' }, -- Replace mode message in the cmdline
        VisualMode        = { bg = colors.selection, style = 'reverse' }, -- Visual mode message in the cmdline
        CommandMode       = { fg = colors.gray, style = 'reverse' }, -- Command mode message in the cmdline
        Warnings          = { fg = colors.yellow },

        healthError       = { fg = colors.error },
        healthSuccess     = { fg = colors.green },
        healthWarning     = { fg = colors.yellow },

        Normal            = { colors.fg, colors.bg, nil, nil},
        -- NormalNC          = { nil, colors.grey1, nil, nil},
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

        Pmenu             = { colors.white, colors.menu, nil, nil},
        PmenuSel          = { nil, colors.dark_paleblue, nil, nil},
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
        FoldColumn        = { nil, nil, nil, nil},
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
        markdownH1Delimiter       = "htmlH1",
        markdownH2Delimiter       = "htmlH2",
        markdownH3Delimiter       = "htmlH3",
        markdownH4Delimiter       = "htmlH4",
        markdownH5Delimiter       = "htmlH5",
        markdownH6Delimiter       = "htmlH6",

        markdownBlockquote        = { colors.yellow, nil, "italic",  nil},
        markdownBold              = { colors.orange, nil, "bold",  nil},
        markdownCode              = { colors.green, nil, nil, nil},
        markdownCodeBlock         = { colors.orange, nil, nil, nil},
        markdownCodeDelimiter     = { colors.red, nil, nil, nil},
        markdownH1                = "htmlH1",
        markdownH2                = "htmlH2",
        markdownH3                = "htmlH3",
        markdownH4                = "htmlH4",
        markdownH5                = "htmlH5",
        markdownH6                = "htmlH6",
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
        Title             = { colors.cyan, nil, nil, nil},
        Macro             = { colors.purple, nil, nil, nil},
        StorageClass      = { colors.pink, nil, nil, nil},
        Structure         = { colors.purple, nil, nil, nil},
        Special           = { colors.green, nil, nil, nil},
        SpecialComment    = { colors.comment, nil, 'italic', nil},
        Comment           = { colors.comment, nil, "italic", nil},
        Type              = { colors.cyan, nil, 'italic', nil}, -- int, long, char, etc.
        Constant          = { colors.purple, nil, nil, nil},
        Character         = { colors.green, nil, nil, nil}, -- any character constant: 'c', '\n'
        Number            = { colors.purple, nil, nil, nil}, -- a number constant: 5
        Boolean           = { colors.purple, nil, nil, nil}, -- a boolean constant: TRUE, false
        Float             = { fg = colors.aqua}, -- a floating point constant: 2.3e10
        Statement         = { colors.purple, nil, nil, nil},
        Label             = { colors.cyan, nil, nil, nil},
        Operator          = { colors.pink, nil, nil, nil}, -- sizeof", "+", "*", etc.
        Exception         = { colors.purple, nil, nil, nil}, -- try, catch, throw
        PreProc           = { fg = colors.purple }, -- generic Preprocessor
        Include           = { colors.pink, nil, nil, nil}, -- preprocessor #include
        Define            = { fg = colors.pink }, -- preprocessor #define
        TypeDef           = { colors.yellow, nil, "italic", nil},
        Typedef           = { fg = colors.yellow, style = "italic" }, -- A typedef
        PreCondit         = { fg = colors.cyan }, -- preprocessor #if, #else, #endif, etc.
        SpecialChar       = { fg = colors.pink }, -- special character in a constant
        Tag               = { colors.cyan, nil, nil, nil}, -- you can use CTRL-] on this
        Delimiter         = { fg = colors.cyan }, -- character that needs attention like , or .
        Debug             = { fg = colors.red }, -- debugging statements
        Underlined        = { fg = colors.link, style = 'underline' }, -- text that stands out, HTML links
        Ignore            = { fg = colors.disabled }, -- left blank, hidden
        Error             = { fg = colors.error, style = 'bold,underline' }, -- any erroneous construct
        Todo              = { fg = colors.black, bg = colors.yellow, style = 'bold,italic' }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        Conditional       = { fg = colors.dark_pink , style = "italic"}, -- normal if, then, else, endif, switch, etc.
        Keywords          = { colors.cyan, nil, nil, nil},
        Keyword           = { colors.pink, nil, 'italic', nil}, -- normal for, do, while, etc.
        Repeat            = { fg = colors.bright_violet, style = "bold,italic" }, -- normal any other keyword

        Function          = { fg = colors.green, style = 'italic' }, -- italic funtion names
        Identifier        = { fg = colors.cyan }, -- any variable name

        String            = { fg = colors.yellow }, -- any string
        MatchParen        = { style = 'bold,reverse'},

        --vim help
        helpExample       = { colors.beige, nil, "italic", nil},
        helpHyperTextJump = { colors.cyan, nil, "italic", nil},
    }
    hil.colors(syntax)

    local treesitter = {
        TSAnnotation         = { colors.yellow, nil, nil, nil},
        TSAttribute          = { colors.cyan, nil, nil, nil},
        TSConstructor        = { colors.cyan, nil, nil, nil},
        TSConstBuiltin       = { colors.purple, nil, nil, nil},
        TSConstMacro         = { colors.cyan, nil, nil, nil},
        TSField              = { colors.orange, nil, nil, nil},
        TSKeywordOperator    = { colors.pink, nil, nil, nil},
        TSKeywordReturn      = { fg = colors.cyan },
        TSNamespace          = { colors.magenta, nil, nil, nil},
        TSParameter          = { fg = colors.beige }, -- For parameters of a function.
        TSParameterReference = { fg = colors.bright_yellow }, -- For references to parameters of a function.
        TSProperty           = { fg = colors.bright_white }, -- Same as `TSField`,accesing for struct members in C.
        TSPunctDelimiter     = { fg = colors.cyan }, -- For delimiters ie: `.`
        TSPunctBracket       = { fg = colors.cyan }, -- For brackets and parens.
        TSPunctSpecial       = { fg = colors.cyan }, -- For special punctutation that does not fall in the catagories before.
        TSStringRegex        = { colors.red, nil, nil, nil},
        TSStringEscape       = { colors.cyan, nil, nil, nil},
        TSSymbol             = { fg = colors.yellow }, -- For identifiers referring to symbols or atoms.
        TSStrong             = { fg = colors.paleblue, style = 'bold' }, -- Text to be represented in bold.
        TSTagDelimiter       = { colors.white, nil, nil, nil},
        TSTagAttribute       = { fg = colors.gray }, -- HTML tag attributes.
        TSTextReference      = { fg = colors.yellow }, -- FIXME
        TSEmphasis           = { fg = colors.paleblue }, -- For text to be represented with emphasis.
        TSUnderline          = { fg = colors.fg, style = 'underline' }, -- For text to be represented with an underline.
        TSStrike             = { }, -- For strikethrough text.
        TSTitle              = { fg = colors.title, style = 'bold' }, -- Text that is part of a title.
        TSURI                = { fg = colors.link }, -- Any URI like a link or email.
        TSMath               = { fg = colors.blue }, -- Math environments like LaTeX's `$ ... $`
        TSType               = { colors.pink, nil, nil, nil},
        --TSNone             = { }, -- TODO: docs


        TSString             = { fg = colors.yellow }, -- For strings.

        TSKeywordFunction    = { fg = colors.purple, style = "italic"}, -- For keywords used to define a fuction.
        TSFuncBuiltin        = { colors.cyan, nil, "bold,italic", nil},
        TSVariable           = { fg = colors.fg }, -- Any variable name that does not have another highlight.
        TSVariableBuiltin    = { fg = colors.brighter_paleblue }, -- Variable names that are defined by the languages, like `this` or `self`.

        TSText               = "TSString", -- For strings considered text in a markup language.
        TSLiteral            = "TSString", -- Literal text.
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
        TSFuncMacro          = "Function",
        TSFunction           = "Function", -- For fuction (calls and definitions).
        TSMethod             = "Function", -- For method calls and definitions.
        TSNote               = "Todo",
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
        diffAdded                     = { fg = colors.green },
        diffRemoved                   = { fg = colors.red },
        diffChanged                   = { fg = colors.blue },
        diffOldFile                   = { colors.red, nil, nil, nil},
        diffNewFile                   = { colors.green, nil, nil, nil},
        diffFile                      = { fg = colors.gray },
        diffLine                      = { fg = colors.cyan },
        diffIndexLine                 = { fg = colors.purple },
        diffFileId                    = { colors.yellow, nil, 'bold,reverse', nil},

        -- Below are possible syntax for git and diff so please dont remove
        -- diffOnly                   = {},
        -- diffIdentical              = {},
        -- diffDiffer                 = {},
        -- diffBDiffer                = {},
        -- diffIsA                    = {},
        -- diffNoEOL                  = {},
        -- diffCommon                 = {},
        -- diffSubname                = {},
        -- diffComment                = {},
        gitcommitDiff                 = {},
        gitcommitFirstLine            = {colors.pink, nil, "bold", nil},
        gitcommitSummary              = {colors.pink, nil, "bold", nil},
        -- gitcommitOverflow          = {},
        -- gitcommitBlank             = {},
        gitcommitComment              = "Comment",
        -- gitcommitHead              = {},
        -- gitcommitBranch            = {},
        -- gitcommitOnBranch          = {},
        -- gitcommitNoBranch          = {},
        gitcommitHeader               = {colors.dark_orange, nil, "bold", nil},
        gitcommitAuthor               = {colors.cyan, nil, "italic", nil},
        -- gitcommitNoChanges         = {},
        gitcommitUntracked            = {colors.pink, nil, "bold", nil},
        gitcommitUntrackedFile        = {colors.pink, nil, "italic", nil},
        gitcommitSelected             = {colors.dark_green, nil, "bold", nil},
        gitcommitSelectedType         = {colors.green, nil, "bold", nil},
        gitcommitSelectedFile         = {colors.green, nil, 'italic', nil},
        gitcommitDiscarded            = {colors.dark_violet, nil, 'bold', nil},
        gitcommitDiscardedType        = {colors.violet, nil, 'bold', nil},
        gitcommitDiscardedFile        = {colors.violet, nil, 'italic', nil},
        gitcommitUnmerged             = {colors.dark_red, nil, 'bold', nil},
        gitcommitUnmergedType         = {colors.red, nil, 'bold', nil},
        gitcommitUnmergedFile         = {colors.red, nil, 'italic', nil},
        -- gitcommitDiscardedArrow    = {},
        -- gitcommitSelectedArrow     = {},
        -- gitcommitUnmergedArrow     = {},
        gitcommitWarning              = {colors.dark_orange, nil, 'bold', nil},

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
        TelescopeMatching             = { colors.dark_green, nil, 'bold', nil},
        TelescopePromptPrefix         = { colors.purple, nil, nil, nil},
        TelescopeSelectionCaret       = { fg = colors.purple },

        -- NvimTree
        NvimTreeVertSplit             = { colors.bg, colors.bg, nil, nil},
        NvimTreeRootFolder            = { fg = colors.fg, style = 'italic' },
        NvimTreeEmptyFolderName       = { fg = colors.disabled },
        NvimTreeOpenedFolderName      = { fg = colors.beige, style = 'italic' },
        NvimTreeIndentMarker          = { fg = colors.disabled },
        NvimTreeGitDirty              = { fg = colors.blue },
        NvimTreeGitNew                = { colors.bright_green, nil, nil, nil},
        NvimTreeGitStaged             = { fg = colors.comments },
        NvimTreeGitDeleted            = { fg = colors.red },
        NvimTreeOpenedFile            = { fg = colors.beige },
        NvimTreeImageFile             = { colors.pink, nil, nil, nil},
        NvimTreeMarkdownFile          = { fg = colors.pink },
        NvimTreeExecFile              = { fg = colors.green },
        NvimTreeSpecialFile           = { colors.pink, nil, 'underline', nil},
        LspDiagnosticsError           = { fg = colors.error },
        LspDiagnosticsWarning         = { fg = colors.yellow },
        LspDiagnosticsInformation     = { fg = colors.paleblue },
        LspDiagnosticsHint            = { fg = colors.purple },
        NvimTreeFolderIcon            = { colors.purple, nil, nil, nil},
        NvimTreeFolderName            = { colors.fg, nil, nil, nil},
        NvimTreeCursorLine            = { nil, colors.selection, nil, nil},
        NvimTreeIn                    = { nil, colors.selection, nil, nil},
        NvimTreeEndOfBuffer           = { colors.bg, nil, nil, nil},

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

        -- Sneak
        Sneak                         = { fg = colors.bg, bg = colors.accent },
        SneakScope                    = { bg = colors.selection },

        -- Indent Blankline
        IndentBlanklineChar           = { fg = colors.highlight },
        IndentBlanklineContextChar    = { colors.bright_red, nil, 'nocombine', nil},

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
        NvimTreeNormal                = { colors.fg, colors.menu, nil, nil},

        -- debug/dap
        debugPc                       = { nil, colors.cyan, nil, nil},
        debugBreakpoint               = { colors.red, nil, "reverse", nil},

        -- Dashboard
        DashboardShortCut             = { fg = colors.red },
        DashboardHeader               = { fg = colors.comments },
        DashboardCenter               = { fg = colors.accent },
        DashboardFooter               = { fg = colors.green, style = 'italic' },
        -- TODO

    }
    hil.colors(plugins)
end

M.vimade_focus_gain = function()
    hil.colors({
        Normal            = { colors.fg, colors.bg, nil, nil},
        EndOfBuffer       = { colors.subtle, colors.subtle, nil, nil},
    })
end
M.vimade_focus_lost = function()
    hil.colors({
        Normal            = { nil, nil, nil, nil},
        EndOfBuffer       = { nil, nil, nil, nil},
    })
end
return M
