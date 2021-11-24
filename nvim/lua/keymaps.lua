local M = {}

local generic_opts = { noremap = true, silent = true }
local map_leader = " "

local default_keymaps = {
    n = {
      ["<leader>ve"] = ":edit ~/.config/nvim/init.lua<cr>",
      ["<leader>k"] = ":nohlsearch<cr>",
      ["<leader>Q"] = ":bufdo bdelete<cr>",
      ["<C-h>"] = "<C-w>h",
      ["<C-j>"] = "<C-w>j",
      ["<C-k>"] = "<C-w>k",
      ["<C-l>"] = "<C-w>l",
    },
    i = {
      ["jj"] = "<esc>",
    },
    v = {
      ["<"] = "<gv",
      [">"] = ">gv",
    },
    [""] = {
      ["gf"] = ":edit <cfile><cr>"
    }

  }

function M.load()
  vim.g.mapleader = map_leader

  for mode, mappings in pairs(default_keymaps) do
    for lhs, rhs in pairs(mappings) do
      vim.api.nvim_set_keymap(mode, lhs, rhs, generic_opts)
    end
  end

end

return M
