local nvim_lsp = require'lspconfig'

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- typescript
nvim_lsp.tsserver.setup({
  on_attach = on_attach;
})

-- c#
local omnisharp_bin = "/Users/kdi/.omnisharp/run"
nvim_lsp.omnisharp.setup({
  on_attach = on_attach;
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
})

-- rust
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach;
})
