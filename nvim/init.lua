vim.g.mapleader = " "

vim.opt.termguicolors = false
vim.opt.signcolumn = "number"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pumheight = 5
vim.opt.foldmethod = "manual"
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
vim.api.nvim_set_keymap("n", "<Leader>", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<Leader>,", ":noh<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })

-- require
require("tabline")
require("statusline")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.oil")
require("colorscheme")
require("command")
require("lsp")
