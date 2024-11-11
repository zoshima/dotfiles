require("nvim-treesitter.configs").setup({
  modules = {},
  sync_install = true,
  auto_install = false,
  ensure_installed = {
    "comment",
    "bash",
    "lua",
    "json",
    "javascript",
    "typescript",
    "html",
    "css",
    "scss",
    "go",
    "python",
    "yaml",
    "toml",
    "sql",
    "rust",
    "c",
    "cpp",
    "markdown",
  },
  ignore_install = { "t32" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

vim.api.nvim_set_keymap("n", "<Leader><C-g>", ":lua print(require('nvim-treesitter').statusline())<CR>",
  { noremap = true, silent = true })
