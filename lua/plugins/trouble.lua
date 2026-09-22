return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "診斷清單 (Diagnostics)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "當前緩衝區診斷 (Buffer Diagnostics)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "符號結構列表 (Symbols)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP 定義/參照 (LSP Info)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
    },
    opts = {},
  },
}
