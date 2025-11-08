-- lua/plugins/dashboard.lua
return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
"",
"",
"",
"",
"",
"",
            [[    ad888                                                                                                         888ba    ]],
            [[    88'                                                                                      88                     `88    ]],
            [[    88                                                                                       ""                      88    ]],
            [[    88                                                                                                               88    ]],
            [[   ,8P   ,adPPYba,   ,adPPYba,            8b,dPPYba,    ,adPPYba,   ,adPPYba,   8b       d8  88  88,dPYba,,adPYba,   Y8,   ]],
            [[  88(   a8"     ""  a8"     ""  aaaaaaaa  88P'   `"8a  a8P_____88  a8"     "8a  `8b     d8'  88  88P'   "88"    "8a   )88  ]],
            [[   "8b  8b          8b          """"""""  88       88  8PP"""""""  8b       d8   `8b   d8'   88  88      88      88  d8"   ]],
            [[    88  "8a,   ,aa  "8a,   ,aa            88       88  "8b,   ,aa  "8a,   ,a8"    `8b,d8'    88  88      88      88  88    ]],
            [[    88   `"Ybbd8"'   `"Ybbd8"'            88       88   `"Ybbd8"'   `"YbbdP"'       "8"      88  88      88      88  88    ]],
            [[    88,                                                                                                             ,88    ]],
            [[    "Y888                                                                                                         888P"    ]],

"",
"",
"",
"",
"",
"",
            },
        center = {
          { icon = "  ", desc = "Keymaps"},
          { icon = " 󰈔 ", desc = "New File              ", action = "enew", },
          { icon = " 󰈞 ", desc = "Find File             ", action = "Telescope find_files" },
          { icon = " 󰉖 ", desc = "Open Projects Folder  ", action = function() require("telescope").extensions.file_browser.file_browser({path = "~/projects", depth = 1, grouped = true}) end,},
          { icon = " 󰥔 ", desc = "Recent Files          ", action = "Telescope oldfiles" },
          { icon = " 󰒓 ", desc = "Edit Config           ", action = function() require("telescope").extensions.file_browser.file_browser({ path = vim.fn.stdpath("config"), grouped = true }) end },
          { icon = "  ", desc = "Manage Plugins        ", action = "Lazy" },
          { icon = " 󰅙 ", desc = "Quit                  ", action = "qa" },
        },
      },
    })
  end,
}
