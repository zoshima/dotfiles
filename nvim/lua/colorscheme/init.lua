local c = require('colorscheme.colors')

local conf = {
  Normal = { fg = c.FG, bg = c.BG },
  EndOfBuffer = { fg = c.Gray },
  LineNr = { fg = c.Gray, bg = c.BG },
  CursorLine = { bg = c.BG },
  CursorLineNr = { fg = c.Accent },
  Pmenu = { fg = c.FG, bg = c.Slate },
  PmenuSel = { fg = c.Slate, bg = c.FG },
  PmenuSbar = { fg = c.None, bg = c.Slate },
  PmenuThumb = { fg = c.None, bg = c.FG },
  VertSplit = { fg = c.Gray, bg = c.None },
  StatusLine = { fg = c.Gray2, bg = c.None },
  StatusLineNC = { fg = c.Gray },
  StatusLineFileName = { fg = c.Accent },
  StatusLineModified = { fg = c.Cream },
  Visual = { fg = c.None, bg = c.Slate },
  VisualNOS = { fg = c.None, bg = c.Slate },
  NonText = { fg = c.None, bg = c.None },
  Folded = { fg = c.FG, bg = c.Slate },
  Search = { fg = c.BG, bg = c.Cream },

  -- syntax
  Operator = { fg = c.FG, bg = c.None },
  SpecialChar = { fg = c.FG, bg = c.None },
  Tag = { fg = c.FG, bg = c.None },
  Delimiter = { fg = c.FG, bg = c.None },
  Debug = { fg = c.FG, bg = c.None },
  Conceal = { fg = c.FG, bg = c.BG },
  Ignore = { fg = c.FG, bg = c.None },
  Comment = { fg = c.RussianGreen, bg = c.None },
  SpecialComment = { fg = c.RussianGreen, bg = c.None },

  Include = { fg = c.LightMossGreen, bg = c.None },
  Label = { fg = c.LightMossGreen, bg = c.None },
  PreProc = { fg = c.LightMossGreen, bg = c.None },
  Define = { fg = c.LightMossGreen, bg = c.None },
  Macro = { fg = c.LightMossGreen, bg = c.None },

  Keyword = { fg = c.CarolinaBlue, bg = c.None },
  Statement = { fg = c.CarolinaBlue, bg = c.None },
  Conditional = { fg = c.CarolinaBlue, bg = c.None },
  Repeat = { fg = c.CarolinaBlue, bg = c.None },

  Function = { fg = c.Cream, bg = c.None },

  Constant = { fg = c.WinterWizard, bg = c.None },
  Identifier = { fg = c.WinterWizard, bg = c.None },
  StorageClass = { fg = c.WinterWizard, bg = c.None },
  Structure = { fg = c.WinterWizard, bg = c.None },
  Typedef = { fg = c.WinterWizard, bg = c.None },

  String = { fg = c.AntiqueBrass, bg = c.None },
  Character = { fg = c.AntiqueBrass, bg = c.None },

  Number = { fg = c.Burlywood, bg = c.None },
  Boolean = { fg = c.Burlywood, bg = c.None },
  Float = { fg = c.Burlywood, bg = c.None },

  Special = { fg = c.Cream, bg = c.None },
  Todo = { fg = c.Cream, bg = c.BG, bold = true },

  SpellBad = { fg = c.FuzzyWuzzy, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy },
  SpellCap = { fg = c.FuzzyWuzzy, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy },
  SpellRare = { fg = c.FuzzyWuzzy, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy },
  SpellLocal = { fg = c.FuzzyWuzzy, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy },

  Type = { fg = c.Eucalyptus, bg = c.None },

  Underlined = { fg = c.None, bg = c.None, underline = true },

  Error = { fg = c.TartOrange, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy },
  Exception = { fg = c.TartOrange, bg = c.None },

  ErrorMsg = { fg = c.TartOrange, bg = c.BG },
  WarningMsg = { fg = c.FuzzyWuzzy, bg = c.BG, bold = true },

  Whitespace = { fg = c.Gray },

  -- lsp
  DiagnosticError = { fg = c.TartOrange },
  DiagnosticWarn = { fg = c.Cream },
  DiagnosticInfo = { fg = c.WinterWizard },
  DiagnosticHint = { fg = c.Cream },

  -- nvim tree
  NvimTreeRootFolder = { fg = c.LightGray },
  NvimTreeFolderName = { fg = c.CarolinaBlue },
  NvimTreeOpenedFolderName = { fg = c.CarolinaBlue },
  NvimTreeEmptyFolderName = { fg = c.CarolinaBlue },
  NvimTreeSpecialFile = { fg = c.Burlywood },
  NvimTreeExecFile = { fg = c.TartOrange },
  NvimTreeSymlink = { fg = c.AntiqueBrass },
  NvimTreeOpenedFile = { fg = c.WinterWizard },
  NvimTreeImageFile = { fg = c.Cream },

  -- treesitter
  TSConstBuiltin = { fg = c.Burlywood, bg = c.None },
}

for k, v in pairs(conf) do
  vim.api.nvim_set_hl(0, k, v)
end
