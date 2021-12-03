local M = {}

local function lsp_document_highlight(client)
  if require("lsp.config").document_highlight == false then
    return
  end

  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
        false
    )
  end
end

local function lsp_code_lens_refresh(client)
  if require("lsp.config").code_lens_refresh == false then
    return
  end

  if client.resolved_capabilities.code_lens then
    vim.api.nvim_exec(
      [[
        augroup lsp_code_lens_refresh
          autocmd! * <buffer>
          autocmd InsertLeave <buffer> lua vim.lsp.codelens.refresh()
          autocmd InsertLeave <buffer> lua vim.lsp.codelens.display()
        augroup END
      ]],
        false
    )
  end
end

local function add_lsp_buffer_keybindings(bufnr)
  local mappings = {
    normal_mode = "n",
    insert_mode = "i",
    visual_mode = "v",
  }
  local cmd_opts = { noremap = true, silent = true }

  for mode_name, mode_char in pairs(mappings) do
    for key, cmd in pairs(require("lsp.config").buffer_mappings[mode_name]) do
      vim.api.nvim_buf_set_keymap(bufnr, mode_char, key, cmd, cmd_opts)
    end
  end
end

function M.setup(client, bufnr)
  lsp_document_highlight(client)
  lsp_code_lens_refresh(client)
  add_lsp_buffer_keybindings(bufnr)
end

return M
