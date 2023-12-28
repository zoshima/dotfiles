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
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.mouse = "a"
vim.opt.scrolloff = 2
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
-- vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- functions
function MapKey(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function FitSplit()
  local line_len = vim.fn.col('$') + 3;
  print(line_len);

  vim.cmd('vertical resize ' .. line_len);
end

function SwitchExtension(extension)
  local target_buffer = vim.fn.expand("%:t:r") .. extension
  local target_file = vim.fn.expand("%:p:h") .. "/" .. target_buffer
  local target_buffer_no = vim.fn.bufnr(target_buffer)
  local is_readable = vim.fn.filereadable(target_file)

  if target_buffer_no >= 0 then
    vim.cmd('silent execute "buffer" ' .. target_buffer_no)
  elseif is_readable == 1 then
    vim.cmd('silent e ' .. target_file)
  else
    print("not found: " .. target_file)
  end
end

function ShowHighlightInfo()
  local result = vim.treesitter.get_captures_at_cursor(0)
  print(vim.inspect(result))
end

-- mappings
MapKey("n", "*", "*``")

MapKey("n", "<Space>", "<Nop>")

MapKey("t", "<C-n>", "<C-\\><C-n>")

MapKey("n", "<C-l>", "<C-w>l")
MapKey("n", "<C-h>", "<C-w>h")
MapKey("n", "<C-j>", "<C-w>j")
MapKey("n", "<C-k>", "<C-w>k")

MapKey("n", "<C-w>-", ":lua FitSplit()<CR>");

MapKey("n", "<C-S-Left>", ":vertical resize +5<CR>")
MapKey("n", "<C-S-Right>", ":vertical resize -5<CR>")
MapKey("n", "<C-S-Up>", ":resize +5<CR>")
MapKey("n", "<C-S-Down>", ":resize -5<CR>")

MapKey("n", "<Space>,", ":noh<CR>")

MapKey("n", "g?", ":lua ShowHighlightInfo()<CR>")

MapKey("n", "<F1>", ":lua SwitchExtension('.ts')<CR>")
MapKey("n", "<F2>", ":lua SwitchExtension('.html')<CR>")
MapKey("n", "<F3>", ":lua SwitchExtension('.scss')<CR>")

MapKey("n", "<F5>", ":!make run<CR>")
MapKey("n", "<F6>", ":!make build<CR>")
MapKey("n", "<F7>", ":!make test<CR>")

MapKey("n", "<F8>", ":so ~/git/dotfiles/nvim/lua/colorscheme.lua<CR>")
MapKey("n", "<F9>", ":Telescope highlights<CR>")

MapKey("n", "<Esc>", ":pclose<CR>")

MapKey("i", "<C-N>", "<C-X><C-O>")

require("statusline")
require("tabline")
require("colorscheme")
require("plugins")
