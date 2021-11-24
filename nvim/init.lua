settings = require("settings")
settings.load()

keymaps = require("keymaps")
keymaps.load()

loader = require("loader")
loader.load(require("plugins"))
