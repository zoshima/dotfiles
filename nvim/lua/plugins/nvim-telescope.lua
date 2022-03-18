-- local dropdown_theme = require('telescope.themes').get_dropdown({
--     border = {},
--     borderchars = { "-", "|", "-", "|", "|", "|", "|", "|" },
-- })

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
  -- pickers = {
  --   git_files = {
  --     theme = ""
  --   },
  --   commands = {
  --     theme = "dropdown"
  --   },
  --   live_grep = {
  --     theme = "dropdown"
  --   },
  --   grep_string = {
  --     theme = "dropdown"
  --   },
  --   buffers = {
  --     theme = "dropdown"
  --   },
  --   marks = {
  --     theme = "dropdown"
  --   },
  --   git_commits = {
  --     theme = "dropdown"
  --   },
  --   git_bcommits = {
  --     theme = "dropdown"
  --   },
  --   lsp_document_symbols = {
  --     theme = "dropdown"
  --   },
  -- },
})
