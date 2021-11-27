settings = require("settings")
settings.load()

loader = require("loader")
loader.init()
loader.load(require("plugins"))

keymaps = require("keymaps")
keymaps.load()

vim.cmd [[colorscheme onedark]]
