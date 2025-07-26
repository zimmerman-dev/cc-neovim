return {
  "ellisonleao/glow.nvim",
  cmd = "Glow",  -- only loads when you run :Glow
  config = function()
    require("glow").setup({
      border = "shadow",
      style = vim.o.background == "dark" and "dark" or "light", -- auto-match based on theme
      pager = false,
    })
  end,
}

