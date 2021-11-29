local M = {}

local treesitter_opts = {
  ensure_installed = "maintained",
  ignore_install = {},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "latex" },
  },
  context_commentstring = {
    enable = true
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  },
}


function M.setup()
  local treesitter = require("nvim-treesitter.configs")
  treesitter.setup(treesitter_opts)
end

return M
