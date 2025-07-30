-- lua/core/options.lua

local opt = vim.opt

-- UI
opt.number = true                  -- Show line numbers
opt.relativenumber = true          -- Relative line numbers for motions
opt.cursorline = true              -- Highlight the current line
opt.termguicolors = true           -- Enable true color support
opt.signcolumn = "yes"             -- Always show the sign column
opt.scrolloff = 8                  -- Keep cursor 8 lines away from screen edge
opt.pumheight = 7                  -- Limit pop-up menu height

-- Indentation
opt.tabstop = 4                    -- Number of spaces a tab counts for
opt.shiftwidth = 4                 -- Number of spaces for each indentation
opt.expandtab = true               -- Convert tabs to spaces
opt.smartindent = true             -- Autoindent new lines
opt.autoindent = true              -- Maintain indentation on new lines

-- Editing
-- opt.wrap = false                   -- Disable line wrapping
opt.clipboard = "unnamedplus"      -- Use system clipboard
opt.mouse = "a"                    -- Enable mouse support
opt.undofile = true                -- Persistent undo
opt.backup = false                 -- No backup files
opt.swapfile = false               -- No swap files
opt.updatetime = 300               -- Faster completion
opt.timeoutlen = 500               -- Shorter wait time for mapped sequences
opt.whichwrap:append("<,>")        -- Allow left/right arrow to wrap across lines

-- Search
opt.ignorecase = true              -- Ignore case when searching
opt.smartcase = true               -- Override ignorecase if uppercase used
opt.incsearch = true               -- Show search matches while typing
opt.hlsearch = true                -- Highlight search matches

-- Splits
opt.splitright = true              -- Vertical splits to the right
opt.splitbelow = true              -- Horizontal splits below

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }  -- Completion behavior
