return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup {
      style = "night",
      transparent = false, -- keep false, terminal will handle transparency
    }
    vim.cmd.colorscheme("tokyonight")

    -- Clear Neovim background so terminal transparency shows through
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
    ]])
  end,
}
