vim.g.mapleader = " "

vim.opt.path:append("**/*")
vim.opt.termguicolors = false
vim.opt.signcolumn = "number"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pumheight = 5
vim.opt.foldenable = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect", "noinsert", "popup" }
vim.opt.mouse = "nv"
vim.opt.mousemodel = "extend"
vim.opt.scrolloff = 1
vim.opt.shadafile = "NONE"
vim.opt.listchars = {
  tab = "<>",
  space = "_",
  eol = "$",
}
vim.opt.fillchars = {
  msgsep = "─",
  stl = "─",
  stlnc = "─",
  -- vert = "|"
}

-- mappings
vim.api.nvim_set_keymap("n", "<Leader>,", ":noh<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

-- functions
function CopyFilePath()
  local file_path = vim.fn.expand('%:p')
  vim.fn.setreg('+', file_path)
end

-- require
require("statusline")
require("lsp")
require("treesitter")
require("colorscheme")
