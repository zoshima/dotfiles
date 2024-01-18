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
    width = 40,
    -- float = {
    --   enable = true,
    --   quit_on_focus_loss = false,
    --   open_win_config = {
    --     relative = "editor",
    --     border = "rounded",
    --     width = 60,
    --     row = 1,
    --     col = 5,
    --   },
    -- },
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

-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
--   callback = function(data)
--     local is_dir = vim.fn.isdirectory(data.file) == 1

--     if not is_dir then
--       return
--     end

--     vim.cmd.cd(data.file)

--     require("nvim-tree.api").tree.open()
--   end
-- })
