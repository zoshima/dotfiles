local c = require('colorscheme.colors')

local conf = {
  None = {
    { Name = "NonText" },

    { Name = "Underlined", Value = { underline = true } },

    { Name = "PmenuThumb", Value = { bg = c.Gray } },
    { Name = "PmenuSbar", Value = { bg = c.Gray } },
    { Name = "Visual", Value = { bg = c.Gray } },
    { Name = "VisualNOS", Value = { bg = c.Gray } },
  },
  Black = {
    { Name = "Search", Value = { bg = c.Yellow } },
    { Name = "PmenuSel", Value = { bg = c.White } },
  },
  White = {
    { Name = "Identifier" },
    { Name = "Constant" },

    { Name = "CursorLineNr" },
    { Name = "Normal"},
    { Name = "Pmenu", Value = { bg = c.Black } },
    { Name = "Folded", Value = { bg = c.Black } },
    { Name = "StatusLineFileName" },
    { Name = "Operator" },
    { Name = "SpecialChar" },
    { Name = "Tag" },
    { Name = "Delimiter" },
    { Name = "Debug" },
    { Name = "Conceal"},
    { Name = "Ignore" },
  },
  Gray = {
    { Name = "EndOfBuffer" },
    { Name = "LineNr"},
    { Name = "VertSplit" },
    { Name = "StatusLineNC" },
    { Name = "Whitespace" },
    { Name = "NvimTreeRootFolder" },
    { Name = "StatusLine"},
  },
  Red = {
    { Name = "SpellBad", Value = { undercurl = true, sp = c.Red } },
    { Name = "SpellCap", Value = { undercurl = true, sp = c.Red } },
    { Name = "SpellRare", Value = { undercurl = true, sp = c.Red } },
    { Name = "SpellLocal", Value = { undercurl = true, sp = c.Red } },

    { Name = "Error", Value = { undercurl = true, sp = c.Red } },
    { Name = "Exception" },

    { Name = "ErrorMsg"},
    { Name = "WarningMsg", Value = { bold = true } },

    { Name = "DiagnosticError" },
    { Name = "NvimTreeExecFile" },
  },
  Green = {
    { Name = "Comment" },
    { Name = "SpecialComment" },
  },
  Yellow = {
    { Name = "String" },
    { Name = "Character" },
    { Name = "Number" },
    { Name = "Boolean" },
    { Name = "Float" },
    { Name = "Special" },

    { Name = "NvimTreeSymlink" },
  },
  Blue = {
    { Name = "Function" },

    { Name = "StorageClass" },
    { Name = "Structure" },

    { Name = "DiagnosticInfo" },

    { Name = "NvimTreeFolderName" },
    { Name = "NvimTreeOpenedFolderName" },
    { Name = "NvimTreeEmptyFolderName" },
    { Name = "NvimTreeOpenedFile" },
  },
  Magenta = {
    { Name = "StatusLineModified" },

    { Name = "Todo", Value = { bold = true } },

    { Name = "DiagnosticWarn" },
    { Name = "DiagnosticHint" },

    { Name = "NvimTreeSpecialFile" },
    { Name = "NvimTreeImageFile" },
  },
  Cyan = {
    { Name = "Include" },
    { Name = "Label" },
    { Name = "PreProc" },
    { Name = "Define" },
    { Name = "Macro" },
    { Name = "Keyword" },
    { Name = "Statement" },
    { Name = "Conditional" },
    { Name = "Repeat" },
  },
  Teal = {
    { Name = "Type" },
    { Name = "Typedef" },
  }
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

