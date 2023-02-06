vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function(data)
  local is_dir = vim.fn.isdirectory(data.file) == 1

  if not is_dir then
    return
  end

  vim.cmd.cd(data.file)

  require("nvim-tree.api").tree.open()
end})
