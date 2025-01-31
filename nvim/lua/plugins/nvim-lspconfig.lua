local lspconfig = require("lspconfig")

local on_attach = function(client, _, fmt)
  client.server_capabilities.semanticTokensProvider = nil

  local opts = { noremap = true }

  vim.api.nvim_set_keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gH", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_set_keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

  vim.api.nvim_set_keymap("i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  vim.api.nvim_set_keymap("n", "zn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  vim.api.nvim_set_keymap("n", "zp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  vim.api.nvim_set_keymap("n", "zh", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "single",
  }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = "single",
  }
)
