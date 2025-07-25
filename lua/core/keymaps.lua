local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General
map("n", "<Esc>", "<cmd>noh<CR>", opts) -- Clear search highlight
map("n", "<leader>fs", "<cmd>w<CR>", opts) -- Save file
map("n", "<leader>qq", "<cmd>q<CR>", opts) -- Quit

-- Window Resize with Ctrl + h/j/k/l
map("n", "<C-h>", ":vertical resize -2<CR>", opts)
map("n", "<C-l>", ":vertical resize +2<CR>", opts)
map("n", "<C-j>", ":resize +2<CR>", opts)
map("n", "<C-k>", ":resize -2<CR>", opts)

-- Tab navigation
vim.keymap.set("n", "<leader>tn", "<Cmd>tabnew<CR>", opts)        -- New tab
vim.keymap.set("n", "<leader>tc", "<Cmd>tabclose<CR>", opts)      -- Close tab
vim.keymap.set("n", "<leader>to", "<Cmd>tabonly<CR>", opts)       -- Close all but current tab
vim.keymap.set("n", "<leader>tp", "<Cmd>tabprevious<CR>", opts)   -- Previous tab

-- Open horizontal terminal split: <leader>ht
vim.keymap.set("n", "<leader>tt", function()
  vim.cmd("split | terminal")
  vim.cmd("startinsert")
end, { desc = "Open Horizontal Terminal" })

-- Open vertical terminal split: <leader>vt
vim.keymap.set("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal")
  vim.cmd("startinsert")
end, { desc = "Open Vertical Terminal" })

-- Use Tab / Shift-Tab for tab cycling
vim.keymap.set("n", "<Tab>", "gt", opts)
vim.keymap.set("n", "<S-Tab>", "gT", opts)

-- Buffers
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>e", vim.diagnostic.open_float, opts)

