-- lua/core/autocommands.lua


-- Core Autocommands

-- Restore last cursor position when reopening files
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    if vim.bo.filetype ~= "gitcommit" and vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Automatically remove trailing white space
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local save_cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[%s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, save_cursor)
  end,
})

-- Open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
  pattern = "help",
  command = "wincmd L",
})

-- LSP buffer-local keymaps (set only when a language server attaches)
local lsp_group = vim.api.nvim_create_augroup("cc_lsp_keymaps", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(event)
    local buf = event.buf
    local map = vim.keymap.set
    local function opt(desc)
      return { noremap = true, silent = true, buffer = buf, desc = desc }
    end

    map("n", "gd",         vim.lsp.buf.definition,    opt("Step through the threshold to its origin"))
    map("n", "K",          vim.lsp.buf.hover,          opt("Gaze upon the forbidden knowledge"))
    map("n", "gr",         vim.lsp.buf.references,     opt("Summon all who speak its accursed name"))
    map("n", "[d",         vim.diagnostic.goto_prev,   opt("Heed the echoes of past warnings"))
    map("n", "]d",         vim.diagnostic.goto_next,   opt("Follow the whispers of impending doom"))
    map("n", "<leader>rn", vim.lsp.buf.rename,         opt("Bestow a new, secret name upon it"))
    map("n", "<leader>ca", vim.lsp.buf.code_action,    opt("Invoke the rites of transformation"))
    map("n", "<leader>e",  vim.diagnostic.open_float,  opt("Unveil the whispers of the unseen"))
  end,
})

