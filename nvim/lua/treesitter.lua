require("nvim-treesitter.configs").setup({
  sync_install = true,
  auto_install = false,
  ensure_installed = {
    "bash",
    "c",
    "comment",
    "css",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "scss",
    "sql",
    "toml",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
  },
})

vim.api.nvim_set_keymap("n", "<Leader><C-g>", ":lua print(require('nvim-treesitter').statusline())<CR>",
  { noremap = true, silent = true })
