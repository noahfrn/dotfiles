local M = {}

local _, packer = pcall(require, "packer")
local compile_path = vim.fn.stdpath "config" .. "/plugin/packer_compiled.lua"

function M.init()
  local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  local package_root = vim.fn.stdpath "data" .. "/site/pack"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
    vim.cmd "packadd packer.nvim"
  end

  packer.init {
    package_root = package_root,
    max_jobs = 50,
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" } 
      end
    }
  }
end

function M.load(plugins)
  local ok, _ = pcall(function()
    packer.startup(function(use)
      for _, plugin in ipairs(plugins) do
        use(plugin)
      end
    end)
  end)
end

local function pcall_packer_command(cmd)
  pcall(function()
    require("packer")[cmd]()
  end)
end

local function cache_clear()
  vim.fn.delete(compile_path)
end

function M.recompile()
  cache_clear()
  pcall_packer_command("compile")
end

return M
