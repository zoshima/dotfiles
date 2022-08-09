require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close
      }
    },
    border = {},
    borderchars = { "-", "|", "-", "|", "|", "|", "|", "|" },
  },
    pickers = {
      buffers = {
        sort_lastused = true,
        ignore_current_buffer = true,
      },
    },
})

MapKey("n", "<Space>p", ":Telescope git_files<CR>")
MapKey("n", "<Space>P", ":Telescope commands<CR>")
MapKey("n", "<Space>F", ":Telescope live_grep<CR>")
MapKey("n", "<Space>f", ":Telescope current_buffer_fuzzy_find<CR>")
MapKey("n", "<Space>b", ":Telescope buffers<CR>")
MapKey("n", "<Space>m", ":Telescope marks<CR>")
MapKey("n", "<Space>C", ":Telescope git_commits<CR>")
MapKey("n", "<Space>c", ":Telescope git_bcommits<CR>")
MapKey("n", "<Space>t", ":Telescope lsp_document_symbols<CR>")
