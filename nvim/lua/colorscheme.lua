-- :h group-name
-- :h gui-colors

local syntax_colors = {
  White = {
    "Identifier",
  },
  Cyan = {
  },
  DarkGray = {
    "NonText", -- ~ at EOF
    "Comment",
    "Ignore",
    "Operator",  -- Statement group
    "Delimiter", -- Special group
  },
  DarkGreen = {
    "Constant",
  },
  DarkRed = {
    "Statement",
    "PreProc",
    "Error",
  },
  DarkYellow = {
    "Function", -- Identifier group
  },
  Blue = {
    "Type",
  },
  Magenta = {
    "Special",
    "Underlined",
  },
  Brown = {
    "Todo",
  },
};

for col_name, values in pairs(syntax_colors) do
  for _, v in ipairs(values) do
    local value

    value = { ctermbg = "NONE" }
    value.ctermfg = col_name

    vim.api.nvim_set_hl(0, v, value)
  end
end

-- ui
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "DarkGray" })
vim.api.nvim_set_hl(0, "PmenuThumb", { ctermbg = "White" })
vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = "DarkGray" })
vim.api.nvim_set_hl(0, "PmenuSel", { reverse = true })

vim.api.nvim_set_hl(0, "TabLineFill", { ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "TabLineSel", { ctermfg = "White" })

vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = "DarkGray", nocombine = true })
vim.api.nvim_set_hl(0, "StatusLineFileName", { ctermfg = "White" })

vim.api.nvim_set_hl(0, "CursorLine", {})
vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = "White" })

vim.api.nvim_set_hl(0, "VertSplit", { ctermfg = "DarkGray" })

vim.api.nvim_set_hl(0, "LineNr", { ctermfg = "DarkGray" })

vim.api.nvim_set_hl(0, "MsgSeparator", { ctermfg = "DarkGray", underline = true })

vim.api.nvim_set_hl(0, "NormalFloat", {}) -- nvim tree float

-- links

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
    "@namespace",
  },
  Constant = {
    "@constant.builtin",
  },
  Variable = {
    "@variable.builtin",
  },
  Function = {
    "@function.macro",
    "@function.builtin",
    "@constructor",
  },
  Special = {
    "@string.escape",
  },
}

for group_name, values in pairs(group_links) do
  for _, v in ipairs(values) do
    vim.api.nvim_set_hl(0, v, { link = group_name })
  end
end
