return {
  { "wbthomason/packer.nvim" },
  -- LSP
  { "neovim/nvim-lspconfig" },
  { "williamboman/nvim-lsp-installer"},
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.cmp").setup()
    end,
  },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },
  -- Snippets
  { "rafamadriz/friendly-snippets" },
  { "L3MON4D3/LuaSnip" },
  -- Projects? TODO
  -- TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.treesitter").setup()
    end,
    run = ":TSUpdate",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "BufReadPost",
  },
  -- SideBar
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.nvimtree").setup()
    end,
  },
  {
    "kyazdani42/nvim-web-devicons",
  },
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
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.autopairs").setup()
    end,
  },
  -- TPope
  { "tpope/vim-surround" },
  { "tpope/vim-dispatch" },
  -- Debugger
  { "Pocco81/DAPInstall.nvim" },
  { "mfussenegger/nvim-dap" },
  -- GitSigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns").setup()
    end,
    requires = {
      { "nvim-lua/plenary.nvim" }
    },
  },
  -- Colorschemes
  {"navarasu/onedark.nvim"},
}
