local M = {
  base00 = "#2B2D2E",
  base01 = "#3B4252",
  base02 = "#434C5E",
  base03 = "#4C566A",
  base04 = "#D8DEE9",
  base05 = "#E5E9F0",
  base06 = "#ECEFF4",
  base07 = "#8FBCBB",
  base08 = "#88C0D0",
  base09 = "#81A1C1",
  base0A = "#5E81AC",
  base0B = "#BF616A",
  base0C = "#D08770",
  base0D = "#EBCB8B",
  base0E = "#A3BE8C",
  base0F = "#B48EAD",
}

function M:setup()
  --[[ Terminal Colors ]]
  vim.g.terminal_color_0 = self.base01
  vim.g.terminal_color_1 = self.base0B
  vim.g.terminal_color_2 = self.base0E
  vim.g.terminal_color_3 = self.base0D
  vim.g.terminal_color_4 = self.base09
  vim.g.terminal_color_5 = self.base0F
  vim.g.terminal_color_6 = self.base08
  vim.g.terminal_color_7 = self.base05
  vim.g.terminal_color_8 = self.base03
  vim.g.terminal_color_9 = self.base0B
  vim.g.terminal_color_10 = self.base0E
  vim.g.terminal_color_11 = self.base0D
  vim.g.terminal_color_12 = self.base09
  vim.g.terminal_color_13 = self.base0F
  vim.g.terminal_color_14 = self.base07
  vim.g.terminal_color_15 = self.base06

  local definitions = {
    --[[ Syntax Groups ]]
    Comment = { fg = self.base03 },
    Constant = { fg = self.base04 },
    String = { fg = self.base0E },
    Character = { fg = self.base0E },
    Number = { fg = self.base0F },
    Boolean = { fg = self.base0D },
    Float = { link = "Number" },
    Identifier = { fg = self.base04 },
    Function = { fg = self.base08 },
    Statement = { fg = self.base09 },
    Conditional = { link = "Statement" },
    Repeat = { link = "Statement" },
    Label = { link = "Statement" },
    Operator = { link = "Statement" },
    Keyword = { link = "Statement" },
    Exception = { link = "Statement" },
    PreProc = { link = "PreProc" },
    Include = { link = "PreProc" },
    Define = { link = "PreProc" },
    Macro = { link = "PreProc" },
    PreCondit = { link = "PreProc" },
    Type = { fg = self.base09 },
    StorageClass = { link = "Type" },
    Structure = { link = "Type" },
    Typedef = { link = "Type" },
    Special = { fg = self.base08 },
    SpecialChar = { fg = self.base0D },
    Tag = { fg = self.base04 },
    Delimiter = { fg = self.base06 },
    SpecialComment = { fg = self.base08, italic = true },
    Debug = { link = "Special" },
    Underlined = { underline = true, sp = self.base0A },
    Ignore = { fg = self.base03 },
    Error = { fg = self.base0B },
    Todo = { fg = self.base0D },

    --[[ Highlight Groups ]]
    ColorColumn = { bg = self.base01 },
    Conceal = { fg = self.base01 },
    Cursor = { fg = self.base00, bg = self.base04 },
    CursorIM = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    vCursor = { link = "Cursor" },
    TermCursor = { link = "Cursor" },
    TermCursorNC = { link = "Cursor" },
    CursorColumn = { bg = self.base01 },
    CursorLine = { bg = self.base01 },
    CursorLineNr = { fg = self.base04, bg = self.base01 },
    Directory = { fg = self.base08 },
    DiffAdd = { fg = self.base0E, bg = self.base01 },
    DiffChange = { fg = self.base0D, bg = self.base01 },
    DiffDelete = { fg = self.base0B, bg = self.base01 },
    DiffText = { fg = self.base09, bg = self.base01 },
    EndOfBuffer = { fg = self.base01 },
    ErrorMsg = { fg = self.base0B },
    NvimInternalError = { link = "ErrorMsg" },
    WinSeparator = { fg = self.base02 },
    VertSplit = { link = "WinSeparator" },
    FloatBorder = { link = "WinSeparator" },
    Folded = { fg = self.base03, bg = self.base01 },
    FoldColumn = { fg = self.base03 },
    SignColumn = { fg = self.base01 },
    IncSearch = { fg = self.base06, bg = self.base0A },
    Substitute = { fg = self.base0C, bg = self.base06, reverse = true },
    LineNr = { fg = self.base03 },
    MatchParen = { fg = self.base08, bg = self.base03 },
    ModeMsg = { fg = self.base0B, bold = true },
    MsgArea = { fg = self.base0D, bold = true },
    MsgSeparator = { link = "WinSeparator" },
    MoreMsg = { fg = self.base08 },
    NonText = { fg = self.base03 },
    Normal = { fg = self.base05, bg = self.base00 },
    NormalFloat = { link = "Normal" },
    NormalNC = { link = "Normal" },
    Pmenu = { fg = self.base04, bg = self.base02 },
    PmenuSel = { fg = self.base08, bg = self.base03 },
    PmenuSbar = { fg = self.base04, bg = self.base02 },
    PmenuThumb = { fg = self.base08, bg = self.base03 },
    Question = { fg = self.base04 },
    QuickFixLine = { fg = self.base0F, bold = true },
    Search = { fg = self.base01, bg = self.base08 },
    SpecialKey = { fg = self.base03 },
    SpellBad = { fg = self.base0B, sp = self.base0B, undercurl = true },
    SpellCap = { fg = self.base0D, sp = self.base0D, undercurl = true },
    SpellLocal = { fg = self.base05, sp = self.base05, undercurl = true },
    SpellRare = { fg = self.base06, sp = self.base06, undercurl = true },
    StatusLine = { fg = self.base08, bg = self.base03 },
    StatusLineNC = { fg = self.base04, bg = self.base03 },
    StatusLineTerm = { fg = self.base08, bg = self.base03 },
    StatusLineTermNC = { fg = self.base04, bg = self.base03 },
    TabLine = { fg = self.base04, bg = self.base01 },
    TabLineFill = { bg = self.base00 },
    TabLineHead = { fg = self.base00, bg = self.base08 },
    TabLineSel = { fg = self.base08, bg = self.base03 },
    TabLineTail = { fg = self.base00, bg = self.base08 },
    Terminal = { fg = self.base04 },
    Title = { fg = self.base04 },
    Visual = { bg = self.base02 },
    VisualNOS = { bg = self.base02 },
    WarningMsg = { fg = self.base0D },
    Whitespace = { fg = self.base03 },
    WildMenu = { fg = self.base08, bg = self.base01 },

    --[[ Diagnostics ]]
    DiagnosticError = { fg = self.base0B },
    DiagnosticWarn = { fg = self.base0D },
    DiagnosticInfo = { fg = self.base08 },
    DiagnosticHint = { fg = self.base0A },
    DiagnosticUnderlineError = { fg = self.base0B, underline = true },
    DiagnosticUnderlineWarn = { fg = self.base0D, underline = true },
    DiagnosticUnderlineInfo = { fg = self.base08, underline = true },
    DiagnosticUnderlineHint = { fg = self.base0A, underline = true },
    LspCodeLens = { link = "Comment" },
    LspReferenceText = { bg = self.base03 },
    LspReferenceRead = { bg = self.base03 },
    LspReferenceWrite = { bg = self.base03 },
    LspSignatureActiveParameter = { fg = self.base08, underline = true },

    --[[ Git Groups ]]
    gitcommitComment = { link = "Comment" },
    gitcommitUnmerged = { fg = self.base0E },
    gitcommitOnBranch = { fg = self.base07 },
    gitcommitBranch = { fg = self.base0F },
    gitcommitDiscardedType = { fg = self.base0B },
    gitcommitSelectedType = { fg = self.base0E },
    gitcommitHeader = { fg = self.base07 },
    gitcommitUntrackedFile = { fg = self.base08 },
    gitcommitDiscardedFile = { fg = self.base0B },
    gitcommitSelectedFile = { fg = self.base0E },
    gitcommitUnmergedFile = { fg = self.base0D },
    gitcommitFile = { fg = self.base07 },
    gitcommitSummary = { fg = self.base06 },
    gitcommitOverflow = { fg = self.base0B },
    gitcommitNoBranch = { link = "gitcommitBranch" },
    gitcommitUntracked = { link = "gitcommitComment" },
    gitcommitDiscarded = { link = "gitcommitComment" },
    gitcommitSelected = { link = "gitcommitComment" },
    gitcommitDiscardedArrow = { link = "gitcommitDiscardedFile" },
    gitcommitSelectedArrow = { link = "gitcommitSelectedFile" },
    gitcommitUnmergedArrow = { link = "gitcommitUnmergedFile" },

    --[[ Plugin Groups ]]
    -- " lewis6991/gitsigns.nvim
    GitSignsAdd = { fg = self.base0E },
    GitSignsChange = { fg = self.base0D },
    GitSignsDelete = { fg = self.base0B },

    -- " tpope/vim-fugitive
    diffAdded = { fg = self.base0E },
    diffChanged = { fg = self.base0D },
    diffRemoved = { fg = self.base0B },
    diffFile = { fg = self.base09 },
    diffLine = { fg = self.base08 },
    diffNewFile = { fg = self.base08 },
  }

  for group, attrs in pairs(definitions) do
    vim.api.nvim_set_hl(0, group, attrs)
  end
end

return M
