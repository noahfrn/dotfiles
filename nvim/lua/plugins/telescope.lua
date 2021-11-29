local M = {}

local telescope_opts = {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      preview_cutoff = 120,
      horizontal = { mirror = false },
      vertical = { mirror = false },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
  },
    color_devicons = true,
    pickers = {
      find_files = {
        find_command = { "fd", "--type=file", "--hidden", "--smart-case" },
      },
      live_grep = {
        only_sort_text = true,
      },
    },
  }
}

function M.setup()
  local telescope = require("telescope")
  telescope.setup(telescope_opts)
end

return M
