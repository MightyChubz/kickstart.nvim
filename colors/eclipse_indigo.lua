-- clear existing highlights
vim.cmd 'hi clear'
if vim.fn.exists 'syntax_on' then vim.cmd 'syntax reset' end

-- declare theme name and background type
vim.g.colors_name = 'eclipse_indigo'
vim.o.background = 'light'

-- The Eclipse Indigo Palette
local colors = {
  bg = '#ffffff',
  fg = '#000000',
  keyword = '#7f0055', -- Classic Eclipse bold purple/maroon
  string = '#2a00ff', -- Classic Eclipse bright blue
  number = '#007f00', -- Green numbers as requested
  comment = '#3f7f5f', -- Classic Eclipse teal/green comments
  javadoc = '#3f5fbf', -- Blue-ish for documentation comments
  annotation = '#646464', -- Grey annotations
  member = '#0000c0', -- Member variable color
  type = '#000000',

  -- UI Colors
  selection = '#b5d5ff', -- Light blue text selection
  cursorline = '#e8f2fe', -- Very faint blue for current line
  linenr_bg = '#f0f0f0', -- Grey gutter background
  linenr_fg = '#787878', -- Grey gutter text
  border = '#c0c0c0',
  error = '#d11d13',
  warning = '#c99500',
}

-- Highlight Groups Dictionary
local highlights = {
  -- Editor UI
  Normal = { fg = colors.fg, bg = colors.bg },
  Cursor = { fg = colors.bg, bg = colors.fg },
  CursorLine = { bg = colors.cursorline },
  CursorColumn = { bg = colors.cursorline },
  LineNr = { fg = colors.linenr_fg, bg = colors.linenr_bg },
  CursorLineNr = { fg = colors.fg, bg = colors.linenr_bg, bold = true },
  Visual = { bg = colors.selection },
  Search = { bg = '#ffff00' }, -- Classic yellow highlight
  IncSearch = { bg = '#ffcc00' },
  ColorColumn = { bg = colors.linenr_bg },
  SignColumn = { bg = colors.linenr_bg },
  VertSplit = { fg = colors.border, bg = colors.bg },
  Pmenu = { fg = colors.fg, bg = colors.linenr_bg },
  PmenuSel = { fg = colors.bg, bg = colors.javadoc },

  -- Standard Syntax
  Comment = { fg = colors.comment },
  String = { fg = colors.string },
  Number = { fg = colors.number },
  Boolean = { fg = colors.keyword, bold = true },
  Keyword = { fg = colors.keyword, bold = true },
  Function = { fg = colors.fg },
  Identifier = { fg = colors.fg },
  Type = { fg = colors.type },
  Statement = { fg = colors.keyword, bold = true },
  Conditional = { fg = colors.keyword, bold = true },
  Repeat = { fg = colors.keyword, bold = true },
  Operator = { fg = colors.fg },
  PreProc = { fg = colors.annotation },
  Special = { fg = colors.fg },
  Error = { fg = colors.error, bold = true },
  Todo = { fg = colors.bg, bg = colors.javadoc, bold = true },

  -- Treesitter (Neovim 0.9+)
  ['@comment'] = { link = 'Comment' },
  ['@comment.documentation'] = { fg = colors.javadoc },
  ['@string'] = { link = 'String' },
  ['@string.escape'] = { fg = colors.keyword },
  ['@number'] = { link = 'Number' },
  ['@number.float'] = { link = 'Number' },
  ['@boolean'] = { link = 'Boolean' },
  ['@keyword'] = { link = 'Keyword' },
  ['@keyword.function'] = { link = 'Keyword' },
  ['@keyword.return'] = { link = 'Keyword' },
  ['@keyword.operator'] = { link = 'Keyword' },
  ['@keyword.modifier'] = { link = 'Keyword' },
  ['@function'] = { link = 'Function' },
  ['@function.call'] = { link = 'Function' },
  ['@function.method'] = { link = 'Function' },
  ['@variable'] = { link = 'Identifier' },
  ['@variable.builtin'] = { fg = colors.keyword, bold = true },
  ['@variable.parameter'] = { link = 'Identifier' },
  ['@type'] = { link = 'Type' },
  ['@type.builtin'] = { fg = colors.keyword, bold = true },
  ['@operator'] = { link = 'Operator' },
  ['@punctuation.delimiter'] = { fg = colors.fg },
  ['@punctuation.bracket'] = { fg = colors.fg },
  ['@attribute'] = { fg = colors.annotation },
  ['@module'] = { link = 'Type' },

  ['@variable.member'] = { fg = colors.member },
  ['@property'] = { fg = colors.member },
  ['@constant'] = { fg = colors.member },
  ['@constant.builtin'] = { fg = colors.member },
  ['@constant.macro'] = { fg = colors.member },

  -- Diagnostic / LSP
  DiagnosticError = { fg = colors.error },
  DiagnosticWarn = { fg = colors.warning },
  DiagnosticInfo = { fg = colors.javadoc },
  DiagnosticHint = { fg = colors.comment },
  DiagnosticUnderlineError = { sp = colors.error, underline = true },
  DiagnosticUnderlineWarn = { sp = colors.warning, underline = true },
}

-- Apply Highlights
for group, settings in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, settings)
end
