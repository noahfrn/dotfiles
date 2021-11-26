local M = {}

local lualine_opts = {
  options = {
    icons_enabled = true,
    theme = "onedark",
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", {"diagnostics", sources={"nvim_lsp"}}},
    lualine_c = {"filename"},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_d = {"location"},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {}
}

function M.setup()
  local lualine = require("lualine")
  lualine.setup(lualine_opts)
end

return M
