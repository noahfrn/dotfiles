local M = {}

local terminal_opts = {
  size = 20,
  open_mapping = [[<C-t>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mapping = true,
  persist_size = false,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

function M.setup()
  local terminal = require("toggleterm")
  terminal.setup(terminal_opts)
end

return M
