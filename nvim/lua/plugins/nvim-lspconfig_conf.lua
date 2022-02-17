local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(_, bufnr)
  local function map_keys(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true }

  map_keys('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map_keys('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map_keys('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map_keys('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map_keys('n', 'gH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map_keys('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map_keys('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map_keys('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map_keys('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  map_keys('n', 'z/', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
  map_keys('n', 'zn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  map_keys('n', 'zp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  map_keys('n', 'zh', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  map_keys('v', 'gf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

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
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
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
