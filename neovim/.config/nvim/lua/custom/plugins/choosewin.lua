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
  end,
}
