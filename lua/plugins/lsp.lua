return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.clangd.setup {} -- C/C++
    lspconfig.lua_ls.setup {  -- Optional: Lua support
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    }
  end,
}

