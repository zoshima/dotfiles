local c = {
  None = "NONE",

  Black = 0,
  BrightBlack = 8, -- gray

  Red = 1,
  BrightRed = 9,

  Green = 2,
  BrightGreen = 10,

  Yellow = 3,
  BrightYellow = 11,

  Blue = 4,
  BrightBlue = 12,

  Purple = 5,
  BrightPurple = 13,

  Cyan = 6,
  BrightCyan = 14,

  White = 6,        -- bright gray
  BrightWhite = 15, -- white
}

local conf = {
  None = {
    { Name = "CursorLine" },
    { Name = "Pmenu",      Value = { ctermbg = c.BrightBlack } },
    { Name = "PmenuThumb", Value = { ctermbg = c.BrightWhite } },
    { Name = "PmenuSbar",  Value = { ctermbg = c.BrightBlack } },
    { Name = "PmenuSel",   Value = { reverse = true } },
    { Name = "Visual",     Value = { ctermbg = c.BrightBlack } },
    { Name = "VisualNOS",  Value = { ctermbg = c.BrightBlack } },
  },

  White = {
  },
  BrightWhite = {
    -- UI
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
  BrightBlack = {
    -- UI
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
    -- syntax
    { Name = "PreProc" },   -- [Include, Define, Macro, PreCondit]
    { Name = "Statement" }, -- [Conditional, Repeat, Label, Operator, Keyword, Exception]
  },
  BrightRed = {
    { Name = "DiagnosticError" },

    -- UI
    { Name = "ErrorMsg" }, -- err in output

    -- syntax
    { Name = "Error" }, -- any erronous construct
  },

  Green = {
    -- syntax
    { Name = "Constant" }, -- [String, Character, Number, Boolean, Float]
  },
  BrightGreen = {
  },

  Yellow = {
    -- syntax
    { Name = "Function" }, -- function names
    { Name = "Special" },  -- [SpecialChar, Tag, Delimiter, SpecialComment, Debug]
    { Name = "Search",  Value = { standout = true } },
  },
  BrightYellow = {
    { Name = "DiagnosticWarn" },

    -- UI
    { Name = "WarningMsg" },
  },

  Blue = {
    -- syntax
    { Name = "Title" }, -- titles in MD etc
    { Name = "Type" },  -- [StorageClass, Structure, Typedef]
  },
  BrightBlue = {
    { Name = "DiagnosticInfo" },
  },

  Purple = {
    -- syntax
    { Name = "Todo" },       -- extra attention
    { Name = "Underlined" }, -- outstanding text, html links
  },
  BrightPurple = {
  },

  Cyan = {
  },
  BrightCyan = {
    { Name = "DiagnosticHint" },
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
