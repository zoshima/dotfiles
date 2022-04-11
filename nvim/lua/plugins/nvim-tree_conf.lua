require("nvim-tree").setup({
  -- renderer = {
  --   indent_markers = {
  --     enable = true
  --   }
  -- },
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

vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 0,
  files = 0,
  folder_arrows = 0,
}

MapKey("n", "<Space>e", ":NvimTreeFindFileToggle<CR>")
