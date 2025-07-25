-- lua/plugins/luasnip.lua

return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  event = "InsertEnter",
  config = function()
    require("luasnip").config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })
  end,
}

