-- :h group-name
-- :h cterm-colors

local syntax_colors = {
  White = {
    "Identifier",
    "Variable",
  },
  DarkGray = {
    "NonText", -- ~ at EOF
    "Comment",
  },
  LightGray = {
    "Delimiter", -- Special group
  },
  Green = {
    "Constant",
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
    "BuiltinType",
  },
  Cyan = {
    "Type",
  },
  LightRed = {
    "Operator", -- Statement group
  },
  Red = {
    "Statement",
    "PreProc",
    "Error",
  },
};

local ui_colors = {
  Pmenu = { bg = "Black", },
  PmenuSbar = { bg = "Black", },
  PmenuThumb = { bg = "Black", reverse = true, },
  PmenuSel = { bg = "Black", reverse = true, },
  NormalFloat = { bg = "Black", },
  FloatBorder = { bg = "DarkGray", },
  SignColumn = { bg = "NONE", },
  Visual = { bg = "NONE", reverse = true },
  TabLineFill = { fg = "DarkGray" },
  TabLineSel = { fg = "White" },
  StatusLine = { fg = "DarkGray", bg = "NONE" },
  StatusLineNC = { fg = "DarkGray", nocombine = true },
  StatusLineFileName = { fg = "White" },
  CursorLine = { bg = "DarkGray" },
  CursorLineNr = { fg = "White" },
  WinSeparator = { fg = "DarkGray" },
  MatchParen = { bold = true },
  LineNr = { fg = "DarkGray" },
  MsgSeparator = { fg = "DarkGray" },
  Underlined = { underline = true },
  Search = { bg = "NONE", reverse = true },
  DiagnosticError = { fg = "Red" },
  DiagnosticUnderlineError = { sp = "Red", undercurl = true },
  DiagnosticWarn = { fg = "Yellow" },
  DiagnosticUnderlineWarn = { sp = "Yellow", undercurl = true },
  DiagnosticInfo = { fg = "Blue" },
  DiagnosticUnderlineInfo = { sp = "Blue", undercurl = true },
  DiagnosticHint = { fg = "Cyan" },
  DiagnosticUnderlineHint = { sp = "Cyan", undercurl = true },
  DiagnosticOk = { fg = "Green" },
  DiagnosticUnderlineOk = { sp = "Green", undercurl = true },
  TreesitterContext = { bg = "NONE", nocombine = true },
  TreesitterContextLineNumber = { fg = "White" },
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
  BuiltinType = {
    "@type.builtin",
    "tag",
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
    "label"
  },
}

for col_name, values in pairs(syntax_colors) do
  for _, v in ipairs(values) do
    local value

    value = { bg = "NONE", ctermbg = "NONE" }
    value.fg = col_name
    value.ctermfg = col_name

    vim.api.nvim_set_hl(0, v, value)
  end
end

for group_name, values in pairs(ui_colors) do
  local result = {}

  for k, v in pairs(values) do
    if k == 'fg' then
      result.ctermfg = v
    elseif k == 'bg' then
      result.ctermbg = v
    end

    result[k] = v
  end

  vim.api.nvim_set_hl(0, group_name, result)
end

for group_name, values in pairs(group_links) do
  for _, v in ipairs(values) do
    vim.api.nvim_set_hl(0, v, { link = group_name })
  end
end
