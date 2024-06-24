local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr, fmt)
  client.server_capabilities.semanticTokensProvider = nil

  local opts = { noremap = true }

  MapKey("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  MapKey("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  MapKey("n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  MapKey("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

  MapKey("n", "z/", "<cmd>lua vim.diagnostic.set_loclist()<CR>", opts)
  MapKey("n", "zn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  MapKey("n", "zp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  MapKey("n", "zh", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  if fmt == true then
    MapKey("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    MapKey("v", "gf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

    vim.api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

lspconfig.gopls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr, true)
  end
})

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  init_options = {
    completionDisableFilterText = true,
  },
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {
    "*.ts",
    "*.js",
    "*.json",
    "*.css",
    "*.scss",
    "*.html",
  },
  -- command = ":silent %!npx prettier --stdin-filepath %"
  callback = function()
    -- local view = vim.fn.winsaveview()
    vim.cmd(":silent !npx prettier % --write")
    -- vim.fn.winrestview(view)
  end
})
