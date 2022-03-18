require("nvim-tree").setup({
  auto_close = true,
  view = {
    relativenumber = true,
    width = 40
  },
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
  },
})


