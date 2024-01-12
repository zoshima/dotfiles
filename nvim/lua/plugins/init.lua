vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim";

  -- qol
  use "tpope/vim-commentary";

  -- navigation
  use {
    "kyazdani42/nvim-tree.lua",
    config = function() require("plugins.nvim-tree_conf") end
  };
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function() require("plugins.nvim-telescope_conf") end
  };

  -- lsp
  use {
    "neovim/nvim-lspconfig",
    requires = { { "prettier/vim-prettier" } },
    config = function() require("plugins.nvim-lspconfig_conf") end
  };

  -- syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = { { "nvim-treesitter/nvim-treesitter-context" } },
    config = function() require("plugins.nvim-treesitter_conf") end
  };
end)
