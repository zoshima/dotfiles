vim.cmd("colorscheme vscode")

local c = require('vscode.colors')

require("vscode").setup({
  transparent = true,
  disable_nvimtree_bg = true,
  group_overrides = {
    -- status line
    EndOfBuffer = { fg = c.vscLineNumber },
    StatusLine = { fg = c.vscLineNumber },
    StatusLineNC = { fg = c.vscLineNumber },
    StatusLineFileName = { fg = c.vscYellowOrange },
    StatusLineModified = { fg = c.vscYellowOrange },
    -- lsp diagnostics
    LspDiagnosticsDefaultError = { fg = c.vscLightRed },
    LspDiagnosticsSignError = { fg = c.vscLightRed },
    LspDiagnosticsDefaultWarning = { fg = c.vscYellow },
    LspDiagnosticsSignWarning = { fg = c.vscYellow },
    -- nvim tree
    NvimTreeRootFolder = { fg = c.vscGray },
    NvimTreeFolderName = { fg = c.vscBlue },
    NvimTreeOpenedFolderName = { fg = c.vscLightBlue },
    NvimTreeEmptyFolderName = { fg = c.vscLightBlue },
    NvimTreeSpecialFile = { fg = c.vscLightGreen },
    NvimTreeExecFile = { fg = c.vscLightRed },
    NvimTreeSymlink = { fg = c.vscOrange },
    NvimTreeOpenedFile = { fg = c.vscPink },
    NvimTreeImageFile = { fg = c.vscYellow },
    -- tab line
    TabLine = { fg = c.vscLineNumber },
    TabLineFill = { fg = c.vscLineNumber },
    TabLineSel = { fg = c.vscYellowOrange },
  }
})


-- vim.highlight.create('EndOfBuffer', { guibg = 0, guifg = c.vscLineNumber })
-- vim.highlight.create('StatusLine', { guibg = 0, guifg = c.vscLineNumber })
-- vim.highlight.create('StatusLineNC', { guibg = 0, guifg = c.vscLineNumber })
-- vim.highlight.create('StatusLineFileName', { guibg = 0, guifg = c.vscYellowOrange })
-- vim.highlight.create('StatusLineModified', { guibg = 0, guifg = c.vscYellowOrange })

-- vim.highlight.create('TabLine', { guibg = 0, guifg = c.vscLineNumber })
-- vim.highlight.create('TabLineFill', { guibg = 0, guifg = c.vscLineNumber })
-- vim.highlight.create('TabLineSel', { guibg = 0, guifg = c.vscYellowOrange })

-- vim.highlight.create('LspDiagnosticsDefaultError', { guibg = 0, guifg = c.vscLightRed })
-- vim.highlight.create('LspDiagnosticsSignError', { guibg = 0, guifg = c.vscLightRed })
-- vim.highlight.create('LspDiagnosticsDefaultWarning', { guibg = 0, guifg = c.vscYellow })
-- vim.highlight.create('LspDiagnosticsSignWarning', { guibg = 0, guifg = c.vscYellow })

-- vim.highlight.create('SignColumn', { guibg = 0 })
-- vim.highlight.create('StatusLine', { guibg = 0 })
-- vim.highlight.create('CursorLineNr', { guibg = 0 })
--
-- vim.highlight.create('VertSplit', { guifg = c.vscLightRed })
-- vim.highlight.create('SignatureMarkText', { guibg = 0, guifg = c.vscPink })

-- vim.highlight.create('NvimTreeRootFolder', { guibg = 0, guifg = c.vscGray })
-- vim.highlight.create('NvimTreeFolderName', { guibg = 0, guifg = c.vscBlue })
-- vim.highlight.create('NvimTreeOpenedFolderName', { guibg = 0, guifg = c.vscLightBlue })
-- vim.highlight.create('NvimTreeEmptyFolderName', { guibg = 0, guifg = c.vscLightBlue })
-- vim.highlight.create('NvimTreeSpecialFile', { guibg = 0, guifg = c.vscLightGreen })
-- vim.highlight.create('NvimTreeExecFile', { guibg = 0, guifg = c.vscLightRed })
-- vim.highlight.create('NvimTreeSymlink', { guibg = 0, guifg = c.vscOrange })
-- vim.highlight.create('NvimTreeOpenedFile', { guibg = 0, guifg = c.vscPink })
-- vim.highlight.create('NvimTreeImageFile', { guibg = 0, guifg = c.vscYellow })

-- vim.highlight.create('NvimTreeIndentMarker', { guibg = 0, guifg = c.vscYellow })
