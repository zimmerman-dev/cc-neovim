-- lua/plugins/init.lua

return {
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.plenary"),
--  require("colorscheme.tokyonight"),
  require("colorscheme.vague"),
  require("plugins.lualine"),
  require("plugins.lsp"),
  require("plugins.cmp"),
  require("plugins.autopairs"),
  require("plugins.luasnip"),
  require("plugins.dashboard"),
  require("plugins.debug"),
  require("plugins.jdtls"),
  require("plugins.autotag"),
}
