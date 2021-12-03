local lsp_opts = {
  document_highlight = true,
  code_lens_refresh = true,
  buffer_mappings = {
    normal_mode = {
      ["K"] = ":lua vim.lsp.buf.hover()<cr>",
      ["gd"] = ":lua vim.lsp.buf.definition()<cr>",
      ["gD"] = ":lua vim.lsp.buf.declaration()<cr>",
      ["gr"] = ":lua vim.lsp.buf.references()<cr>",
      ["gI"] = ":lua vim.lsp.buf.implementation()<cr>",
      ["gs"] = ":lua vim.lsp.buf.signature_help()<cr>",
      ["<leader>l"] = ":lua vim.lsp.diagnostic.show_line_diagnostics()<cr>",
      ["<leader>ff"] = ":lua vim.lsp.buf.formatting()<cr>",
      ["[d"] = ":lua vim.lsp.diagnostic.goto_prev()<cr>",
      ["]d"] = ":lua vim.lsp.diagnostic.goto_next()<cr>",
      ["<leader>ca"] = ":lua vim.lsp.buf.code_action()<cr>;"
    },
    insert_mode = {},
    visual_mode = {},
  },
}

return lsp_opts
