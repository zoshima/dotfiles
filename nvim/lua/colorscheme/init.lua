local c = require('colorscheme.colors')
c["None"] = "NONE"
c["Black"] = "#000000"
c["White"] = "#FFFFFF"
c["Gray"] = "#616161"

local conf = {
  None = {
    { Name = "PmenuThumb", Value = { bg = c.Gray } },
    { Name = "PmenuSbar", Value = { bg = c.Gray } },
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
    { Name = "Pmenu" },
    { Name = "PmenuSel", Value = { reverse = true } },

    -- syntax
    { Name = "Delimiter" }, -- (), [], {} etc
    { Name = "Operator" }, -- >, = etc
    { Name = "Identifier" }, -- variable names
    { Name = "Constant" }, -- String, Character, Number etc...
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
    -- syntax
    { Name = "Todo" }, -- extra attention
    { Name = "Underlined" }, -- outstanding text, html links
  },
  Indigo = {
  },
  Blue = {
    { Name = "DiagnosticInfo" },

    { Name = "PreProc" }, -- #include, #define
    { Name = "Statement" }, -- if, then, for, while, case
  },
  LightBlue = {
    { Name = "NvimTreeSymlink" },
    { Name = "NvimTreeFolderName" },
    { Name = "NvimTreeOpenedFolderName" },
    { Name = "NvimTreeEmptyFolderName" },

    -- syntax
    { Name = "Title" }, -- titles in MD etc
    { Name = "Type" }, -- int, long, char...
  },
  Cyan = {
  },
  Teal = {
  },
  Green = {
    { Name = "NvimTreeOpenedFile" },

    -- syntax
    { Name = "Comment" },
  },
  LightGreen = {
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
    { Name = "Special" }, -- any special symbol
  },
  Amber = {
    { Name = "Search", Value = { standout = true } },
  },
  Orange = {
    { Name = "NvimTreeImageFile" },

    -- syntax
    { Name = "String" },
    { Name = "Character" },
    { Name = "Number" },
    { Name = "Boolean" },
    { Name = "Float" },
  },
  DeepOrange = {
  },
  Brown = {
    { Name = "Folded", Value = {} },
  },
  BlueGray = {
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

