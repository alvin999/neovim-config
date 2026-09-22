return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        separator_style = "slant", -- 可選: "slant" (斜線), "thin" (細線), "thick" (粗線)
        show_buffer_close_icons = true,
        show_close_icon = false,
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
      },
    },
    keys = {
      -- 分頁切換
      { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "切換至下一個分頁" },
      { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "切換至上一個分頁" },
      -- 分頁管理
      { "<leader>bn", "<cmd>enew<cr>", desc = "開新空白分頁 (New Buffer)" },
      { "<leader>x", "<cmd>bdelete<cr>", desc = "關閉目前分頁" },
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "釘選/取消釘選分頁" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "關閉其他所有分頁" },
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "關閉右側所有分頁" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "關閉左側所有分頁" },
    },
  },
}
