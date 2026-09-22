-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 設定 Leader 鍵為空白鍵 (Space)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 載入 lua/plugins/ 底下的所有外掛配置
require("lazy").setup("plugins")
