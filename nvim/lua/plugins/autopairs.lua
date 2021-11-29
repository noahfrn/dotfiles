local M = {}

local autopair_opts = {
  check_ts = true,
}

function M.setup()
  local autopairs = require("nvim-autopairs")
  autopairs.setup(autopair_opts)
end

return M
