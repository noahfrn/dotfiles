local M = {}

local comment_opts = {
  active = true,
  padding = true,
  ignore = "^$",
  mappings = {
    basic = true,
    extra = false,
  },
  toggler = {
    line = "gcc",
    block = "gbc",
  },
  opleader = {
    line = "gc",
    block = "gb",
  }
}

function M.setup()
  local nvim_comment = require("Comment")
  nvim_comment.setup(comment_opts)
end

return M
