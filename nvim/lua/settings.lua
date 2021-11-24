local M = {}

local default_opts = {
		backup = false,
		writebackup = false,
		clipboard = "unnamedplus",
		cmdheight = 2,
		hlsearch = true,
		hidden = true,
		ignorecase = true,
		smartcase = true,
		splitbelow = true,
		splitright = true,
		termguicolors = true,
		swapfile = false,
		expandtab = true,
		shiftwidth = 2,
		tabstop = 2,
		number = true,
		relativenumber = true,
		numberwidth = 4,
		signcolumn = "yes",
		wrap = false,
		spell = false,
		spelllang = "en",
		scrolloff = 8,
		sidescrolloff = 8,
		undofile = true,
		title = true,
		updatetime = 300
	}

function M.load()
	for k, v in pairs(default_opts) do
		vim.opt[k] = v
	end
end

return M
