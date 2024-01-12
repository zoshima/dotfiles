-- :h group-name
-- :h cterm-colors

local syntax_colors = {
  White = {
    "Identifier",
    "Delimiter", -- Special group
  },
  DarkGray = {
    "NonText", -- ~ at EOF
    "Comment",
  },
  Green = {
    "Constant",
  },
  Yellow = {
    "Function", -- Identifier group
  },
  Brown = {
    "Todo",
  },
  Magenta = {
    "Special",
  },
  Blue = {
    "@type.builtin",
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

for col_name, values in pairs(syntax_colors) do
  for _, v in ipairs(values) do
    local value

    value = { ctermbg = "NONE" }
    value.ctermfg = col_name

    vim.api.nvim_set_hl(0, v, value)
  end
end

-- ui
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "Black" })
vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = "Black" })
vim.api.nvim_set_hl(0, "PmenuThumb", { ctermbg = "Black", reverse = true })
vim.api.nvim_set_hl(0, "PmenuSel", { ctermbg = "Black", reverse = true })

vim.api.nvim_set_hl(0, "Visual", { ctermbg = "NONE", reverse = true })
vim.api.nvim_set_hl(0, "Visual", { ctermbg = "NONE", reverse = true })

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

vim.api.nvim_set_hl(0, "Underlined", { ctermfg = "Cyan", underline = true })

vim.api.nvim_set_hl(0, "Search", { ctermbg = "NONE", reverse = true })

-- diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { ctermfg = "Red" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "Red", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { ctermfg = "Yellow" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = "Yellow", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { ctermfg = "Blue" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { sp = "Blue", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticHint", { ctermfg = "Cyan" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { sp = "Cyan", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticOk", { ctermfg = "Green" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { sp = "Green", undercurl = true })

-- nvim tree stuff
vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { ctermbg = "NONE", ctermfg = "White" })
vim.api.nvim_set_hl(0, "NvimTreeExecFile", { ctermfg = "Red" })
vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { ctermfg = "Magenta" })
vim.api.nvim_set_hl(0, "NvimTreeSymlink", { ctermfg = "Cyan" })
vim.api.nvim_set_hl(0, "NvimTreeFolderName", { ctermfg = "Blue" })
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { ctermfg = "Blue" })
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", { ctermfg = "Blue" })

-- treesitter
vim.api.nvim_set_hl(0, "TreesitterContext", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", { ctermfg = "White" })

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
  },
  Constant = {
    "@constant.builtin",
  },
  Variable = {
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
}

for group_name, values in pairs(group_links) do
  for _, v in ipairs(values) do
    vim.api.nvim_set_hl(0, v, { link = group_name })
  end
end
