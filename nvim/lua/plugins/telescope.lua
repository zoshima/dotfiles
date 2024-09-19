require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close
      }
    },
    border = true,
    -- borderchars = { "-", "|", "-", "|", "-", "-", "-", "-" },
    layout_strategy = "flex",
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      ignore_current_buffer = true,
    },
    live_grep = {
      additional_args = function()
        return { "--hidden" }
      end
    },
  },
})

MapKey("n", "<Space><Space>", ":Telescope resume<CR>")
MapKey("n", "<Space>p", ":Telescope git_files<CR>")
MapKey("n", "<Space>P", ":Telescope commands<CR>")
MapKey("n", "<Space>F", ":Telescope live_grep<CR>")
MapKey("n", "<Space>f", ":Telescope current_buffer_fuzzy_find<CR>")
MapKey("n", "<Space>b", ":Telescope buffers<CR>")
MapKey("n", "<Space>m", ":Telescope marks<CR>")
MapKey("n", "<Space>C", ":Telescope git_commits<CR>")
MapKey("n", "<Space>c", ":Telescope git_bcommits<CR>")
MapKey("n", "<Space>z", ":Telescope diagnostics<CR>")

MapKey("n", "<Space>t", ":Telescope lsp_document_symbols<CR>")

MapKey("n", "<F9>", ":Telescope highlights<CR>")

MapKey("n", "gr", ":Telescope lsp_references<CR>")
MapKey("n", "gd", ":Telescope lsp_definitions<CR>")
