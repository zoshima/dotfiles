local c = require('colorscheme.colors')
c["None"] = "NONE"
c["Black"] = "#000000"
c["White"] = "#FFFFFF"
c["Gray"] = "#616161"
c["GnomeGray"] = "#2e2e2e"

local conf = {
  None = {
    { Name = "Pmenu", Value = { bg = c.GnomeGray } },
    { Name = "PmenuThumb", Value = { bg = c.White } },
    { Name = "PmenuSbar", Value = { bg = c.Gray } },
    { Name = "PmenuSel", Value = { reverse = true } },
    { Name = "Visual", Value = { bg = c.Gray } },
    { Name = "VisualNOS", Value = { bg = c.Gray } },
  },

  Black = {
  },
  Gray = {
    { Name = "DiagnosticHint" },

    { Name = "TelescopeBorder" },

    -- UI
    { Name = "StatusLine", Value = { nocombine = true } },
    { Name = "StatusLineNC" },
    { Name = "LineNr"},
    { Name = "NonText" },
    { Name = "VertSplit" },

    -- syntax
    { Name = "Ignore" }, -- blank, hidden, ignored
  },
  White = {
    -- UI
    { Name = "Normal"},
    { Name = "CursorLineNr" },
    { Name = "StatusLineFileName" },

    -- syntax
    { Name = "Operator" }, -- >, = etc
    { Name = "Identifier" }, -- [Identifier, Function]
    { Name = "Constant" }, -- [String, Character, Number, Boolean, Float]
    { Name = "Delimiter" },
  },

  Red = {
    { Name = "NvimTreeExecFile" },
    { Name = "DiagnosticError" },

     -- UI
    { Name = "ErrorMsg"}, -- err in output

    -- syntax
    { Name = "Error" }, -- any erronous construct
  },
  Pink = {
  },
  Purple = {
  },

  DeepPurple = {
  },
  Indigo = {
  },
  Blue = {
    { Name = "DiagnosticInfo" },
  },
  LightBlue = {
    { Name = "NvimTreeSymlink" },
    { Name = "NvimTreeFolderName" },
    { Name = "NvimTreeOpenedFolderName" },
    { Name = "NvimTreeEmptyFolderName" },

    -- syntax
    { Name = "PreProc" }, -- [Include, Define, Macro, PreCondit]
    { Name = "Statement" }, -- [Conditional, Repeat, Label, Operator, Keyword, Exception]
    { Name = "Special" }, -- [SpecialChar, Tag, Delimiter, SpecialComment, Debug]
  },
  Cyan = {
  },
  Teal = {
    -- syntax
    { Name = "Todo" }, -- extra attention
    { Name = "Underlined" }, -- outstanding text, html links
    { Name = "Search", Value = { standout = true } },
  },
  Green = {
  },
  LightGreen = {
    { Name = "NvimTreeOpenedFile" },

    { Name = "Title" }, -- titles in MD etc
    { Name = "Type" }, -- [StorageClass, Structure, Typedef]
  },
  Lime = {
  },
  Yellow = {
    { Name = "NvimTreeSpecialFile" },

    { Name = "DiagnosticWarn" },

    -- UI
    { Name = "WarningMsg" },

    -- syntax
    { Name = "Function" }, -- function names
  },
  Amber = {
  },
  Orange = {
    { Name = "NvimTreeImageFile" },

    -- syntax
    { Name = "String" },
    { Name = "Character" },
    { Name = "Number" },
    { Name = "Boolean" },
    { Name = "Float" },
    { Name = "Special" }, -- any special symbol
  },
  DeepOrange = {
  },
  Brown = {
    { Name = "Folded", Value = {} },
  },
  BlueGray = {
    { Name = "Comment" },
  },
}

for col_name, values in pairs(conf) do
  for i, v in ipairs(values) do
    if v.Value then
      value = v.Value
    else 
      value = { bg = c.None }
    end

    value.fg = c[col_name]

    vim.api.nvim_set_hl(0, v.Name, value)
  end
end

vim.api.nvim_set_hl(0, "CursorLine", { bg = c.None })

