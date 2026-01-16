vim.cmd.highlight('clear')
vim.g.colors_name = 'default'

-- material colors (gui)
local white= "#FFFFFF"
local black= "#000000"
local gray = "#9E9E9E"
local dark_gray = "#9E9E9E"

local red= "#EF5350"
local green= "#66BB6A"
local blue= "#42A5F5"
local yellow= "#FFEE58"
local cyan= "#26C6DA"
local magenta = "#EC407A"
local brown= "#8D6E63"

local background = "#131314"

-- colorscheme
-- :h group-name
vim.api.nvim_set_hl(0, "Comment", { ctermfg = "Gray", fg = gray })
vim.api.nvim_set_hl(0, "Constant", { ctermfg = "Green", fg = green })
vim.api.nvim_set_hl(0, "String", { link = "Constant" })
vim.api.nvim_set_hl(0, "Identifier", { ctermfg = "White", fg = white })
vim.api.nvim_set_hl(0, "Function", { ctermfg = "Yellow", fg = yellow })
vim.api.nvim_set_hl(0, "Statement", { ctermfg = "Red", fg = red })
vim.api.nvim_set_hl(0, "PreProc", { ctermfg = "Blue", fg = blue })
vim.api.nvim_set_hl(0, "Type", { ctermfg = "Cyan", fg = cyan })
vim.api.nvim_set_hl(0, "Special", { ctermfg = "Magenta", fg = magenta })
vim.api.nvim_set_hl(0, "Underlined", { ctermfg = "NONE", fg = "NONE", underline = true })
vim.api.nvim_set_hl(0, "Added", { ctermfg = "Green", fg = green })
vim.api.nvim_set_hl(0, "Changed", { ctermfg = "Yellow", fg = yellow })
vim.api.nvim_set_hl(0, "Removed", { ctermfg = "Red", fg = red })
vim.api.nvim_set_hl(0, "Ignore", { ctermfg = "Gray", fg = gray })
vim.api.nvim_set_hl(0, "Error", { ctermfg = "Red", fg = red })
vim.api.nvim_set_hl(0, "Todo", { ctermfg = "Brown", fg = brown })

-- :h highlight-groups
vim.api.nvim_set_hl(0, "Normal", { ctermfg = "White", fg = white, bg = background })
vim.api.nvim_set_hl(0, "Cursor", { reverse = true })
vim.api.nvim_set_hl(0, "CursorLine", { })
vim.api.nvim_set_hl(0, "Directory", { ctermfg = "Blue", fg = blue, bold = true }) 
vim.api.nvim_set_hl(0, "LineNr", { ctermfg = "DarkGray", fg = dark_gray }) 
vim.api.nvim_set_hl(0, "CursorLineNr", { ctermfg = "White", fg = white }) 
vim.api.nvim_set_hl(0, "MatchParen", { underline = true }) 
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "Black", bg = black }) 
vim.api.nvim_set_hl(0, "PmenuSel", { reverse = true }) 
vim.api.nvim_set_hl(0, "PmenuMatch", { link = "Search" }) 
vim.api.nvim_set_hl(0, "QuickFixLine", { reverse = true }) 
vim.api.nvim_set_hl(0, "WinSeparator", { ctermfg = "DarkGray", fg = dark_gray }) 
vim.api.nvim_set_hl(0, "Search", { reverse = true }) 
vim.api.nvim_set_hl(0, "CurSearch", { reverse = true }) 
vim.api.nvim_set_hl(0, "IncSearch", { link = "CurSearch" })
vim.api.nvim_set_hl(0, "StatusLine", { ctermfg = "White", ctermbg = "Black", fg = white, bg = black }) 
vim.api.nvim_set_hl(0, "StatusLineNC", { ctermfg = "DarkGray", ctermbg = "Black", fg = dark_gray, bg=black }) 
vim.api.nvim_set_hl(0, "StatusLineTerm", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "StatusLineTermNC", { link = "StatusLineNC" })
vim.api.nvim_set_hl(0, "TabLine", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "TabLineFill", { link = "StatusLineNC" })
vim.api.nvim_set_hl(0, "Title", { ctermfg = "White", fg = white, bold = true })
vim.api.nvim_set_hl(0, "NonText", { ctermfg = "DarkGray", fg=dark_gray })
vim.api.nvim_set_hl(0, "Visual", { reverse = true })
vim.api.nvim_set_hl(0, "ErrorMsg", { link = "Error" })
vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = "LightRed" })
vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = "LightBlue" })
vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = "LightGreen" })
vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = "LightMagenta" })
vim.api.nvim_set_hl(0, "DiffAdd", { ctermfg = "Green", fg = green })
vim.api.nvim_set_hl(0, "DiffChange", { ctermfg = "Yellow", fg = yellow })
vim.api.nvim_set_hl(0, "DiffDelete", { ctermfg = "Red", fg = red })
vim.api.nvim_set_hl(0, "DiffText", { reverse = true })
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = "Black", bg = black })

-- diagnostics (:h diagnostic-highlights)
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { link = "SpellCap" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { link = "SpellRare" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { link = "SpellRare" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { link = "SpellLocal" })

-- treesitter (:h treesitter-highlight-groups)
vim.api.nvim_set_hl(0, "@module", { link = "Identifier" });
vim.api.nvim_set_hl(0, "@module.builtin", { link = "@module" });
vim.api.nvim_set_hl(0, "@type.builtin", { ctermfg = "Blue", fg = blue });
vim.api.nvim_set_hl(0, "@constructor", { link = "@function" });
vim.api.nvim_set_hl(0, "@tag", { link = "Type" });
vim.api.nvim_set_hl(0, "@tag.builtin", { link = "@tag" });
vim.api.nvim_set_hl(0, "@tag.angular", { link = "@tag" });
vim.api.nvim_set_hl(0, "@tag.attribute", { link = "@type.builtin" });
vim.api.nvim_set_hl(0, "@constant.builtin", { link = "@constant" });
vim.api.nvim_set_hl(0, "@function.builtin", { link = "@function" });
vim.api.nvim_set_hl(0, "@variable.builtin", { link = "@variable" });

-- markdown
vim.api.nvim_set_hl(0, "@markup.heading.1", { ctermfg = "Red", fg = red, bold = true });
vim.api.nvim_set_hl(0, "@markup.heading.2", { ctermfg = "Green", fg = green, bold = true });
vim.api.nvim_set_hl(0, "@markup.heading.3", { ctermfg = "Blue", fg = blue, bold = true });
vim.api.nvim_set_hl(0, "@markup.link.label", { ctermfg = "White", fg = white, bold = true });
vim.api.nvim_set_hl(0, "@markup.link.url", { ctermfg = "Blue", fg = blue, italic = true });
