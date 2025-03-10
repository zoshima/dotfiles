-- :h cterm-colors
-- :h group-name

-- syntax (builtin)
vim.api.nvim_set_hl(0, "Comment", { ctermfg = "Gray", });
vim.api.nvim_set_hl(0, "Constant", { ctermfg = "Green", });
vim.api.nvim_set_hl(0, "Identifier", { ctermfg = "White", });
vim.api.nvim_set_hl(0, "Function", { ctermfg = "Yellow", });
vim.api.nvim_set_hl(0, "Statement", { ctermfg = "Red", });
vim.api.nvim_set_hl(0, "Operator", { ctermfg = "Gray", });
vim.api.nvim_set_hl(0, "PreProc", { ctermfg = "Gray", });
vim.api.nvim_set_hl(0, "Type", { ctermfg = "Cyan", });
vim.api.nvim_set_hl(0, "Special", { ctermfg = "Magenta", });
vim.api.nvim_set_hl(0, "Tag", { ctermfg = "Blue", });
vim.api.nvim_set_hl(0, "Delimiter", { ctermfg = "Gray", });
vim.api.nvim_set_hl(0, "Underlined", { underline = true });
vim.api.nvim_set_hl(0, "Ignore", { ctermfg = "DarkGray", });
vim.api.nvim_set_hl(0, "Error", { ctermfg = "Red", });
vim.api.nvim_set_hl(0, "Todo", { ctermfg = "Brown", });
vim.api.nvim_set_hl(0, "Added", { ctermfg = "Green", });
vim.api.nvim_set_hl(0, "Changed", { ctermfg = "Yellow", });
vim.api.nvim_set_hl(0, "Removed", { ctermfg = "Red", });

-- syntax (treesitter)
vim.api.nvim_set_hl(0, "@constructor", { link = "Function" });
vim.api.nvim_set_hl(0, "@type.builtin", { ctermfg = "Blue", italic = true });
vim.api.nvim_set_hl(0, "@constant.builtin", { ctermfg = "Green", italic = true });
vim.api.nvim_set_hl(0, "@function.builtin", { ctermfg = "Yellow", italic = true });
vim.api.nvim_set_hl(0, "@variable.builtin", { ctermfg = "White", italic = true });
vim.api.nvim_set_hl(0, "@module", { link = "PreProc" });

-- ui
vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "StatusLineFileName", { ctermfg = "White" })
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "Black" })
vim.api.nvim_set_hl(0, "PmenuSel", { reverse = true })
vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = "Black" })
vim.api.nvim_set_hl(0, "PmenuThumb", { reverse = true })
vim.api.nvim_set_hl(0, "LineNr", { ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = "White" })
vim.api.nvim_set_hl(0, "Visual", { reverse = true })
vim.api.nvim_set_hl(0, "WinSeparator", { ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "MatchParen", { reverse = true })
vim.api.nvim_set_hl(0, "NonText", { ctermfg = "DarkGray" })

-- diagnostics
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "Red", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = "Yellow", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { sp = "Cyan", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { sp = "Blue", undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { sp = "Green", undercurl = true })
vim.fn.sign_define("DiagnosticSignError", { text = "", numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", numhl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignOk", { text = "", numhl = "DiagnosticSignOk" })
