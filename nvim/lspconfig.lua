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

-- c
nvim_lsp.ccls.setup({
  on_attach = on_attach;
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
    highlight = {
      lsRanges = true
    };
  }
})

-- rust
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach;
})

-- efm
local prettier = {
  formatCommand = "prettier --stdin-filepath ${INPUT}",
  formatStdin = true
}

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
}

local languages = {
    typescript = {prettier, eslint},
    javascript = {prettier, eslint},
    typescriptreact = {prettier, eslint},
    javascriptreact = {prettier, eslint},
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
