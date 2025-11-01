-- lua/plugins/lsp.lua

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.lsp.enable("clangd", {}) -- C++

    vim.lsp.enable("lua_ls", {   -- Lua
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.enable("ts_ls", { -- ✅ Modern replacement for tsserver
      root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
    })

    vim.lsp.enable("html", {})
    vim.lsp.enable("cssls", {})
  end,
}

