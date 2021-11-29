local M = {}
M.methods = {}

local status_cmp, cmp = pcall(require, "cmp")
if not status_cmp then
  return
end
local status_luasnip, luasnip = pcall(require, "luasnip")
if not status_luasnip then
  return
end

function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp_opts = {
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  completion = {
    keyword_length = 1,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "treesitter" },
    { name = "cmdline" },
  },
  source_names = {
    nvim_lsp = "(LSP)",
    path = "(Path)",
    buffer = "(Buffer)",
    cmdline = "(Cmd)",
    luasnip = "(Snippet)",
  },
  duplicates = {
    buffer = 1,
    path = 1,
    nvim_lsp = 0,
    luasnip = 1,
  },
  duplicates_default = 0,
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, {
      "i",
      "s"
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s"
    }),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<cr>"] = cmp.mapping(function(fallback)
      if cmp.visible() and cmp.confirm(cmp_opts.confirm_opts) then
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        end
        return
      end

      if luasnip.expand_or_jumpable() then
        if not luasnip.jump(1) then
          fallback()
        end
      else
        fallback()
      end
    end),
  }
}

function M.setup()
  local nvim_cmp = require("cmp")
  nvim_cmp.setup(cmp_opts)
end

return M
