vim.cmd("colorscheme vscode")

local c = require('vscode.colors')

-- vim.highlight.create('EndOfBuffer', { guibg = 0, guifg = c.vscLineNumber })

require("vscode").setup({
  transparent = true,
  disable_nvimtree_bg = true,
  group_overrides = {
    ModeMsg = { fg = c.vscGray },
    -- MsgArea = { fg = c.vscGray },
    -- status line
    EndOfBuffer = { fg = c.vscLineNumber },
    StatusLine = { fg = "#5b5b5b", bg = c.vscNone },
    StatusLineNC = { fg = c.vscLineNumber },
    StatusLineFileName = { fg = c.vscFront },
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
