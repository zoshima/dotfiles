local c = require('colorscheme.colors')

local conf = {
  None = {
    { Name = "Pmenu",      Value = { bg = c.Gray } },
    { Name = "PmenuThumb", Value = { bg = c.White } },
    { Name = "PmenuSbar",  Value = { bg = c.Gray } },
    { Name = "PmenuSel",   Value = { reverse = true } },
    { Name = "Visual",     Value = { bg = c.Gray } },
    { Name = "VisualNOS",  Value = { bg = c.Gray } },
  },
  White = {
    -- UI
    { Name = "Normal" },
    { Name = "CursorLineNr" },
    { Name = "StatusLineFileName" },

    -- syntax
    { Name = "Operator" },   -- >, = etc
    { Name = "Identifier" }, -- [Identifier, Function]
    { Name = "Constant" },   -- [String, Character, Number, Boolean, Float]
    { Name = "Delimiter" },
  },
  Gray = {
    { Name = "DiagnosticHint" },
    { Name = "TelescopeBorder" },

    -- UI
    { Name = "StatusLine",     Value = { nocombine = true } },
    { Name = "StatusLineNC" },
    { Name = "LineNr" },
    { Name = "NonText" },
    { Name = "VertSplit" },

    -- syntax
    { Name = "Ignore" }, -- blank, hidden, ignored
    { Name = "Comment" },
    { Name = "Folded",         Value = {} },
  },

  Red = {
    { Name = "NvimTreeExecFile" },
    { Name = "DiagnosticError" },

    -- UI
    { Name = "ErrorMsg" }, -- err in output

    -- syntax
    { Name = "Error" }, -- any erronous construct
  },
  Green = {
    { Name = "NvimTreeOpenedFile" },

    { Name = "Title" }, -- titles in MD etc
    { Name = "Type" },  -- [StorageClass, Structure, Typedef]
  },
  Blue = {
    { Name = "DiagnosticInfo" },

    { Name = "NvimTreeSymlink" },
    { Name = "NvimTreeFolderName" },
    { Name = "NvimTreeOpenedFolderName" },
    { Name = "NvimTreeEmptyFolderName" },

    -- syntax
    { Name = "PreProc" },   -- [Include, Define, Macro, PreCondit]
    { Name = "Statement" }, -- [Conditional, Repeat, Label, Operator, Keyword, Exception]
    { Name = "Special" },   -- [SpecialChar, Tag, Delimiter, SpecialComment, Debug]
  },

  Pink = {
    -- syntax
    { Name = "Todo" },       -- extra attention
    { Name = "Underlined" }, -- outstanding text, html links
    { Name = "Search",    Value = { standout = true } },
  },
  Yellow = {
    { Name = "NvimTreeSpecialFile" },

    { Name = "DiagnosticWarn" },

    -- UI
    { Name = "WarningMsg" },

    -- syntax
    { Name = "Function" }, -- function names
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
}

for col_name, values in pairs(conf) do
  for _, v in ipairs(values) do
    local value

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
