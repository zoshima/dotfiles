require("nvim-treesitter.configs").setup({
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
