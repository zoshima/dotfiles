local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.formatting_sync()")
end

-- golang
lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls", "serve"},
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    }
  }
}

-- python
lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_dir = lspconfig.util.root_pattern("requirements.txt"),
  single_file_support = true
})

-- -- deno
-- lspconfig.denols.setup({
--   on_attach = on_attach,
--   cmd = { "deno", "lsp" },
--   filetypes = { "typescript" },
--   init_options = {
--     enable = true,
--     lint = false,
--     unstable = false
--   },
--   root_dir = lspconfig.util.root_pattern(".denoroot")
-- })

-- -- typescript
-- lspconfig.tsserver.setup({
--   on_attach = on_attach,
--   root_dir = lspconfig.util.root_pattern("package.json"),
--   function(client, bufnr) 
--     client.resolved_capabilities.document_formatting = false
--     on_attach(client, bufnr)
--   end
-- })
