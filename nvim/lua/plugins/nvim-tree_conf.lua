require("nvim-tree").setup({
  renderer = {
    indent_markers = {
      enable = false
    },
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "*",
          staged = "+",
          unmerged = "?",
          renamed = "->",
          untracked = "?",
          deleted = "-",
          ignored = "_"
        },
      },
    },
  },
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

MapKey("n", "<Space>e", ":NvimTreeFindFileToggle<CR>")
