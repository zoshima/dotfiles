local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil

  local opts = { noremap = true }

  MapKey("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- MapKey("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  -- MapKey("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  MapKey("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  MapKey("n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- MapKey("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  -- MapKey("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  MapKey("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

  MapKey("n", "z/", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
  MapKey("n", "zn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  MapKey("n", "zp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  MapKey("n", "zh", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  MapKey("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  MapKey("v", "gf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local set_auto_formatter = function(formatter)
  if formatter == 'lsp' then
    vim.api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.format()")
  elseif formatter == 'prettier' then
    vim.api.nvim_command("au BufWritePre <buffer> PrettierAsync")
  end
end

lspconfig.gopls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    set_auto_formatter('lsp')
  end
})

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    set_auto_formatter('prettier')
  end,
  init_options = {
    completionDisableFilterText = true,
  },
})

lspconfig.lua_ls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    set_auto_formatter('lsp')
  end,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      }
    },
  }
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.json",
    "*.css",
    "*.scss",
    "*.html",
  },
  command = "PrettierAsync"
  -- callback = function()
  --   local view = vim.fn.winsaveview()
  --   vim.cmd(":silent %!prettier --stdin-filepath %")
  --   vim.fn.winrestview(view)
  -- end
})
