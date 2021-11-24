return {
  { "wbthomason/packer.nvim" },
  { "neovim/nvim-lspconfig" },
 -- Comment
  { 
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("plugins.comment").setup()
    end,
  },
}
