require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})

vim.api.nvim_set_keymap("n", "<Space>e", ":Oil<CR>", { noremap = true, silent = true })
