return {
  -- 狀態列
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "gruvbox",
        icons_enabled = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
    },
  },

  -- 快捷鍵提示面板
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
