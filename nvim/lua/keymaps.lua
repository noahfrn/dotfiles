local M = {}

local generic_opts = { noremap = true, silent = true }
local map_leader = " "

local default_keymaps = {
    n = {
      ["<leader>ve"] = ":edit ~/.config/nvim/init.lua<cr>",
      ["<leader>vk"] = ":edit ~/.config/nvim/lua/keymaps.lua<cr>",
      ["<leader>k"] = ":nohlsearch<cr>",
      ["<leader>Q"] = ":bufdo bdelete<cr>",
      ["<leader>x"] = ":!xdg-open %<cr><cr>",
      ["<C-h>"] = "<C-w>h",
      ["<C-j>"] = "<C-w>j",
      ["<C-k>"] = "<C-w>k",
      ["<C-l>"] = "<C-w>l",
      -- Packer
      ["<leader>pc"] = ":lua require('loader').recompile()<cr>",
      -- Telescope
      ["<leader><leader>"] = ":Telescope find_files<cr>",
      ["<leader>ff"] = ":Telescope treesitter<cr>",
      ["<leader>fg"] = ":Telescope git_branches<cr>",
      ["<leader>fr"] = ":Telescope oldfiles<cr>",
      ["<leader>ft"] = ":Telescope live_grep<cr>",
      ["<leader>fk"] = ":Telescope keymaps<cr>",
      ["<leader>fc"] = ":Telescope commands<cr>",
      ["<leader>fb"] = ":Telescope buffers<cr>",
      ["<leader>fh"] = ":Telescope help_tags<cr>", 
      -- SideBar
      ["<leader>e"] = ":NvimTreeToggle<cr>",
      -- Debugger
      ["<leader>dt"] = ":lua require('dap').toggle_breakpoint()<cr>",
      ["<leader>db"] = ":lua require('dap').step_back()<cr>",
      ["<leader>dc"] = ":lua require('dap').continue()<cr>",
      ["<leader>dC"] = ":lua require('dap').run_to_cursor()<cr>",
      ["<leader>dd"] = ":lua require('dap').disconnect()<cr>",
      ["<leader>dg"] = ":lua require('dap').session()<cr>",
      ["<leader>di"] = ":lua require('dap').step_into()<cr>",
      ["<leader>do"] = ":lua require('dap').step_over()<cr>",
      ["<leader>du"] = ":lua require('dap').step_out()<cr>",
      ["<leader>dp"] = ":lua require('dap').pause.toggle()<cr>",
      ["<leader>dr"] = ":lua require('dap').repl.toggle()<cr>",
      ["<leader>ds"] = ":lua require('dap').continue()<cr>",
      ["<leader>dq"] = ":lua require('dap').close()<cr>",
      -- Dispatch
      ["<leader>mm"] = ":Make ",
      ["<leader>mM"] = ":Make! ",
      ["<leader>mc"] = ":Copen<cr>",
      ["<leader>mC"] = ":cclose<cr>",
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
