require("mason").setup()
require("mason-lspconfig").setup()

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<localleader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gE', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<localleader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<localleader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<localleader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<localleader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<localleader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<localleader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<localleader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<localleader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  debounce_text_changes = 150
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.offsetEncoding = { "utf-16" }

require("mason-lspconfig").setup_handlers({
  function(server_name)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities
    }
  end,
  ["lua_ls"] = function()
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = {"vim"}
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          }
        }
      },
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities
    })
  end
})
