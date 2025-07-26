return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  event = "InsertEnter",
  config = function()
    local ls = require("luasnip")

    ls.config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    -- Load your custom snippets
    require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })

    -- Register the keymap here (only loads after LuaSnip is ready)
 vim.keymap.set("i", "<C-j>", function()
      local current = ls.session and ls.session.current_nodes[vim.api.nvim_get_current_buf()]
      if current then
        ls.unlink_current()
      end
    end, { noremap = true, silent = true, desc = "Forcefully exit snippet without leaving insert mode" })
  end,
}

