return {
  { "wbthomason/packer.nvim" },
  { "neovim/nvim-lspconfig" },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope").setup()
    end,
    requires = {
      { "nvim-lua/plenary.nvim" }
    },
  },
  -- LuaLine
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine").setup()
    end,
  },
  -- Comment
  { 
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("plugins.comment").setup()
    end,
  },
  -- Colorschemes
  {"navarasu/onedark.nvim"},
}
