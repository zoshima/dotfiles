local nvim_lsp = require'lspconfig'

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- deno
nvim_lsp.denols.setup({
  on_attach = on_attach;
  cmd = { "deno", "lsp" },
  filetypes = { "typescript" },
  init_options = {
    enable = true,
    lint = false,
    unstable = false
  },
  root_dir = nvim_lsp.util.root_pattern(".denomrk")
})

-- c#
local omnisharp_bin = "/Users/kdi/.omnisharp/run"
local pid = vim.fn.getpid()
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
  }
})

-- golang
nvim_lsp.gopls.setup({
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

-- typescript
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  function(client, bufnr) 
    client.resolved_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end
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
    root_dir = nvim_lsp.util.root_pattern("package.json"),
    filetypes = vim.tbl_keys(languages),
    init_options = {documentFormatting = true, codeAction = true},
    settings = {languages = languages, log_level = 1, log_file = '~/efm.log'},
    -- on_attach = on_attach
})
