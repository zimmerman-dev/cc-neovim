local map = vim.keymap.set

-- Replace opts with a helper function

local function opt(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- Leader Key

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General

map("n", "<Esc>", "<cmd>noh<CR>", opt("Banish the lingering specters of your last search")) -- Clear search highlight
map("n", "<leader>fs", "<cmd>w<CR>", opt("Seal your work in runes of permanence")) -- File save
map("n", "<leader>qq", "<cmd>q<CR>", opt("Retreat from this Realm")) -- Quit
map("n", "<leader>dd", "<cmd>Dashboard<CR>", opt("Step into the dreamlands")) -- Open Dashboard
map("n", "<leader>fn", ":enew<CR>", opt("Summon a fresh page from the void")) -- New file
map("n", "<leader>QQ", ":q!<CR>", opt("He that breaks a thing to find out what it is, has left the path of wisdom")) -- Quit unsaved
map("n", "<leader>sr", ":%s///gc<Left><Left><Left><Left>", opt("Speak a new name, and the old shall fade from all the pages")) -- Search and Replace

-- Window Resize with Ctrl + h/j/k/l

map("n", "<C-Left>", ":vertical resize -2<CR>", opt("Bend the walls of this chamber to your will"))
map("n", "<C-Right>", ":vertical resize +2<CR>", opt("Bend the walls of this chamber to your will"))
map("n", "<C-Down>", ":resize +2<CR>", opt("Bend the walls of this chamber to your will"))
map("n", "<C-Up>", ":resize -2<CR>", opt("Bend the walls of this chamber to your will"))

-- Tab navigation

map("n", "<leader>tn", "<Cmd>tabnew<CR>", opt("Open a new gate into unknown lands")) -- New tab
map("n", "<leader>tc", "<Cmd>tabclose<CR>", opt("Collapse the gate and seal what lies beyond"))  -- Close tab
map("n", "<leader>to", "<Cmd>tabonly<CR>", opt("Burn it all down"))       -- Close all but current tab

-- Cycle through tabs <Tab> - <S/Tab>

map("n", "<Tab>", "gt", opt("Step through the shifting dimensions"))
map("n", "<S-Tab>", "gT", opt("Step through the shifting dimensions"))

-- Open horizontal terminal split: <leader>tt

map("n", "<leader>tt", function()
  vim.cmd("split | terminal")
  vim.cmd("startinsert")
end, { desc = "Split the earth and descend" })

-- Open vertical terminal split: <leader>tv

map("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal")
  vim.cmd("startinsert")
end, { desc = "Cleave the void and walk beneath worlds" })


-- Buffers

map("n", "<leader>bn", ":bnext<CR>", opt("Turn the page of this eldritch tome")) -- Cycle through buffers
map("n", "<leader>bp", ":bprevious<CR>", opt("Trace backward through forbidden texts"))
map("n", "<leader>bd", ":bdelete<CR>", opt("Cast it into the fire! Destroy it!"))

-- Telescope

map("n", "<leader>fd", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.expand("%:p:h"),  -- current file's directory
  })
end, opt("Reveal the hidden paths of this directory"))

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opt("Summon files from the void"))
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opt("Whisper into the abyss, it whipsers back"))
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opt("Where did I leave that buffer...?"))
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opt("Consult the ancient scrolls"))

-- LSP

map("n", "gd", vim.lsp.buf.definition, opt("Step through the threshhold to its origin"))
map("n", "K", vim.lsp.buf.hover, opt("Gaze upon the forbidden knowledge"))
map("n", "gr", vim.lsp.buf.references, opt("Summon all who speak its accursed name"))
map("n", "[d", vim.diagnostic.goto_prev, opt("Head the echoes of past warnings"))
map("n", "]d", vim.diagnostic.goto_next, opt("Follow the whispers of impending doom"))
map("n", "<leader>rn", vim.lsp.buf.rename, opt("Bestow a new, secret name upon it"))
map("n", "<leader>ca", vim.lsp.buf.code_action, opt("Invoke the rites of transformation"))
map("n", "<leader>e", vim.diagnostic.open_float, opt("Unveil the whispers of the unseen"))

-- editor

-- Escape closures <C-Space> (works without LuaSnip)
map("i", "<C-Space>", function()
  local line = vim.fn.getline(".")
  local col = vim.fn.col(".")
  local rest = line:sub(col, #line)
  local closing = rest:match("^([%)%]%}\"'>]+)")

  if closing then
    vim.api.nvim_feedkeys(
      vim.api.nvim_replace_termcodes("<Right>", true, false, true):rep(#closing),
      "n",
      false
    )
  else
    vim.api.nvim_feedkeys(" ", "n", false)
  end
end, opt("Jump out of surrounding closures"))

