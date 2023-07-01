require("plugins")

-- options
vim.opt.termguicolors = true
vim.opt.signcolumn = "no"
vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pumheight = 5
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "preview", "noselect", "noinsert" }
vim.opt.mouse = "a"
vim.opt.listchars = {
  tab = "<->",
  space = "_",
}
vim.opt.fillchars = {
  vert = "|",
  stl = "-",
  stlnc = "-",
}

-- globals
vim.g.mapleader = " "

-- functions
function MapKey(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- mappings
MapKey("n", "*", "*``")

MapKey("n", "<Space>", "<Nop>")

MapKey("t", "<C-n>", "<C-\\><C-n>")

MapKey("n", "<C-l>", "<C-w>l")
MapKey("n", "<C-h>", "<C-w>h")
MapKey("n", "<C-j>", "<C-w>j")
MapKey("n", "<C-k>", "<C-w>k")

MapKey("n", "<C-S-Left>", ":vertical resize +5<CR>")
MapKey("n", "<C-S-Right>", ":vertical resize -5<CR>")
MapKey("n", "<C-S-Up>", ":resize +5<CR>")
MapKey("n", "<C-S-Down>", ":resize -5<CR>")

MapKey("n", "<Space>,", ":noh<CR>")

MapKey("n", "<F5>", ":!make run<CR>")
MapKey("n", "<F6>", ":!make build<CR>")
MapKey("n", "<F7>", ":!make test<CR>")

MapKey("n", "<Esc>", ":pclose<CR>")

MapKey("i", "<C-N>", "<C-X><C-O>")

require("statusline")
require("colorscheme")
