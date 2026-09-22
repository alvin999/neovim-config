return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard", -- 可選: "hard", "medium", "soft"
      })
      vim.o.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end,
  },
}
