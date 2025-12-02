-- init.lua

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load core config
require("core.options")
require("core.keymaps")
require("core.autocommands")

-- Load custom Obsidian-style link handler (this is your new line)
require("core.obsidian_links")

-- Load Lazy.nvim plugins
require("core.lazy")

