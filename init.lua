-- options
vim.opt.foldenable = false
vim.opt.termguicolors = false
vim.opt.signcolumn = "number"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pumheight = 5
vim.opt.swapfile = false
vim.opt.shadafile = "NONE"
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "nv"
vim.opt.mousemodel = "extend"
vim.opt.scrolloff = 1
vim.opt.path:append("**/*")
vim.opt.winborder = "rounded"
vim.opt.completeopt = { "menuone", "noselect", "fuzzy" }
vim.opt.listchars = { tab = "<>", space = "_", eol = "$" }
vim.opt.fillchars = { msgsep = "─", stl = "─", stlnc = "─" }
vim.opt.statusline = "%!v:lua.StatusLine()"

-- keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
vim.keymap.set("n", "<Space>e", ":Ex<CR>")
vim.keymap.set("n", "<Space>p", ":find ")
vim.keymap.set("n", "<Space>f", ":silent grep! ")
vim.keymap.set("n", "<Space>b", ":ls<CR>:b ")
vim.keymap.set("n", "<Space>yp", function()
  local file_path = vim.fn.expand('%:p')
  vim.fn.setreg('+', file_path)
  vim.notify("\"" .. file_path .. "\" yanked to clipboard", vim.log.levels.INFO)
end)

-- autocmd
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { "*.json", "*.css", "*.scss", "*.html", },
  callback = function()
    vim.cmd(":silent !npx prettier % --write")
  end,
})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function()
    vim.cmd("redrawstatus")
  end
})

-- lsp
vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  root_markers = { ".git" },
  filetypes = { "sh" }
}
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  root_markers = { "go.mod", "go.work", ".git" },
  filetypes = { "go" }
}
vim.lsp.config.tsls = {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  filetypes = { "typescript", "javascript" }
}
vim.lsp.config.luals = {
  cmd = { "lua-language-server" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', },
      workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } }
    }
  }
}
vim.lsp.enable({ "bashls", "luals", "gopls", "tsls" })

-- colorscheme
-- syntax (:h cterm-colors, :h group-name)
vim.api.nvim_set_hl(0, "Comment", { ctermfg = "Gray", });
vim.api.nvim_set_hl(0, "Constant", { ctermfg = "Green", });
vim.api.nvim_set_hl(0, "Identifier", { link = "Normal" });
vim.api.nvim_set_hl(0, "Function", { ctermfg = "Yellow", });
vim.api.nvim_set_hl(0, "Statement", { ctermfg = "Red", });
vim.api.nvim_set_hl(0, "Operator", { link = "Normal", });
vim.api.nvim_set_hl(0, "PreProc", { ctermfg = "Gray", });
vim.api.nvim_set_hl(0, "Type", { ctermfg = "Cyan", });
vim.api.nvim_set_hl(0, "Special", { ctermfg = "Magenta" });
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
vim.api.nvim_set_hl(0, "StatusLine", { link = "NonText" })
vim.api.nvim_set_hl(0, "StatusLineNC", { link = "StatusLine" })
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "Black" })
vim.api.nvim_set_hl(0, "PmenuSel", { reverse = true })
vim.api.nvim_set_hl(0, "PmenuThumb", { link = "PmenuSel" })
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "Normal" })
vim.api.nvim_set_hl(0, "LineNr", { link = "NonText" })
vim.api.nvim_set_hl(0, "WinSeparator", { link = "NonText" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "NonText" })
vim.api.nvim_set_hl(0, "MatchParen", {})
-- diagnostics (:h diagnostic-highlights)
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { link = "SpellBad" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { link = "SpellCap" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { link = "SpellRare" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { link = "SpellRare" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineOk", { link = "SpellLocal" })
-- treesitter (:h treesitter-highlight-groups)
vim.api.nvim_set_hl(0, "@constructor", { link = "@function" });
vim.api.nvim_set_hl(0, "@tag", { link = "@type.builtin" });
vim.api.nvim_set_hl(0, "@type.builtin", { ctermfg = "Blue", italic = true });
vim.api.nvim_set_hl(0, "@constant.builtin", { ctermfg = "Green", italic = true });
vim.api.nvim_set_hl(0, "@function.builtin", { ctermfg = "Yellow", italic = true });
vim.api.nvim_set_hl(0, "@variable.builtin", { italic = true });

-- treesitter
require("nvim-treesitter.configs").setup({ highlight = { enable = true } })

-- statusline
function StatusLine()
  local winid = vim.api.nvim_get_current_win()
  local bufid = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local dc = vim.diagnostic.count(bufid)
  local s = vim.diagnostic.severity

  local filename = winid == vim.g.statusline_winid and "[%#Normal#%f%*]" or "[%f]"
  local diagnostics = string.format("%s%s%s%s",
    dc[s.ERROR] and "[%#DiagnosticError#" .. dc[s.ERROR] .. "e%*]" or "",
    dc[s.WARN] and "[%#DiagnosticWarn#" .. dc[s.WARN] .. "w%*]" or "",
    dc[s.INFO] and "[%#DiagnosticInfo#" .. dc[s.INFO] .. "i%*]" or "",
    dc[s.HINT] and "[%#DiagnosticHint#" .. dc[s.HINT] .. "h%*]" or ""
  )

  return "%m%r" .. filename .. "[%l:%c]%=" .. diagnostics .. "%y"
end
