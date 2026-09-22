return {
  -- 平滑游標移動與拖尾殘影動畫
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      stiffness = 0.8,               -- 游標彈性 (0.1 ~ 1.0)
      trailing_stiffness = 0.5,      -- 拖尾殘影彈性
      distance_stop_animating = 0.5, -- 停止動畫距離閥值
      hide_target_hack = false,
    },
  },

  -- 平滑頁面滾動與翻頁動畫
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = {
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
      hide_cursor = true,            -- 捲動時暫時隱藏游標
      stop_eof = true,               -- 滾動至檔案尾端時平滑停止
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing_function = "quadratic", -- 減速平滑曲線
    },
  },
}
