return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      extensions = {
        file_browser = {
          grouped = true,   -- group folders first
          hidden = false,   -- don't show hidden files unless toggled
          respect_gitignore = true,
        },
      },
    })
    telescope.load_extension("file_browser")
  end,
}

