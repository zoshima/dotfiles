require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  ignore_install = {"t32"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
