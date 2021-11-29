local M = {}

function M.load()
  local lsp_status, _ = pcall(require, "lspconfig")
  if not lsp_status then
    return
  end
end

return M
