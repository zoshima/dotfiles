vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded",
  },
  jump = {
    float = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
      [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
      [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
      [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
    }
  },
});

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "rounded",
  }
);

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "rounded",
  }
);

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function()
    local opts = { buffer = true, noremap = true }

    vim.keymap.set("n", "gra", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gri", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-S>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "gO", vim.lsp.buf.document_symbol, opts)

    vim.keymap.set("n", "<C-k>", vim.diagnostic.open_float, opts)

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = 0,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
})

-- lua
vim.api.nvim_create_autocmd('FileType', {
  pattern = "lua",
  callback = function(ev)
    vim.lsp.start({
      name = 'lua-language-server',
      cmd = { 'lua-language-server' },
      root_dir = vim.fs.root(ev.buf, { '.luarc.json', '.luarc.jsonc' }),
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
          }
        },
      },
    })
  end,
})

-- go
vim.api.nvim_create_autocmd('FileType', {
  pattern = "go",
  callback = function(ev)
    vim.lsp.start({
      name = 'gopls',
      cmd = { 'gopls' },
      root_dir = vim.fs.root(ev.buf, { 'go.mod', 'go.work', '.git' }),
    })
  end,
})

-- ts
vim.api.nvim_create_autocmd('FileType', {
  pattern = { "typescript", "javascript" },
  callback = function(ev)
    vim.lsp.start({
      name = 'typescript-language-server',
      cmd = { 'typescript-language-server', '--stdio' },
      root_dir = vim.fs.root(ev.buf, { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' }),
    })
  end,
})

-- prettier
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { "*.json", "*.css", "*.scss", "*.html", },
  callback = function()
    vim.cmd(":silent !npx prettier % --write")
  end,
})
