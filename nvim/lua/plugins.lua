vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'

  -- navigation
  use "kyazdani42/nvim-tree.lua"
  use "liuchengxu/vista.vim";
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- editor
  use "kshenoy/vim-signature";
  use "tpope/vim-commentary";
  use "tpope/vim-fugitive";
  -- looks
  use "morhetz/gruvbox";
  -- lsp
  use "neovim/nvim-lspconfig";
  -- syntax
  use "nvim-treesitter/nvim-treesitter";
  -- nvim-cmp
  use "hrsh7th/nvim-cmp";
  use "hrsh7th/cmp-nvim-lsp";
  use "saadparwaiz1/cmp_luasnip";
  use "L3MON4D3/LuaSnip";
end)
