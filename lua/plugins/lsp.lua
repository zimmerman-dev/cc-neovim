-- lua/plugins/lsp.lua

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Merge cmp-nvim-lsp capabilities so servers advertise snippet/LSP support
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then capabilities = cmp_lsp.default_capabilities(capabilities) end
    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.enable("clangd", {}) -- C++

    vim.lsp.enable("lua_ls", {   -- Lua
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.enable("ts_ls", {   -- TypeScript / JavaScript
      root_dir = function(fname)
        return vim.fs.root(fname, { "package.json", ".git" })
      end,
    })

    vim.lsp.enable("html", {})
    vim.lsp.enable("cssls", {})
  end,
}
