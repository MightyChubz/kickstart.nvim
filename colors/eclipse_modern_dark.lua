-- clear existing highlights
vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then vim.cmd 'syntax reset' end

-- declare theme name and background type
vim.g.colors_name = 'eclipse_classic_dark'
vim.o.background = 'dark'

-- The REAL Eclipse Classic Dark Palette (Luna/Mars/Neon era)
-- Based on the official Eclipse dark theme and the accurate JetBrains/VS Code port
-- Source: https://github.com/lorenzobilli/Eclipse-color-theme
local colors = {
  -- Editor core (from Eclipse Classic Dark JSON)
  bg         = '#292929', -- Editor background
  fg         = '#D9E8F7', -- Editor foreground
  
  -- Syntax highlighting (CORRECTED: keywords are ORANGE)
  keyword    = '#FF8C00', -- Keywords (DarkOrange) - THIS IS THE CORRECT COLOR
  string     = '#17C6A3', -- Strings (teal)
  number     = '#6897BB', -- Numbers (blue-gray)
  comment    = '#626262', -- Comments (gray)
  javadoc    = '#626262', -- Documentation (same as comments)
  annotation = '#FF9393', -- Annotations (light red/pink)
  member     = '#66E1F8', -- Fields / properties (cyan)
  type       = '#1290C3', -- Classes / types (bright blue)
  func       = '#A7EC21', -- Functions / methods (lime green)
  operator   = '#E6E6FA', -- Operators (lavender)
  variable   = '#FFBF26', -- Variables (golden)
  constant   = '#8DDAF8', -- Constants (light blue)
  parameter  = '#79ABFF', -- Parameters (periwinkle)
  enum       = '#CC81BA', -- Enums (mauve)
  
  -- UI Colors (from Eclipse dark theme CSS / SWT)
  selection  = '#3a3d41', -- Inactive selection background
  cursorline = '#3a3d41', -- Subtle highlight (same as selection)
  linenr_bg  = '#292929', -- Match editor background
  linenr_fg  = '#858585', -- Muted gutter text
  border     = '#404040', -- Dark grey borders
  error      = '#F44747', -- Error color
  warning    = '#cca700', -- Warning color
}

-- Highlight Groups Dictionary
local highlights = {
  -- Editor UI
  Normal                     = { fg = colors.fg, bg = colors.bg },
  Cursor                     = { fg = colors.bg, bg = colors.fg },
  CursorLine                 = { bg = colors.cursorline },
  CursorColumn               = { bg = colors.cursorline },
  LineNr                     = { fg = colors.linenr_fg, bg = colors.linenr_bg },
  CursorLineNr               = { fg = colors.fg, bg = colors.linenr_bg, bold = true },
  Visual                     = { bg = colors.selection },
  Search                     = { bg = '#ffff00' }, -- Classic yellow highlight
  IncSearch                  = { bg = '#ffcc00' },
  ColorColumn                = { bg = colors.cursorline },
  SignColumn                 = { bg = colors.linenr_bg },
  VertSplit                  = { fg = colors.border, bg = colors.bg },
  Pmenu                      = { fg = colors.fg, bg = colors.linenr_bg },
  PmenuSel                   = { fg = colors.bg, bg = colors.type },

  -- Standard Syntax
  Comment                    = { fg = colors.comment },
  String                     = { fg = colors.string },
  Number                     = { fg = colors.number },
  Boolean                    = { fg = colors.keyword, bold = true },
  Keyword                    = { fg = colors.keyword, bold = true },
  Function                   = { fg = colors.func },
  Identifier                 = { fg = colors.variable },
  Type                       = { fg = colors.type, bold = true },
  Statement                  = { fg = colors.keyword, bold = true },
  Conditional                = { fg = colors.keyword, bold = true },
  Repeat                     = { fg = colors.keyword, bold = true },
  Operator                   = { fg = colors.operator },
  PreProc                    = { fg = colors.annotation },
  Special                    = { fg = colors.constant },
  Error                      = { fg = colors.error, bold = true },
  Todo                       = { fg = colors.bg, bg = colors.keyword, bold = true },

  -- Treesitter (Neovim 0.9+)
  ['@comment']               = { link = 'Comment' },
  ['@comment.documentation'] = { fg = colors.javadoc },
  ['@string']                = { link = 'String' },
  ['@string.escape']         = { fg = colors.keyword },
  ['@number']                = { link = 'Number' },
  ['@number.float']          = { link = 'Number' },
  ['@boolean']               = { link = 'Boolean' },
  ['@keyword']               = { link = 'Keyword' },
  ['@keyword.function']      = { link = 'Keyword' },
  ['@keyword.return']        = { link = 'Keyword' },
  ['@keyword.operator']      = { link = 'Keyword' },
  ['@keyword.modifier']      = { link = 'Keyword' },
  ['@function']              = { link = 'Function' },
  ['@function.call']         = { link = 'Function' },
  ['@function.method']       = { link = 'Function' },
  ['@variable']              = { link = 'Identifier' },
  ['@variable.builtin']      = { fg = colors.keyword, bold = true },
  ['@variable.parameter']    = { fg = colors.parameter },
  ['@type']                  = { link = 'Type' },
  ['@type.builtin']          = { fg = colors.keyword, bold = true },
  ['@operator']              = { link = 'Operator' },
  ['@punctuation.delimiter'] = { fg = colors.fg },
  ['@punctuation.bracket']   = { fg = colors.fg },
  ['@attribute']             = { fg = colors.annotation },
  ['@module']                = { link = 'Type' },

  ['@variable.member']       = { fg = colors.member },
  ['@property']              = { fg = colors.member },
  ['@constant']              = { fg = colors.constant },
  ['@constant.builtin']      = { fg = colors.constant },
  ['@constant.macro']        = { fg = colors.constant },

  -- Diagnostic / LSP
  DiagnosticError            = { fg = colors.error },
  DiagnosticWarn             = { fg = colors.warning },
  DiagnosticInfo             = { fg = colors.javadoc },
  DiagnosticHint             = { fg = colors.comment },
  DiagnosticUnderlineError   = { sp = colors.error, underline = true },
  DiagnosticUnderlineWarn    = { sp = colors.warning, underline = true },
}

-- Apply Highlights
for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end
