-- lsp

return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable("clangd", {}) -- C++

    vim.lsp.enable("lua_ls", {   -- Lua
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })
  end,
}

