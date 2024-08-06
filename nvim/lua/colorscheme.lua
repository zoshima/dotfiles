-- :h group-name
-- :h cterm-colors

-- standard material colors (500)
local gui_remap = {
  Black = "#212121",
  White = "#FFFFFF",
  Gray = "#9E9E9E",
  Green = "#4CAF50",
  Yellow = "#FDD835",
  Brown = "#795548",
  Magenta = "#E91E63",
  Blue = "#2196F3",
  Cyan = "#00BCD4",
  Red = "#F44336",
}

local syntax_colors = {
  White = {
    "Identifier",
    "Variable",
  },
  Gray = {
    "PreProc",
    "Delimiter", -- Special group
    "Operator",  -- Statement group
    "Comment",
    "NonText",   -- ~ at EOF
  },
  Green = {
    "Constant",
    "String",
    "Added",
  },
  Yellow = {
    "Function", -- Identifier group
    "Changed",
  },
  Brown = {
    "Todo",
  },
  Magenta = {
    "Special",
  },
  Blue = {
    "Tag", -- Special group
  },
  Cyan = {
    "Type",
  },
  Red = {
    "Statement",
    "Error",
    "Removed",
  },
};

local ui_colors = {
  Pmenu = { ctermbg = "Black", },
  PmenuSbar = { ctermbg = "Black", },
  PmenuThumb = { ctermbg = "Black", reverse = true, },
  PmenuSel = { ctermbg = "Black", reverse = true, },
  NormalFloat = { ctermbg = "NONE", },
  FloatBorder = { ctermfg = "Gray", ctermbg = "NONE" },
  SignColumn = { ctermbg = "NONE", },
  Visual = { ctermbg = "NONE", reverse = true },
  TabLineFill = { ctermfg = "Gray" },
  TabLineSel = { ctermfg = "White" },
  StatusLine = { ctermfg = "Gray", ctermbg = "NONE" },
  StatusLineNC = { ctermfg = "Gray", nocombine = true },
  StatusLineFileName = { ctermfg = "White" },
  CursorLine = { ctermbg = "Gray" },
  CursorLineNr = { ctermfg = "White" },
  WinSeparator = { ctermfg = "Gray" },
  MatchParen = { bold = true },
  LineNr = { ctermfg = "Gray" },
  MsgSeparator = { ctermfg = "Gray" },
  Underlined = { underline = true },
  Search = { ctermbg = "NONE", reverse = true },
  DiagnosticError = { ctermfg = "Red" },
  DiagnosticUnderlineError = { sp = "Red", undercurl = true },
  DiagnosticWarn = { ctermfg = "Yellow" },
  DiagnosticUnderlineWarn = { sp = "Yellow", undercurl = true },
  DiagnosticInfo = { ctermfg = "Blue" },
  DiagnosticUnderlineInfo = { sp = "Blue", undercurl = true },
  DiagnosticHint = { ctermfg = "Cyan" },
  DiagnosticUnderlineHint = { sp = "Cyan", undercurl = true },
  DiagnosticOk = { ctermfg = "Green" },
  DiagnosticUnderlineOk = { sp = "Green", undercurl = true },
  TreesitterContext = { ctermbg = "NONE", nocombine = true },
  TreesitterContextLineNumber = { ctermfg = "White" },
};

local group_links = {
  Error = {
    "ErrorMsg",
  },
  Warning = {
    "WarningMsg",
  },
  VertSplit = {
    "TelescopeBorder",
  },
  Search = {
    "TelescopeMatching",
  },
  Statement = {
    "@type.qualifier",
    "@storageclass",
  },
  Type = {
    "@tag.attribute"
  },
  Tag = {
    "@type.builtin",
  },
  Constant = {
    "@constant.builtin",
  },
  Variable = {
    "@variable",
    "@variable.builtin",
  },
  Function = {
    "@function.builtin",
    "@function.macro",
    "@constructor",
  },
  Special = {
    "@string.escape",
  },
  Todo = {
    "@comment.todo",
  },
  PreProc = {
    "@module",
  }
}

for col_name, values in pairs(syntax_colors) do
  for _, v in ipairs(values) do
    local value

    value = { bg = "NONE", ctermbg = "NONE" }
    value.fg = gui_remap[col_name] or col_name
    value.ctermfg = col_name

    vim.api.nvim_set_hl(0, v, value)
  end
end

for group_name, values in pairs(group_links) do
  for _, v in ipairs(values) do
    vim.api.nvim_set_hl(0, v, { link = group_name })
  end
end

for group_name, values in pairs(ui_colors) do
  local result = {}

  for k, v in pairs(values) do
    if k == 'ctermfg' then
      result.fg = gui_remap[v] or v
    elseif k == 'ctermbg' then
      result.bg = gui_remap[v] or v
    end

    result[k] = v
  end

  vim.api.nvim_set_hl(0, group_name, result)
end
