vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- navigation
  use {
    "kyazdani42/nvim-tree.lua",
    config = function() require("plugins.nvim-tree_conf") end
  };
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function() require("plugins.nvim-telescope_conf") end
  }

  -- editor
  use "tpope/vim-commentary";
  use "tpope/vim-fugitive";

  -- looks
  use {
    "Mofiqul/vscode.nvim",
    config = function() require("plugins.vscode_conf") end
  }

  -- lsp
  use {
    "neovim/nvim-lspconfig",
    config = function() require("plugins.nvim-lspconfig_conf") end
  };

  -- syntax
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function() require("plugins.nvim-treesitter_conf") end
  };
end)
