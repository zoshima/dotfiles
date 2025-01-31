vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = "rounded",
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
    local opts = { noremap = true }

    vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_set_keymap("n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    vim.api.nvim_set_keymap("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    vim.api.nvim_set_keymap("n", "zn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    vim.api.nvim_set_keymap("n", "zp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    vim.api.nvim_set_keymap("n", "zh", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    vim.api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.format()")
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
