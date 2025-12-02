return {
  "nvim-lualine/lualine.nvim",
--  dependencies = { "nvim-tree/nvim-web-devicons" }, -- icons optional
  config = function()
    require("lualine").setup {
      options = {
        theme = "vague",
        section_separators = "",
        component_separators = "",
      },
    }
  end,
}

