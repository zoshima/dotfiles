require("plugins")

vim.cmd("colorscheme gruvbox")

-- options
vim.opt.termguicolors = true
vim.opt.signcolumn = "no"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.pumheight = 5
vim.opt.foldmethod = "syntax"
vim.opt.foldenable = false
vim.opt.swapfile = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "longest", "noinsert", "noselect" }
vim.opt.hidden = true
vim.opt.mouse = "nvc"
vim.opt.fillchars = "vert:╎,stlnc:-,stl:-"
vim.opt.listchars = "tab:<->,space:_"

-- globals
vim.g.mapleader = " "
vim.g.netrw_liststyle = 1

-- globals: NERDTree
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeWinSize = 60

-- globals: Vista
vim.g.vista_default_executive = "nvim_lsp"
vim.g.vista_icon_indent = {"->", " "}
vim.g.vista_sidebar_width = 60
vim.g.vista_blink = {0, 0}
vim.g.vista_echo_cursor = 0
vim.g.vista_close_on_jump = 1
vim.g.vista_executive_for = { vim = "ctags" }

-- functions
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- mappings
map('n', '*', '*``')

map('n', '<Space>', '<Nop>')

map('t', '<C-n>', '<C-\\><C-n>')

map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')

map('n', '<C-S-Left>', ':vertical resize +5<CR>')
map('n', '<C-S-Right>', ':vertical resize -5<CR>')
map('n', '<C-S-Up>', ':resize +5<CR>')
map('n', '<C-S-Down>', ':resize -5<CR>')

map('n', '<Space>p', ':Telescope git_files<CR>')
map('n', '<Space>P', ':Telescope commands<CR>')
map('n', '<Space>F', ':Telescope live_grep<CR>')
map('n', '<Space>f', ':Telescope grep_string<CR>')
map('n', '<Space>b', ':Telescope buffers<CR>')
map('n', '<Space>m', ':Telescope marks<CR>')
map('n', '<Space>C', ':Telescope git_commits<CR>')
map('n', '<Space>c', ':Telescope git_bcommits<CR>')

map('n', '<Space>t', ':Vista!!<CR>')
map('n', '<Space>T', ':Vista finder nvim_lsp<CR>')

map('n', '<Space>e', ':call ToggleNERDTreeFind()<CR>')
map('n', '<Space>,', ':noh<CR>')

vim.cmd([[
  " COLOR SCHEME
  " gray      #7c6f64
  " red       #fb4934
  " green     #b8bb26
  " yellow    #fabd2f
  "
  hi SignColumn guibg=NONE
  hi StatusLine guibg=NONE
  hi CursorLineNr guibg=NONE
  hi StatusLine guibg=0 guifg=#7c6f64 gui=NONE
  hi StatusLineNC guibg=0 guifg=#7c6f64 gui=NONE
  hi VertSplit guifg=#7c6f64
  hi SignatureMarkText guibg=NONE guifg=#8ec081

  hi LspDiagnosticsDefaultError guibg=NONE guifg=#fb4934
  hi LspDiagnosticsSignError guibg=NONE guifg=#fb4934
  hi LspDiagnosticsDefaultWarning guibg=NONE guifg=#fabd2f
  hi LspDiagnosticsSignWarning guibg=NONE guifg=#fabd2f

  hi Pmenu guibg=#3c3836 guifg=#bdae93

  hi StatusLineFileName guibg=0 guifg=#fabd2f gui=NONE

  " COMMANDS
  command! -bang -nargs=1 Gcomp
        \ new | 0read ! git show <q-args>:#

  command! -bang -nargs=0 Prettier
        \ %!prettier --stdin-filepath %

  function! ToggleNERDTreeFind()
    if g:NERDTree.IsOpen() && bufwinnr(t:NERDTreeBufName) == winnr()
      execute ":NERDTreeClose"
    else
      execute ":NERDTreeFind"
    endif
  endfunction

  augroup QuickFixWindow
    " autocmd FileType qf nnoremap <buffer> <C-k> :ccl<CR>:lcl<CR>
    autocmd FileType qf nnoremap <buffer> <Esc> :ccl<CR>:lcl<CR>
  augroup END
]])

require("lsp")
require("nvim-cmp")
require("statusline")
require("tsconfig")
