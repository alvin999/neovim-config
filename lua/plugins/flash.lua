return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash 快速跳轉 (Jump)" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter 語法區塊選取" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Flash 遠端操作 (Remote Flash)" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter 搜尋" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "切換 Flash 搜尋" },
    },
  },
}
