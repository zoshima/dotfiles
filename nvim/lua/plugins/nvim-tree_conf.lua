vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
        folder_arrow = false,
        git = true,
      },
      git_placement = "signcolumn",
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
    float = {
      enable = true,
      quit_on_focus_loss = false,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 60,
        height = 20,
      },
    },
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
