vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'tpope/vim-dispatch'
    use 'tpope/vim-surround'
    use 'neovim/nvim-lspconfig'
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use 'numToStr/Comment.nvim'
    use "windwp/nvim-autopairs"
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
end)
