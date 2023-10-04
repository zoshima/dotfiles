vim.cmd("packadd packer.nvim")

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim";

  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function() require("plugins.nvim-telescope_conf") end
  };

  use {
    "neovim/nvim-lspconfig",
    requires = { { "prettier/vim-prettier" } },
    config = function() require("plugins.nvim-lspconfig_conf") end
  };

  use {
    "nvim-treesitter/nvim-treesitter",
    config = function() require("plugins.nvim-treesitter_conf") end
  };
end)
