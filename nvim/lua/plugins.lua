return {
  { "wbthomason/packer.nvim" },
  { "neovim/nvim-lspconfig" },
  -- LSP TODO
  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.treesitter").setup() -- TODO
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },
  -- SideBar TODO
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
  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "BufWinEnter",
    config = function()
      require("plugins.terminal").setup()
    end,
  },
  -- Autopairs TODO
  -- Colorschemes
  {"navarasu/onedark.nvim"},
}
