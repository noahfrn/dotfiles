function _G.set_terminal_keymaps()
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<C-\\><C-n>', opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', '<C-\\><C-n><C-w>h', opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', '<C-\\><C-n><C-w>j', opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', '<C-\\><C-n><C-w>k', opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', '<C-\\><C-n><C-w>l', opts)
end

return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    local toggleterm = require("toggleterm")
    toggleterm.setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      direction = 'float',
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
      },
      highlights = {
        border = "Normal",
        background = "Normal",
      }
    })


    vim.cmd('autocmd TermOpen term://* lua set_terminal_keymaps()')
  end
}
