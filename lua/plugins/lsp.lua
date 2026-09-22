return {
  -- Mason 主外掛：語言伺服器管理器
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "開啟 Mason 套件管理器" } },
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Mason 與 LSP 橋接外掛
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- 自動確保安裝各語言的 Language Server
      ensure_installed = {
        "lua_ls",    -- Lua
        "ts_ls",     -- TypeScript / JavaScript / React
        "svelte",    -- Svelte
        "pyright",   -- Python
        "gopls",     -- Go
        "sqls",      -- SQL
        "groovyls",  -- Groovy
      },
      automatic_installation = true,
    },
  },

  -- Neovim 官方 LSP 核心配置
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- 統一綁定快捷鍵 (當 LSP 連線成功時自動生效)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "跳轉到定義 (Definition)")
          map("gD", vim.lsp.buf.declaration, "跳轉到宣告 (Declaration)")
          map("gi", vim.lsp.buf.implementation, "跳轉到實作 (Implementation)")
          map("gr", "<cmd>Telescope lsp_references<cr>", "搜尋所有引用 (References)")
          map("K", vim.lsp.buf.hover, "懸浮文檔提示 (Hover Doc)")
          map("<leader>rn", vim.lsp.buf.rename, "符號重新命名 (Rename)")
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "LSP: 代碼操作建議 (Code Action)" })
          map("<leader>d", vim.diagnostic.open_float, "開啟行診斷資訊 (Line Diagnostics)")
          map("[d", vim.diagnostic.goto_prev, "上一處診斷問題")
          map("]d", vim.diagnostic.goto_next, "下一處診斷問題")
        end,
      })

      -- 診斷彈跳視窗樣式優化
      vim.diagnostic.config({
        float = { border = "rounded" },
        virtual_text = true,
      })

      -- 1. Lua 專用設定
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- 2. TypeScript / React 檔案類型支援
      vim.lsp.config("ts_ls", {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      -- 3. ActionScript 專用自訂伺服器（動態調用家目錄現有資產）
      local home = vim.fn.expand("~")
      vim.lsp.config("as3mxml", {
        cmd = {
          home .. "/.jdks/ms-11.0.31/bin/java.exe",
          "-cp",
          home .. "/.vscode/extensions/bowlerhatllc.vscode-as3mxml-1.24.0/bin/*;"
            .. home .. "/.vscode/extensions/bowlerhatllc.vscode-as3mxml-1.24.0/bundled-compiler/*",
          "com.as3mxml.vscode.Main",
        },
        filetypes = { "actionscript" },
        root_markers = { "asconfig.json", ".actionScriptProperties", ".git" },
      })

      -- 啟用所有已配置的語言伺服器
      vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "svelte",
        "pyright",
        "gopls",
        "sqls",
        "groovyls",
        "as3mxml",
      })
    end,
  },
}
