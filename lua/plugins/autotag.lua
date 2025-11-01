return {
  "windwp/nvim-ts-autotag",
  ft = { "html", "javascript", "javascriptreact", "typescriptreact" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-ts-autotag").setup()
  end,
}

