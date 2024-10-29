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
  },
  Gray = {
    "Delimiter", -- Special group
    "Operator",  -- Statement group
    "Comment",
    "NonText",   -- ~ at EOF
    "PreProc",
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
  Normal = { ctermbg = "NONE", bg = "Black" },
  Pmenu = { ctermbg = "Black" },
  PmenuSbar = { ctermbg = "Black", },
  PmenuThumb = { ctermbg = "Black", reverse = true, },
  PmenuSel = { ctermbg = "White", ctermfg = "Black", },
  NormalFloat = { ctermbg = "Black", },
  FloatBorder = { ctermfg = "DarkGray", ctermbg = "NONE" },
  SignColumn = { ctermbg = "NONE", },
  Visual = { ctermbg = "NONE", reverse = true },
  TabLineFill = { ctermfg = "DarkGray", },
  TabLineSel = { ctermfg = "White", },
  StatusLine = { ctermfg = "DarkGray", },
  StatusLineNC = { ctermfg = "DarkGray", nocombine = true },
  StatusLineFileName = { ctermfg = "White" },
  CursorLineNr = { ctermfg = "White" },
  WinSeparator = { ctermfg = "DarkGray" },
  MatchParen = { ctermbg = "DarkGray" },
  LineNr = { ctermfg = "DarkGray" },
  MsgSeparator = { ctermfg = "DarkGray" },
  Underlined = { underline = true },
  Search = { ctermbg = "Yellow", ctermfg = "Black" },
  CurSearch = { ctermbg = "Yellow", ctermfg = "Black" },
  IncSearch = { reverse = true },
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
  Directory = { ctermfg = "Blue", bold = true }, -- Oil links to this...
  TelescopeResultsIdentifier = { ctermbg = "NONE" },
};

local group_links = {
  StatusLine = {
    "CopilotSuggestion",
  },
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
  PmenuSel = {
    "TelescopeSelection",
  },
  Statement = {
    "@type.qualifier",
    "@storageclass",
  },
  Type = {
    "@tag.attribute",
    "@type.builtin",
  },
  Constant = {
    "@constant.builtin",
  },
  Identifier = {
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
    "@module.builtin",
  },
}

for group_name, values in pairs(group_links) do
  for _, v in ipairs(values) do
    vim.api.nvim_set_hl(0, v, { link = group_name })
  end
end

for col_name, values in pairs(syntax_colors) do
  for _, v in ipairs(values) do
    local value

    value = { bg = "NONE", ctermbg = "NONE" }
    value.fg = gui_remap[col_name] or col_name
    value.ctermfg = col_name

    vim.api.nvim_set_hl(0, v, value)
  end
end

for group_name, values in pairs(ui_colors) do
  local result = {}

  for k, v in pairs(values) do
    result[k] = v
  end

  result.fg = gui_remap[result.fg] or gui_remap[result.ctermfg] or values.ctermfg
  result.bg = gui_remap[result.bg] or gui_remap[result.ctermbg] or values.ctermbg

  vim.api.nvim_set_hl(0, group_name, result)
end

local group_styles = {
  ["@type.builtin"] = { ctermfg = "Blue", italic = true },
  ["@constant.builtin"] = { italic = true },
  ["@variable.builtin"] = { italic = true },
  ["@variable.parameter.builtin"] = { italic = true },
  ["@function.builtin"] = { italic = true },
  ["@attribute.builtin"] = { italic = true },
  ["@module.builtin"] = { italic = true },
  ["@tag.builtin"] = { italic = true },
}

for group_name, styles in pairs(group_styles) do
  for style_name, style_value in pairs(styles) do
    local hl = vim.api.nvim_get_hl(0, { name = group_name, create = false, link = false })
    hl[style_name] = style_value

    ---@diagnostic disable-next-line: param-type-mismatch
    vim.api.nvim_set_hl(0, group_name, hl)
  end
end
