return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "開啟目前目錄 (Oil)" },
      { "<leader>e", "<cmd>Oil<cr>", desc = "檔案管理器 (Oil)" },
    },
  },
}
