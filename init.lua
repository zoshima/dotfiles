-- options
vim.opt.foldenable = false
vim.opt.termguicolors = false
vim.opt.signcolumn = "number"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
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
vim.opt.statusline = "%!v:lua.StatusLine()"

-- keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
vim.keymap.set("n", "<Space>e", ":Ex<CR>")
vim.keymap.set("n", "<Space>p", ":find ")
vim.keymap.set("n", "<Space>f", ":silent grep! ")

-- autocmd
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    "bash", "go", "typescript", "javascript",
    "css", "scss", "html", "htmlangular",
    "json", "yaml"
  },
  callback = function() 
    vim.treesitter.start() 
  end,
})

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

vim.lsp.enable({ "gopls", "tsls" })

-- statusline
function StatusLine()
  local bufid = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local clients = vim.lsp.get_clients({ bufnr = bufid })
  local diagnostics = "" 

  if #clients > 0 then
    local dc = vim.diagnostic.count(bufid)
    if next(dc) ~= nil then
      local s = vim.diagnostic.severity
      diagnostics = string.format("%s%s%s%s",
        dc[s.ERROR] and "%#DiagnosticError#" .. dc[s.ERROR] .. "E%* " or "",
        dc[s.WARN] and "%#DiagnosticWarn#" .. dc[s.WARN] .. "W%* " or "",
        dc[s.INFO] and "%#DiagnosticInfo#" .. dc[s.INFO] .. "I%* " or "",
        dc[s.HINT] and "%#DiagnosticHint#" .. dc[s.HINT] .. "H%* " or ""
      )
    end
  end

  return "%f %h%w%m%r%="..diagnostics.."%l,%c/%L"
end

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
