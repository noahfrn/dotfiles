return {
  'vim-test/vim-test',
  config = function()
    vim.cmd.nmap('<leader>tt', '<cmd>TestNearest<CR>')
    vim.cmd.nmap('<leader>tT', '<cmd>TestFile<CR>')
    vim.cmd.nmap('<leader>ta', '<cmd>TestSuite<CR>')
    vim.cmd.nmap('<leader>tl', '<cmd>TestLast<CR>')
    vim.cmd.nmap('<leader>tg', '<cmd>TestVisit<CR>')
    vim.g["test#strategy"] = "neovim"
  end
}
