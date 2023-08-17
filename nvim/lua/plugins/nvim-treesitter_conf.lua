require("nvim-treesitter.configs").setup({
  modules = {},
  sync_install = true,
  auto_install = false,
  ensure_installed = {
    "lua",
    "json",
    "javascript",
    "typescript",
    "html",
    "css",
    "scss",
    "go",
    "python",
  },
  ignore_install = { "t32" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
