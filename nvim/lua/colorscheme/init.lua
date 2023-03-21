local c = require('colorscheme.colors')

local conf = {
  { Name = "Normal", Value = { fg = c.FG, bg = c.BG } },
  { Name = "EndOfBuffer", Value = { fg = c.Gray } },
  { Name = "LineNr", Value = { fg = c.Gray, bg = c.BG } },
  { Name = "CursorLine", Value = { bg = c.BG } },
  { Name = "CursorLineNr", Value = { fg = c.Accent } },
  { Name = "Pmenu", Value = { fg = c.FG, bg = c.Slate } },
  { Name = "PmenuSel", Value = { fg = c.Slate, bg = c.FG } },
  { Name = "PmenuSbar", Value = { fg = c.None, bg = c.Slate } },
  { Name = "PmenuThumb", Value = { fg = c.None, bg = c.FG } },
  { Name = "VertSplit", Value = { fg = c.Gray, bg = c.None } },
  { Name = "StatusLine", Value = { fg = c.Gray2, bg = c.None } },
  { Name = "StatusLineNC", Value = { fg = c.Gray } },
  { Name = "StatusLineFileName", Value = { fg = c.Accent } },
  { Name = "StatusLineModified", Value = { fg = c.Cream } },
  { Name = "Visual", Value = { fg = c.None, bg = c.Slate } },
  { Name = "VisualNOS", Value = { fg = c.None, bg = c.Slate } },
  { Name = "NonText", Value = { fg = c.None, bg = c.None } },
  { Name = "Folded", Value = { fg = c.FG, bg = c.Slate } },
  { Name = "Search", Value = { fg = c.BG, bg = c.Cream } },

  -- syntax
  { Name = "Operator", Value = { fg = c.FG, bg = c.None } },
  { Name = "SpecialChar", Value = { fg = c.FG, bg = c.None } },
  { Name = "Tag", Value = { fg = c.FG, bg = c.None } },
  { Name = "Delimiter", Value = { fg = c.FG, bg = c.None } },
  { Name = "Debug", Value = { fg = c.FG, bg = c.None } },
  { Name = "Conceal", Value = { fg = c.FG, bg = c.BG } },
  { Name = "Ignore", Value = { fg = c.FG, bg = c.None } },
  { Name = "Comment", Value = { fg = c.RussianGreen, bg = c.None } },
  { Name = "SpecialComment", Value = { fg = c.RussianGreen, bg = c.None } },

  { Name = "Include", Value = { fg = c.LightMossGreen, bg = c.None } },
  { Name = "Label", Value = { fg = c.LightMossGreen, bg = c.None } },
  { Name = "PreProc", Value = { fg = c.LightMossGreen, bg = c.None } },
  { Name = "Define", Value = { fg = c.LightMossGreen, bg = c.None } },
  { Name = "Macro", Value = { fg = c.LightMossGreen, bg = c.None } },

  { Name = "Keyword", Value = { fg = c.CarolinaBlue, bg = c.None } },
  { Name = "Statement", Value = { fg = c.CarolinaBlue, bg = c.None } },
  { Name = "Conditional", Value = { fg = c.CarolinaBlue, bg = c.None } },
  { Name = "Repeat", Value = { fg = c.CarolinaBlue, bg = c.None } },

  { Name = "Function", Value = { fg = c.Cream, bg = c.None } },

  { Name = "Constant", Value = { fg = c.WinterWizard, bg = c.None } },
  { Name = "Identifier", Value = { fg = c.WinterWizard, bg = c.None } },
  { Name = "StorageClass", Value = { fg = c.WinterWizard, bg = c.None } },
  { Name = "Structure", Value = { fg = c.WinterWizard, bg = c.None } },
  { Name = "Typedef", Value = { fg = c.WinterWizard, bg = c.None } },

  { Name = "String", Value = { fg = c.AntiqueBrass, bg = c.None } },
  { Name = "Character", Value = { fg = c.AntiqueBrass, bg = c.None } },

  { Name = "Number", Value = { fg = c.Burlywood, bg = c.None } },
  { Name = "Boolean", Value = { fg = c.Burlywood, bg = c.None } },
  { Name = "Float", Value = { fg = c.Burlywood, bg = c.None } },

  { Name = "Special", Value = { fg = c.Cream, bg = c.None } },
  { Name = "Todo", Value = { fg = c.Cream, bg = c.BG, bold = true } },

  { Name = "SpellBad", Value = { fg = c.FuzzyWuzzy, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy } },
  { Name = "SpellCap", Value = { fg = c.FuzzyWuzzy, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy } },
  { Name = "SpellRare", Value = { fg = c.FuzzyWuzzy, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy } },
  { Name = "SpellLocal", Value = { fg = c.FuzzyWuzzy, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy } },

  { Name = "Type", Value = { fg = c.Eucalyptus, bg = c.None } },

  { Name = "Underlined", Value = { fg = c.None, bg = c.None, underline = true } },

  { Name = "Error", Value = { fg = c.TartOrange, bg = c.BG, undercurl = true, sp = c.FuzzyWuzzy } },
  { Name = "Exception", Value = { fg = c.TartOrange, bg = c.None } },

  { Name = "ErrorMsg", Value = { fg = c.TartOrange, bg = c.BG } },
  { Name = "WarningMsg", Value = { fg = c.FuzzyWuzzy, bg = c.BG, bold = true } },

  { Name = "Whitespace", Value = { fg = c.Gray } },

  -- lsp
  { Name = "DiagnosticError", Value = { fg = c.TartOrange } },
  { Name = "DiagnosticWarn", Value = { fg = c.Cream } },
  { Name = "DiagnosticInfo", Value = { fg = c.WinterWizard } },
  { Name = "DiagnosticHint", Value = { fg = c.Cream } },

  -- nvim tree
  { Name = "NvimTreeRootFolder", Value = { fg = c.LightGray } },
  { Name = "NvimTreeFolderName", Value = { fg = c.CarolinaBlue } },
  { Name = "NvimTreeOpenedFolderName", Value = { fg = c.CarolinaBlue } },
  { Name = "NvimTreeEmptyFolderName", Value = { fg = c.CarolinaBlue } },
  { Name = "NvimTreeSpecialFile", Value = { fg = c.Burlywood } },
  { Name = "NvimTreeExecFile", Value = { fg = c.TartOrange } },
  { Name = "NvimTreeSymlink", Value = { fg = c.AntiqueBrass } },
  { Name = "NvimTreeOpenedFile", Value = { fg = c.WinterWizard } },
  { Name = "NvimTreeImageFile", Value = { fg = c.Cream } },

  -- treesitter
  { Name = "TSConstBuiltin", Value = { fg = c.Burlywood, bg = c.None } },
  { Name = "@text.title", Value = { link = "Identifier" } }, -- placeholders in html
}

for i, v in ipairs(conf) do
  vim.api.nvim_set_hl(0, v.Name, v.Value)
end
