return {
  's1n7ax/nvim-window-picker',
  name = 'window-picker',
  event = 'VeryLazy',
  version = '2.*',
  config = function()
    require 'window-picker'.setup({
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        bo = {
          filetype = { "notify", "quickfix" },
          buftype = { "terminal" }
        },
      },
    })

    local picker = require("window-picker")

    vim.keymap.set("n", ",w", function()
      local picked_window_id = picker.pick_window({
        include_current_win = true
      }) or vim.api.nvim_get_current_win()
      vim.api.nvim_set_current_win(picked_window_id)
    end, { desc = "Pick a window" })

    local function swap_windows()
      local window = picker.pick_window({
        include_current_win = false
      })
      local target_buffer = vim.fn.winbufnr(window)
      -- Set the target window to contain current buffer
      vim.api.nvim_win_set_buf(window, 0)
      -- Set current window to contain target buffer
      vim.api.nvim_win_set_buf(0, target_buffer)
    end

    vim.keymap.set('n', ',W', swap_windows, { desc = 'Swap windows' })
  end,
}
