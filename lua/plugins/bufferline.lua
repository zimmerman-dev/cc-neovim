-- plugins/bufferline.lua

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",            -- other option: "tabs"
        numbers = "ordinal",         -- can also be "buffer_id" or false
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
          icon = "▎",               -- this is the little marker next to the buffer name
          style = "icon",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15,     -- prefix used when a buffer is deduplicated
        tab_size = 20,
        diagnostics = false,        -- use "nvim_lsp" if you want LSP indicators
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        enforce_regular_tabs = false,
        separator_style = "slant",  -- "slant" | "thick" | "thin" | { 'custom', 'custom' }
        always_show_bufferline = true,
        sort_by = "id",
      }
    })
  end,
}

