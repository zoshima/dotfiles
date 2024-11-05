local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr, fmt)
  client.server_capabilities.semanticTokensProvider = nil

  -- may become obsolete: https://neovim.io/doc/user/lsp.html#lsp-defaults
  local opts = { noremap = true }
  vim.api.nvim_set_keymap("n", "grn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gra", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_set_keymap("n", "grr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gri", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gO", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  vim.api.nvim_set_keymap("i", "<C-S>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  if fmt == true then
    vim.api.nvim_command("au BufWritePre <buffer> lua vim.lsp.buf.format()")
  end
end

lspconfig.lua_ls.setup({
  on_init = function(client)
    client.config.settings.Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    }
  end,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr, true)
  end
})

lspconfig.bashls.setup({
  on_attach = function(client, bufnr)
    -- install shfmt for formatting
    on_attach(client, bufnr, true)
  end
})

lspconfig.gopls.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr, true)
  end
})

lspconfig.ts_ls.setup({
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
