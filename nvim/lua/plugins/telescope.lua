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

vim.api.nvim_set_keymap("n", "<Leader><Space>", ":Telescope resume<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>p", ":Telescope git_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>P", ":Telescope commands<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>F", ":Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>f", ":Telescope current_buffer_fuzzy_find<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>b", ":Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>m", ":Telescope marks<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>C", ":Telescope git_commits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>c", ":Telescope git_bcommits<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>z", ":Telescope diagnostics<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>t", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>r", ":Telescope lsp_references<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>d", ":Telescope lsp_definitions<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>h", ":Telescope highlights<CR>", { noremap = true, silent = true })
