-- clear existing highlights
vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then vim.cmd 'syntax reset' end

-- declare theme name and background type
vim.g.colors_name = 'eclipse_indigo'
vim.o.background = 'light'

-- The Eclipse Indigo Palette
local colors = {
  bg         = '#1e1e1e', -- Standard dark editor background
  fg         = '#d4d4d4', -- Light grey text
  keyword    = '#d2669a', -- Brightened Eclipse maroon/purple
  string     = '#7aa6ff', -- Brightened Eclipse blue
  number     = '#5fc45f', -- Brightened green numbers
  comment    = '#73a88c', -- Brightened teal/green
  javadoc    = '#7f9beb', -- Brightened documentation blue
  annotation = '#a9a9a9', -- Light grey annotations
  member     = '#79b8ff', -- Brightened field/constant blue
  type       = '#d4d4d4',

  -- UI Colors
  selection  = '#264f78', -- Classic dark mode selection blue
  cursorline = '#2a2d2e', -- Subtle highlight for current line
  linenr_bg  = '#1e1e1e', -- Match gutter to background
  linenr_fg  = '#858585', -- Muted gutter text
  border     = '#404040', -- Dark grey borders
  error      = '#f14c4c', -- Brightened red for dark mode
  warning    = '#cca700', -- Brightened yellow/orange
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
  ColorColumn                = { bg = colors.linenr_bg },
  SignColumn                 = { bg = colors.linenr_bg },
  VertSplit                  = { fg = colors.border, bg = colors.bg },
  Pmenu                      = { fg = colors.fg, bg = colors.linenr_bg },
  PmenuSel                   = { fg = colors.bg, bg = colors.javadoc },

  -- Standard Syntax
  Comment                    = { fg = colors.comment },
  String                     = { fg = colors.string },
  Number                     = { fg = colors.number },
  Boolean                    = { fg = colors.keyword, bold = true },
  Keyword                    = { fg = colors.keyword, bold = true },
  Function                   = { fg = colors.fg },
  Identifier                 = { fg = colors.fg },
  Type                       = { fg = colors.type },
  Statement                  = { fg = colors.keyword, bold = true },
  Conditional                = { fg = colors.keyword, bold = true },
  Repeat                     = { fg = colors.keyword, bold = true },
  Operator                   = { fg = colors.fg },
  PreProc                    = { fg = colors.annotation },
  Special                    = { fg = colors.fg },
  Error                      = { fg = colors.error, bold = true },
  Todo                       = { fg = colors.bg, bg = colors.javadoc, bold = true },

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
  ['@variable.parameter']    = { link = 'Identifier' },
  ['@type']                  = { link = 'Type' },
  ['@type.builtin']          = { fg = colors.keyword, bold = true },
  ['@operator']              = { link = 'Operator' },
  ['@punctuation.delimiter'] = { fg = colors.fg },
  ['@punctuation.bracket']   = { fg = colors.fg },
  ['@attribute']             = { fg = colors.annotation },
  ['@module']                = { link = 'Type' },

  ['@variable.member']       = { fg = colors.member },
  ['@property']              = { fg = colors.member },
  ['@constant']              = { fg = colors.member },
  ['@constant.builtin']      = { fg = colors.member },
  ['@constant.macro']        = { fg = colors.member },

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
