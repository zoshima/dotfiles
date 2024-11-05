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

vim.diagnostic.config({
  virtual_text = false,
})

-- global functions
function GitBlame()
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_row, _ = unpack(vim.api.nvim_win_get_cursor(current_win))

  vim.cmd("vertical new")

  local new_win = vim.api.nvim_get_current_win()
  local new_buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_set_option_value("readonly", true, { buf = new_buf })
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = new_buf })
  vim.api.nvim_set_option_value("bufhidden", "delete", { buf = new_buf })

  local blame_output = vim.fn.systemlist("git blame " .. vim.api.nvim_buf_get_name(current_buf))
  vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, blame_output)

  vim.api.nvim_win_set_cursor(new_win, { current_row, 0 })
end

function GitShow(revision)
  local current_file_path = vim.fn.expand("%")
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_row, _ = unpack(vim.api.nvim_win_get_cursor(current_win))

  vim.cmd("vertical new")

  local new_win = vim.api.nvim_get_current_win()
  local new_buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_set_option_value("readonly", true, { buf = new_buf })
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = new_buf })
  vim.api.nvim_set_option_value("bufhidden", "delete", { buf = new_buf })

  local blame_output = vim.fn.systemlist("git show " .. revision .. ":" .. current_file_path)
  vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, blame_output)

  vim.api.nvim_win_set_cursor(new_win, { current_row, 0 })
end

function ShowHighlightInfo()
  local result = vim.treesitter.get_captures_at_cursor(0)
  print(vim.inspect(result))
end

function CopyFilePath()
  local file_path = vim.fn.expand('%:p')
  vim.fn.setreg('+', file_path)
end

-- commands
vim.cmd([[
  command! GitBlame lua GitBlame()
  command! ShowHighlightInfo lua ShowHighlightInfo()
  command! -nargs=1 GitShow lua GitShow(<f-args>)
  command! CopyFilePath lua CopyFilePath()
]])

-- mappings
vim.api.nvim_set_keymap("n", "<Leader>", "<Nop>", {})
vim.api.nvim_set_keymap("n", "<Leader>,", ":noh<CR>", { noremap = true })

-- require
require("tabline")
require("statusline")
require("plugins.nvim-lspconfig")
require("plugins.nvim-treesitter")
require("plugins.telescope")
require("plugins.oil")
require("colorscheme")
