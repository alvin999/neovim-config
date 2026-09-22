return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      max_lines = 3,
      min_window_height = 0,
      line_numbers = true,
      multiline_threshold = 1,
      trim_scope = "outer",
      mode = "cursor",
    },
    keys = {
      {
        "[c",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
        desc = "跳轉到上下文起始行 (Jump to Context)",
      },
    },
  },
}
