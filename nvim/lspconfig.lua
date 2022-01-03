local nvim_lsp = require'lspconfig'

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- golang
nvim_lsp.gopls.setup({
  on_attach = on_attach;
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
})

-- python
nvim_lsp.pylsp.setup({
  on_attach = on_attach;
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_dir = nvim_lsp.util.root_pattern("requirements.txt"),
  single_file_support = true
})

-- deno
nvim_lsp.denols.setup({
  on_attach = on_attach;
  cmd = { "deno", "lsp" },
  filetypes = { "typescript" },
  init_options = {
    enable = true,
    lint = false,
    unstable = false
  },
  root_dir = nvim_lsp.util.root_pattern(".denoroot")
})

-- typescript
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  function(client, bufnr) 
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end
})
