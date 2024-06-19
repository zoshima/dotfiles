-- globals
vim.g.mapleader = " "
vim.g.netrw_liststyle = 3
-- vim.g.netrw_banner = 0

-- options
vim.opt.termguicolors = false
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
vim.opt.foldmethod = "manual"
vim.opt.foldenable = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect", "noinsert", "popup" }
vim.opt.mouse = "a"
vim.opt.scrolloff = 1
vim.opt.shadafile = "NONE"
vim.opt.listchars = {
  tab = "<->",
  space = "_",
}
vim.opt.fillchars = {
  vert = "|",
  stl = "-",
  stlnc = "-",
}

-- functions
function MapKey(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function ShowHighlightInfo()
  local result = vim.treesitter.get_captures_at_cursor(0)
  print(vim.inspect(result))
end

function GitBlameLine() 
  local line = unpack(vim.api.nvim_win_get_cursor(0))
  local path = vim.fn.expand('%')

  local blame = vim.fn.system("git blame --porcelain -L"..line..",+1 -- "..path)

  print(blame)
end

function GitBlameSelection()
  local vstart = vim.fn.getpos("'<")
  local vend = vim.fn.getpos("'>")

  local line_start = vstart[2]
  local line_end = vend[2]

  local path = vim.fn.expand('%')

  local blame = vim.fn.system("git blame -L"..line_start..","..line_end.." "..path)

  print(blame)
end

-- mappings
MapKey("n", "*", "*``")
MapKey("n", "<Space>", "<Nop>")
MapKey("n", "<C-l>", "<C-w>l")
MapKey("n", "<C-h>", "<C-w>h")
MapKey("n", "<C-j>", "<C-w>j")
MapKey("n", "<C-k>", "<C-w>k")
MapKey("n", "<C-S-Left>", ":vertical resize +5<CR>")
MapKey("n", "<C-S-Right>", ":vertical resize -5<CR>")
MapKey("n", "<C-S-Up>", ":resize +5<CR>")
MapKey("n", "<C-S-Down>", ":resize -5<CR>")
MapKey("n", "<Space>,", ":noh<CR>")
MapKey("n", "<Space>e", ":Ex<CR>")
MapKey("n", "g?", ":lua ShowHighlightInfo()<CR>")
MapKey("n", "gb", ":lua GitBlameLine()<CR>")
MapKey("v", "gb", ":lua GitBlameSelection()<CR>")
MapKey("n", "<F5>", ":!make run<CR>")
MapKey("n", "<F6>", ":!make build<CR>")
MapKey("n", "<F7>", ":!make test<CR>")
MapKey("n", "<F8>", ":so ~/git/dotfiles/nvim/lua/colorscheme.lua<CR>")
MapKey("n", "<Esc>", ":pclose<CR>")
MapKey("n", "<BS>", "-")
MapKey("i", "<C-Space>", "<C-X><C-O>")
MapKey("t", "<Esc>", "<C-\\><C-n>")

-- require
require("tabline")
require("statusline")
require("colorscheme")
require("plugins.nvim-lspconfig")
require("plugins.nvim-treesitter")
require("plugins.telescope")
