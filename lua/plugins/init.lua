-- init.lua

return {
  -- Syntax parsing engine
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Common Lua utility library (dependency for many plugins)
  {
    "nvim-lua/plenary.nvim",
  },

  -- Fuzzy file finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
