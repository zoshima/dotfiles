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
vim.opt.mouse = "a"
vim.opt.scrolloff = 1
vim.opt.shadafile = "NONE"
vim.opt.listchars = {
  tab = "<>",
  space = "_",
}
vim.opt.fillchars = {
  msgsep = "─",
  stl = "─",
  stlnc = "─",
}

vim.diagnostic.config({
  virtual_text = false,
})

-- wsl
-- from :h clipboard-wsl
if vim.fn.has("wsl") then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

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

-- mappings
MapKey("n", "*", "*``")
MapKey("n", "<Space>", "<Nop>")
MapKey("n", "<C-l>", "<C-w>l")
MapKey("n", "<C-h>", "<C-w>h")
MapKey("n", "<C-j>", "<C-w>j")
MapKey("n", "<C-k>", "<C-w>k")
MapKey("n", "<C-Left>", ":vertical resize +5<CR>")
MapKey("n", "<C-Right>", ":vertical resize -5<CR>")
MapKey("n", "<C-Up>", ":resize +5<CR>")
MapKey("n", "<C-Down>", ":resize -5<CR>")
MapKey("n", "<Space>,", ":noh<CR>")
MapKey("n", "g?", ":lua ShowHighlightInfo()<CR>")
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
require("plugins.nvim-lspconfig")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.oil")
require("colorscheme")
