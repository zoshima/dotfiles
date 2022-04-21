vim.g.vscode_style = "dark"
vim.g.vscode_transparent = 1
vim.g.vscode_disable_nvimtree_bg = true

vim.cmd("colorscheme vscode")

local colors = require('vscode.colors')
local c = colors.generate()

vim.highlight.create('EndOfBuffer', { guibg = 0, guifg = c.vscLineNumber })
vim.highlight.create('StatusLine', { guibg = 0, guifg = c.vscLineNumber })
vim.highlight.create('StatusLineNC', { guibg = 0, guifg = c.vscLineNumber })
vim.highlight.create('StatusLineFileName', { guibg = 0, guifg = c.vscYellowOrange })
vim.highlight.create('StatusLineModified', { guibg = 0, guifg = c.vscYellowOrange })

vim.highlight.create('LspDiagnosticsDefaultError', { guibg = 0, guifg = c.vscLightRed })
vim.highlight.create('LspDiagnosticsSignError', { guibg = 0, guifg = c.vscLightRed })
vim.highlight.create('LspDiagnosticsDefaultWarning', { guibg = 0, guifg = c.vscYellow })
vim.highlight.create('LspDiagnosticsSignWarning', { guibg = 0, guifg = c.vscYellow })
-- vim.highlight.create('SignColumn', { guibg = 0 })
-- vim.highlight.create('StatusLine', { guibg = 0 })
-- vim.highlight.create('CursorLineNr', { guibg = 0 })
--
-- vim.highlight.create('VertSplit', { guifg = c.vscLightRed })
-- vim.highlight.create('SignatureMarkText', { guibg = 0, guifg = c.vscPink })
