# ⚡ Neovim 現代化高效能配置

一個基於 [lazy.nvim](https://github.com/folke/lazy.nvim) 構建的現代化 Neovim 開發環境配置。兼具極致流暢的視覺體驗、開箱即用的現代語言伺服器支援（LSP）、高效能自動補全與簡潔的模組化架構。

---

## ✨ 核心特色

- **模組化架構**：採用 `lua/plugins/` 單一職責分離結構，便於維護與依需求擴充。
- **極速自動補全**：搭載基於 Rust 預編譯引擎的 **blink.cmp**，延遲極低且鍵位不干擾 `<Tab>` 縮排。
- **現代化 LSP 與語法**：
  - 支援原生 Neovim 0.11+ LSP 配置規範，搭配 **Mason** 套件管理器。
  - **Treesitter** 語法高亮 + **nvim-treesitter-context** 上下文吸頂導航。
  - **conform.nvim** 快速鍵式多語言代碼格式化。
- **優雅的問題與診斷面板**：整合 **trouble.nvim (v3)**，專案錯誤與警告一目了然。
- **流暢視覺與動態美學**：
  - **Gruvbox** 經典配色。
  - **smear-cursor** 平滑游標拖尾殘影動畫。
  - **neoscroll** 減速曲線平滑捲動。
  - **lualine** 與 **bufferline** 狀態欄及分頁列。
- **檔案操作與導航**：
  - **oil.nvim** 將目錄結構視為緩衝區直接編輯的檔案管理器。
  - **telescope.nvim** 模糊搜尋。
  - **flash.nvim** 全螢幕快速跳轉。
  - **gitsigns.nvim** 行內 Git 變更追蹤與 Blame。

---

## 🛠️ 環境需求

- **Neovim** $\ge$ 0.10.0（推薦 0.11+）
- **Git**
- **Nerd Font**（推薦例如 JetBrainsMono Nerd Font，以確保狀態列與圖示正常顯示）
- **ripgrep**（Telescope 全文搜尋必備）
- **C 編譯器**（如 `gcc`、`clang` 或 Windows 上的 Visual Studio Build Tools / `cl`，用於 Treesitter parser 編譯）
- **Node.js** 與 **Python**（供 Mason 下載部分語言伺服器使用）

---

## 📦 安裝說明

### 1. 備份現有設定（若有）
- **Windows (PowerShell)**:
  ```powershell
  Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
  ```
- **macOS / Linux**:
  ```bash
  mv ~/.config/nvim ~/.config/nvim.bak
  ```

### 2. 複製本儲存庫
- **Windows (PowerShell)**:
  ```powershell
  git clone https://github.com/alvin999/neovim-config.git $env:LOCALAPPDATA\nvim
  ```
- **macOS / Linux**:
  ```bash
  git clone https://github.com/alvin999/neovim-config.git ~/.config/nvim
  ```

### 3. 啟動與自動安裝
打開 Neovim：
```bash
nvim
```
`lazy.nvim` 會自動啟動並下載所有外掛。初次安裝完成後即可開始使用！

---

## 📂 目錄結構

```
nvim/
├── init.lua                      # 進入點、Lazy.nvim 載入器、Leader 鍵設定 (<Space>)
├── lazy-lock.json                # 套件版本鎖定檔
├── README.md                     # 專案說明文件
└── lua/
    └── plugins/
        ├── animation.lua         # 游標拖尾 (smear-cursor) 與平滑滾動 (neoscroll)
        ├── blink.lua             # 高效能自動補全 (blink.cmp) 與 Snippets
        ├── bufferline.lua        # 分頁標籤列 (bufferline.nvim)
        ├── colorscheme.lua       # 配色主題 (gruvbox.nvim)
        ├── conform.lua           # 代碼格式化 (conform.nvim)
        ├── editing.lua           # 括號自動補全 (nvim-autopairs)
        ├── filemanager.lua       # 緩衝區式檔案管理器 (oil.nvim)
        ├── flash.lua             # 視野跳轉與快速選取 (flash.nvim)
        ├── git.lua               # Git 狀態指示與區塊操作 (gitsigns.nvim)
        ├── lsp.lua               # 語言伺服器配置 (nvim-lspconfig + mason.nvim)
        ├── telescope.lua         # 模糊搜尋器 (telescope.nvim)
        ├── treesitter.lua        # 語法分析核心 (nvim-treesitter)
        ├── treesitter-context.lua# 函式與類別上下文吸頂 (nvim-treesitter-context)
        ├── trouble.lua           # 診斷與問題面板 (trouble.nvim)
        └── ui.lua                # 狀態列 (lualine) 與鍵位提示 (which-key)
```

---

## ⌨️ 常用快捷鍵指南

> **Leader 鍵設定為空白鍵 (`<Space>`)**

### 1. 檔案與搜尋 (Telescope / Oil)

| 快捷鍵 | 模式 | 功能說明 |
| :--- | :--- | :--- |
| `<leader>e` 或 `-` | Normal | 開啟 / 關閉檔案管理器 (Oil) |
| `<leader>ff` | Normal | 尋找檔案 (Find Files) |
| `<leader>fg` | Normal | 專案全文搜尋 (Live Grep) |
| `<leader>fb` | Normal | 列出開啟中的緩衝區 (Buffers) |
| `<leader>fo` | Normal | 最近開啟過的檔案 (Old Files) |
| `<leader>fh` | Normal | 搜尋說明文件 (Help Tags) |
| `<leader>ft` | Normal | 切換檔案類型 (Filetypes) |

### 2. 分頁與導航 (BufferLine / Flash)

| 快捷鍵 | 模式 | 功能說明 |
| :--- | :--- | :--- |
| `<Tab>` | Normal | 切換至下一個分頁 |
| `<S-Tab>` | Normal | 切換至上一個分頁 |
| `<leader>bp` | Normal | 固定 / 取消固定當前分頁 (Pin) |
| `<leader>bc` | Normal | 關閉非固定分頁 |
| `s` | Normal / Visual | Flash 快速視野跳轉 (Jump) |
| `S` | Normal / Visual | Flash Treesitter 語法區塊選取 |
| `[c` | Normal | 向上跳轉到當前函式/類別 context 宣告行 |

### 3. 自動補全 (blink.cmp)

| 快捷鍵 | 模式 | 功能說明 |
| :--- | :--- | :--- |
| `<CR>` (Enter) | Insert | 確認接受補全項目 |
| `<C-n>` 或 `<C-j>` | Insert | 下一個補全項目 |
| `<C-p>` 或 `<C-k>` | Insert | 上一個補全項目 |
| `<C-space>` | Insert | 手動喚出補全選單 |
| `<C-e>` | Insert | 關閉補全選單 |
| `<Tab>` | Insert | **保留原始縮排行為**，絕不干擾程式碼輸入 |

### 4. 程式碼分析、LSP 與格式化

| 快捷鍵 | 模式 | 功能說明 |
| :--- | :--- | :--- |
| `<leader>cf` | Normal / Visual | 手動格式化程式碼 (Conform) |
| `gd` | Normal | 跳轉到定義 (Definition) |
| `gD` | Normal | 跳轉到宣告 (Declaration) |
| `gi` | Normal | 跳轉到實作 (Implementation) |
| `gr` | Normal | 搜尋所有引用 (References) |
| `K` | Normal | 懸浮文檔提示 (Hover Doc) |
| `<leader>rn` | Normal | 重新命名符號 (Rename) |
| `<leader>ca` | Normal / Visual | 代碼操作與修正建議 (Code Action) |
| `<leader>d` | Normal | 檢視行內診斷詳情 (Line Diagnostics) |
| `[d` / `]d` | Normal | 上一處 / 下一處診斷問題 |
| `<leader>cm` | Normal | 開啟 Mason 套件管理器視窗 |

### 5. 診斷與問題面板 (Trouble)

| 快捷鍵 | 模式 | 功能說明 |
| :--- | :--- | :--- |
| `<leader>xx` | Normal | 切換全域專案診斷清單 |
| `<leader>xX` | Normal | 切換當前檔案緩衝區診斷清單 |
| `<leader>cs` | Normal | 檢視符號結構清單 (Symbols) |
| `<leader>cl` | Normal | 檢視 LSP 定義與引用清單 |
| `<leader>xQ` | Normal | 切換 Quickfix 列表 |
| `<leader>xL` | Normal | 切換 Location List |

### 6. Git 版本控制 (Gitsigns)

| 快捷鍵 | 模式 | 功能說明 |
| :--- | :--- | :--- |
| `]c` / `[c` | Normal | 下一處 / 上一處 Git 變更區塊 |
| `<leader>gp` | Normal | 預覽當前變更區塊 (Preview Hunk) |
| `<leader>gb` | Normal | 檢視當前行 Blame 資訊 |
| `<leader>gd` | Normal | 檢視差異比較 (Diff) |

---

## 🌐 預設支援語言與工具

透過 **Mason** 與 **nvim-lspconfig** 自動配置：
- **Lua**: `lua_ls`、`stylua`
- **TypeScript / JavaScript / React**: `ts_ls`、`prettier` / `prettierd`
- **Svelte**: `svelte`
- **Python**: `pyright`、`isort`、`black`
- **Go**: `gopls`、`gofmt`、`goimports`
- **SQL**: `sqls`、`sql-formatter`
- **Groovy**: `groovyls`
- **ActionScript**: 專屬本地 AS3/MXML 語言伺服器整合

---

## 📜 授權

本專案採用 [MIT License](LICENSE) 開源授權。
