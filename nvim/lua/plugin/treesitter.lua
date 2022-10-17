require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash", "c", "clojure", "cmake", "cpp", "dockerfile",
    "fennel", "gitignore", "go", "hcl", "json", "lua", "make",
    "markdown", "markdown_inline", "python", "rust", "scheme",
    "toml", "vim", "yaml"
  },
  highlight = { enable = true }
}
