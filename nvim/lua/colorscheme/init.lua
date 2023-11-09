local c = {
  None = "NONE",

  Black = 0,
  White = 15,
  Gray = 8,

  Red = 1,
  Green = 2,
  Yellow = 3,
  Blue = 4,
  Purple = 5,
  Cyan = 6,
}

local conf = {
  None = {
    { Name = "CursorLine" },
    { Name = "TabLineFill" },
    { Name = "Pmenu",      Value = { ctermbg = c.Gray } },
    { Name = "PmenuThumb", Value = { ctermbg = c.White } },
    { Name = "PmenuSbar",  Value = { ctermbg = c.Gray } },
    { Name = "PmenuSel",   Value = { reverse = true } },
    { Name = "Visual",     Value = { ctermbg = c.Gray } },
    { Name = "VisualNOS",  Value = { ctermbg = c.Gray } },
  },
  White = {
    -- UI
    { Name = "TabLineSel" },
    { Name = "Normal" },
    { Name = "CursorLineNr" },
    { Name = "StatusLineFileName" },

    -- syntax
    { Name = "Operator" },   -- >, = etc
    { Name = "Identifier" }, -- [Identifier, Function]
    { Name = "Delimiter" },
  },
  Black = {
  },
  Gray = {
    -- UI
    { Name = "TabLine" },
    { Name = "StatusLine",  Value = { nocombine = true } },
    { Name = "StatusLineNC" },
    { Name = "LineNr" },
    { Name = "NonText" },
    { Name = "VertSplit" },

    -- syntax
    { Name = "Ignore" }, -- blank, hidden, ignored
    { Name = "Comment" },
    { Name = "Folded" },
  },
  Red = {
    { Name = "DiagnosticError" },
    { Name = "NvimTreeExecFile" },

    -- UI
    { Name = "ErrorMsg" }, -- err in output

    -- syntax
    { Name = "PreProc" },   -- [Include, Define, Macro, PreCondit]
    { Name = "Statement" }, -- [Conditional, Repeat, Label, Operator, Keyword, Exception]
    { Name = "Error" },     -- any erronous construct
  },
  Green = {
    -- syntax
    { Name = "Constant" }, -- [String, Character, Number, Boolean, Float]
  },
  Yellow = {
    { Name = "DiagnosticWarn" },
    { Name = "NvimTreeSpecialFile" },

    -- UI
    { Name = "WarningMsg" },

    -- syntax
    { Name = "Function" }, -- function names
    { Name = "Special" },  -- [SpecialChar, Tag, Delimiter, SpecialComment, Debug]
    { Name = "Search",             Value = { standout = true } },
  },
  Blue = {
    { Name = "DiagnosticInfo" },
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
    { Name = "Spell" },
  },
  Cyan = {
    { Name = "DiagnosticHint" },
    { Name = "NvimTreeSymlink" },
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

-- plugin links

local tsconf = {
  VertSplit = {
    { Name = "TelescopeBorder" },
  },
  Search = {
    { Name = "TelescopeMatching" },
  },
  Statement = {
    { Name = "@type.qualifier" }
  },
  Constant = {
    { Name = "@constant.builtin" },
    { Name = "@variable.builtin" },
  },
}

for group_name, values in pairs(tsconf) do
  for _, v in ipairs(values) do
    vim.api.nvim_set_hl(0, v.Name, { link = group_name })
  end
end
