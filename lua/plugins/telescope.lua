return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "尋找檔案 (Find Files)" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "全文搜尋 (Live Grep)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "切換緩衝區 (Buffers)" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "說明文件 (Help Tags)" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "最近開啟檔案 (Old Files)" },
      { "<leader>ft", "<cmd>Telescope filetypes<cr>", desc = "切換檔案語言 (Filetypes)" },
    },
  },
}
