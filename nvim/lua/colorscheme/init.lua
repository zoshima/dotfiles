local c = {
  None = "NONE",
  White = "WHITE",

  Red = 1,
  Green = 2,
  Yellow = 3,
  Blue = 4,
  Purple = 5,
  Cyan = 6,
  LightGray = 7,
  Gray = 8,
}

local conf = {
  None = {
    { Name = "Pmenu",      Value = { ctermbg = c.Gray } },
    { Name = "PmenuThumb", Value = { ctermbg = c.White } },
    { Name = "PmenuSbar",  Value = { ctermbg = c.Gray } },
    { Name = "PmenuSel",   Value = { reverse = true } },
    { Name = "Visual",     Value = { ctermbg = c.Gray } },
    { Name = "VisualNOS",  Value = { ctermbg = c.Gray } },
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
  LightGray = {
  },
  Gray = {
    { Name = "DiagnosticHint" },

    -- plugin
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
    { Name = "DiagnosticError" },

    -- plugin
    { Name = "NvimTreeExecFile" },

    -- UI
    { Name = "ErrorMsg" }, -- err in output

    -- syntax
    { Name = "PreProc" },   -- [Include, Define, Macro, PreCondit]
    { Name = "Statement" }, -- [Conditional, Repeat, Label, Operator, Keyword, Exception]
    { Name = "Error" },     -- any erronous construct
  },
  Green = {
    -- plugin
    { Name = "NvimTreeOpenedFile" },

    -- syntax
    { Name = "String" },
    { Name = "Character" },
    { Name = "Number" },
    { Name = "Boolean" },
    { Name = "Float" },
  },
  Blue = {
    { Name = "DiagnosticInfo" },

    -- plugin
    { Name = "NvimTreeSymlink" },
    { Name = "NvimTreeFolderName" },
    { Name = "NvimTreeOpenedFolderName" },
    { Name = "NvimTreeEmptyFolderName" },

    -- syntax
    { Name = "Title" }, -- titles in MD etc
    { Name = "Type" },  -- [StorageClass, Structure, Typedef]
  },

  Purple = {
    -- syntax
    { Name = "Todo" },       -- extra attention
    { Name = "Underlined" }, -- outstanding text, html links
  },
  Cyan = {
    -- plugin
    { Name = "NvimTreeSpecialFile" },

    -- syntax
  },
  Yellow = {
    { Name = "DiagnosticWarn" },

    -- plugin
    { Name = "NvimTreeImageFile" },

    -- UI
    { Name = "WarningMsg" },

    -- syntax
    { Name = "Search",           Value = { standout = true } },
    { Name = "Function" }, -- function names
    { Name = "Special" },  -- [SpecialChar, Tag, Delimiter, SpecialComment, Debug]
  },
}

for col_name, values in pairs(conf) do
  for _, v in ipairs(values) do
    local value

    if v.Value then
      value = v.Value
    else
      value = { ctermbg = c.None }
    end

    value.ctermfg = c[col_name]

    vim.api.nvim_set_hl(0, v.Name, value)
  end
end

vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = c.None })
