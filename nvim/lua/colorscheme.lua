local c = {
  None = "NONE",

  Black = 16,
  White = 15,

  LightGray = 7,
  Gray = 8,

  Red = 9,
  Green = 10,
  Yellow = 11,
  Blue = 12,
  Purple = 13,
  Cyan = 14,
}

local conf = {
  None = {
    { Name = "CursorLine" },
    { Name = "TabLine" },
    { Name = "TabLineFill" },
    { Name = "Float" },
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
    { Name = "Operator" }, -- >, = etc
    { Name = "Identifier" },
    { Name = "Delimiter" },
  },
  Black = {
  },
  Gray = {
    -- UI
    { Name = "TabLine" },
    { Name = "StatusLine",   Value = { nocombine = true } },
    { Name = "StatusLineNC" },
    { Name = "LineNr" },
    { Name = "NonText" },
    { Name = "VertSplit" },
    { Name = "MsgSeparator", Value = { underline = true } },

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
    { Name = "Special" },    -- [SpecialChar, Tag, Delimiter, SpecialComment, Debug]
  },
  Cyan = {
    { Name = "DiagnosticHint" },
    { Name = "NvimTreeSymlink" },

    -- syntax
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
    { Name = "@type.qualifier" },
    { Name = "@storageclass" },
  },
  Type = {
    { Name = "@namespace" },
  },
  Constant = {
    { Name = "@constant.builtin" },
  },
  Variable = {
    { Name = "@variable.builtin" },
  },
  Function = {
    { Name = "@function.macro" },
    { Name = "@function.builtin" },
    { Name = "@constructor" },
  },
  Special = {
    { Name = "@string.escape" },
  },
  Float = {
    { Name = "NvimTreeNormalFloat" },
  },
  Comment = {
  },
}

for group_name, values in pairs(tsconf) do
  for _, v in ipairs(values) do
    vim.api.nvim_set_hl(0, v.Name, { link = group_name })
  end
end
