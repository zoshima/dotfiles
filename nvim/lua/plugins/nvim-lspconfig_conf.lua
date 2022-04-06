local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(_, bufnr)
  local opts = { noremap=true }

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

-- golang
lspconfig.gopls.setup({
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
})

-- python
lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_dir = lspconfig.util.root_pattern("requirements.txt"),
  single_file_support = true,
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = true,
          ignore = {
            "E501"
          }
        }
      }
    }
  }
})

-- lua
lspconfig.sumneko_lua.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = {"vim"}
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    }
  }
})
