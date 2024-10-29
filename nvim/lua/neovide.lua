vim.opt.title = true
vim.opt.termguicolors = true

vim.o.guifont = "Roboto Mono:h11"

vim.g.neovide_padding_top = 5
vim.g.neovide_padding_bottom = 5
vim.g.neovide_padding_right = 5
vim.g.neovide_padding_left = 5

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_option_value("titlestring", vim.fn.getcwd(), {})
  end
})
