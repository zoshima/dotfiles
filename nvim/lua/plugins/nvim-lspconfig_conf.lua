local lspconfig = require("lspconfig")
local lspinstaller = require("nvim-lsp-installer")
local cmp = require("cmp_nvim_lsp")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp.update_capabilities(capabilities)

local on_attach = function(_, bufnr)
  local opts = { noremap = true }

  MapKey("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  MapKey("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  MapKey("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  MapKey("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  MapKey("n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  MapKey("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  MapKey("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  MapKey("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  MapKey("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  MapKey("n", "z/", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
  MapKey("n", "zn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  MapKey("n", "zp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  MapKey("n", "zh", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  MapKey("v", "gf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.formatting_sync()")
end

lspinstaller.setup({})

local installed_servers = lspinstaller.get_installed_servers()
for i = 1, #installed_servers do
  local server_name = installed_servers[i].name
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if server_name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" }
        },
        telemetry = {
          enable = false,
        },
      }
    }
  end

  lspconfig[server_name].setup(opts)
end
