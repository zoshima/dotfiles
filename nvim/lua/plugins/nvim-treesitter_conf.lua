require("nvim-treesitter.configs").setup({
  modules = {},
  sync_install = true,
  auto_install = false,
  ensure_installed = {
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
    "rust",
    "c",
    "cpp",
  },
  ignore_install = { "t32" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
});

require("treesitter-context").setup({
  enable = true,
  max_lines = 1,
  trim_scope = "inner",
  mode = "topline",
});
