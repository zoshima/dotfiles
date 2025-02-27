require("nvim-treesitter.configs").setup({
  sync_install = true,
  auto_install = false,
  ensure_installed = {
    "bash",
    "comment",
    "css",
    "go",
    "html",
    "javascript",
    "json",
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
