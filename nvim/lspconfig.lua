local nvim_lsp = require'lspconfig'

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- typescript
nvim_lsp.tsserver.setup({
  on_attach = on_attach;
  function(client, bufnr) 
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end
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

-- efm
local prettier = {
  formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
  formatStdin = true
}

local languages = {
    typescript = {prettier},
    javascript = {prettier},
    typescriptreact = {prettier},
    javascriptreact = {prettier},
    yaml = {prettier},
    json = {prettier},
    html = {prettier},
    scss = {prettier},
    css = {prettier},
    markdown = {prettier},
}

nvim_lsp.efm.setup({
    -- root_dir = nvim_lsp.util.root_pattern("yarn.lock", ".git"),
    filetypes = vim.tbl_keys(languages),
    init_options = {documentFormatting = true, codeAction = true},
    settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
    on_attach = on_attach
})
