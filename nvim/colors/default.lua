vim.cmd.highlight('clear')
vim.g.colors_name = 'default'

-- colorscheme
-- syntax (:h -colors, :h group-name)
vim.api.nvim_set_hl(0, "Comment", { ctermfg = "Gray", });
vim.api.nvim_set_hl(0, "Constant", { ctermfg = "Green", });
vim.api.nvim_set_hl(0, "Identifier", { link = "Normal" });
vim.api.nvim_set_hl(0, "Function", { ctermfg = "Yellow", });
vim.api.nvim_set_hl(0, "Statement", { ctermfg = "Red" });
vim.api.nvim_set_hl(0, "Operator", { ctermfg = "LightRed" });
vim.api.nvim_set_hl(0, "PreProc", { link = "Normal" });
vim.api.nvim_set_hl(0, "Type", { ctermfg = "Cyan" });
vim.api.nvim_set_hl(0, "Special", { ctermfg = "Magenta" });
vim.api.nvim_set_hl(0, "Delimiter", { ctermfg = "LightMagenta" });
vim.api.nvim_set_hl(0, "Underlined", { underline = true });
vim.api.nvim_set_hl(0, "Ignore", { ctermfg = "DarkGray", });
vim.api.nvim_set_hl(0, "Error", { ctermfg = "Red", });
vim.api.nvim_set_hl(0, "Todo", { ctermfg = "Brown", });
vim.api.nvim_set_hl(0, "Added", { ctermfg = "Green", });
vim.api.nvim_set_hl(0, "Changed", { ctermfg = "Yellow", });
vim.api.nvim_set_hl(0, "Removed", { ctermfg = "Red", });

-- ui (:h highlight-groups)
vim.api.nvim_set_hl(0, "Normal", { ctermfg = "White" })
vim.api.nvim_set_hl(0, "Cursor", { reverse = true })
vim.api.nvim_set_hl(0, "NonText", { ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "Directory", { ctermfg = "Blue", bold = true })
vim.api.nvim_set_hl(0, "Visual", { reverse = true })
vim.api.nvim_set_hl(0, "StatusLine", {ctermbg = "Black", ctermfg = "White" })
vim.api.nvim_set_hl(0, "StatusLineNC", { ctermbg = "Black", ctermfg = "DarkGray" })
vim.api.nvim_set_hl(0, "Search", { ctermbg = "Brown", ctermfg = "White" })
vim.api.nvim_set_hl(0, "CurSearch", { link = "Search" })
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "Black" })
vim.api.nvim_set_hl(0, "PmenuSel", { reverse = true })
vim.api.nvim_set_hl(0, "PmenuMatch", { ctermfg = "Brown" })
vim.api.nvim_set_hl(0, "PmenuMatchSel", { reverse = true })
vim.api.nvim_set_hl(0, "PmenuThumb", { link = "PmenuSel" })
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Normal" })
vim.api.nvim_set_hl(0, "LineNr", { link = "NonText" })
vim.api.nvim_set_hl(0, "WinSeparator", { link = "NonText" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "NonText" })
vim.api.nvim_set_hl(0, "MatchParen", { ctermbg = "DarkGray" })

-- diagnostics (:h diagnostic-highlights)
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { link = "SpellCap" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { link = "SpellRare" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { link = "SpellRare" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { link = "SpellLocal" })

-- treesitter (:h treesitter-highlight-groups)
vim.api.nvim_set_hl(0, "@module", { link = "Identifier" });
vim.api.nvim_set_hl(0, "@module.builtin", { link = "@module" });
vim.api.nvim_set_hl(0, "@type.builtin", { ctermfg = "Blue" });
vim.api.nvim_set_hl(0, "@constructor", { link = "@function" });
vim.api.nvim_set_hl(0, "@tag", { link = "Type" });
vim.api.nvim_set_hl(0, "@tag.builtin", { link = "@tag" });
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "@constant" });
vim.api.nvim_set_hl(0, "@function.builtin", { link = "@function" });
vim.api.nvim_set_hl(0, "@variable.builtin", { link = "@variable" });
