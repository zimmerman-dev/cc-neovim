-- lua/plugins/lsp.lua

return {
  "neovim/nvim-lspconfig",
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.enable("clangd", {
      capabilities = capabilities,
    })

    vim.lsp.enable("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.enable("html", {
      capabilities = capabilities,
    })

    vim.lsp.enable("cssls", {
      capabilities = capabilities,
    })

    vim.lsp.enable("tsserver", {
      capabilities = capabilities,
    })
  end,
}

