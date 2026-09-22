return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "│" },
        change       = { text = "│" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
        untracked    = { text = "┆" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- 導航至下一個/上一個變更區塊
        map("n", "]c", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(function() gs.next_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "下一處 Git 變更" })

        map("n", "[c", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(function() gs.prev_hunk() end)
          return "<Ignore>"
        end, { expr = true, desc = "上一處 Git 變更" })

        -- 預覽與操作
        map("n", "<leader>gp", gs.preview_hunk, { desc = "預覽變更區塊 (Preview Hunk)" })
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "查看目前行 Blame" })
        map("n", "<leader>gd", gs.diffthis, { desc = "檢視差異 (Diff)" })
      end,
    },
  },
}
