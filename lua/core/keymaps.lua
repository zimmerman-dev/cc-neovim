local map = vim.keymap.set

local function opt(desc)
  return { noremap = true, silent = true, desc = desc }
end

-- Leader Key

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- General

map("n", "<Esc>", "<cmd>noh<CR>", opt("Banish the lingering specters of your last search"))
map("n", "<leader>fs", "<cmd>w<CR>", opt("Seal your work in runes of permanence"))
map("n", "<leader>qq", "<cmd>q<CR>", opt("Retreat from this Realm"))
map("n", "<leader>dd", "<cmd>Dashboard<CR>", opt("Step into the dreamlands"))
map("n", "<leader>fn", ":enew<CR>", opt("Summon a fresh page from the void"))
map("n", "<leader>QQ", ":q!<CR>", opt("He that breaks a thing to find out what it is, has left the path of wisdom"))
map("n", "<leader>sr", ":%s///gc<Left><Left><Left><Left>", opt("Speak a new name, and the old shall fade from all the pages"))

-- Window Resize with Ctrl + arrow keys

map("n", "<C-Left>", ":vertical resize -2<CR>", opt("Bend the walls of this chamber to your will"))
map("n", "<C-Right>", ":vertical resize +2<CR>", opt("Bend the walls of this chamber to your will"))
map("n", "<C-Down>", ":resize +2<CR>", opt("Bend the walls of this chamber to your will"))
map("n", "<C-Up>", ":resize -2<CR>", opt("Bend the walls of this chamber to your will"))

-- Tab navigation

map("n", "<leader>tn", "<Cmd>tabnew<CR>", opt("Open a new gate into unknown lands"))
map("n", "<leader>tc", "<Cmd>tabclose<CR>", opt("Collapse the gate and seal what lies beyond"))
map("n", "<leader>to", "<Cmd>tabonly<CR>", opt("Burn it all down"))

-- Cycle through tabs

map("n", "<Tab>", "gt", opt("Step through the shifting dimensions"))
map("n", "<S-Tab>", "gT", opt("Step through the shifting dimensions"))

-- Terminal splits

map("n", "<leader>tt", function()
  vim.cmd("split | terminal")
  vim.cmd("startinsert")
end, opt("Split the earth and descend"))

map("n", "<leader>tv", function()
  vim.cmd("vsplit | terminal")
  vim.cmd("startinsert")
end, opt("Cleave the void and walk beneath worlds"))

-- Open keymaps doc

map("n", "<leader>km", function()
  local file = vim.fn.stdpath("config") .. "/docs/keymaps.md"
  if vim.fn.filereadable(file) == 1 then
    vim.cmd.edit(vim.fn.fnameescape(file))
  else
    vim.notify("docs/keymaps.md not found in " .. vim.fn.stdpath("config"), vim.log.levels.WARN)
  end
end, opt("Open keymaps doc"))

-- Buffers

map("n", "<leader>bn", ":bnext<CR>", opt("Turn the page of this eldritch tome"))
map("n", "<leader>bp", ":bprevious<CR>", opt("Trace backward through forbidden texts"))
map("n", "<leader>bd", ":bdelete<CR>", opt("Cast it into the fire! Destroy it!"))

-- Telescope

map("n", "<leader>fd", function()
  require("telescope.builtin").find_files({
    cwd = vim.fn.expand("%:p:h"),
  })
end, opt("Reveal the hidden paths of this directory"))

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opt("Summon files from the void"))
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opt("Whisper into the abyss, it whipsers back"))
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opt("Where did I leave that buffer...?"))
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opt("Consult the ancient scrolls"))

-- DAP Keymaps (Debugging)

map("n", "<F5>", function()
  require("dap").continue()
end, opt("Invoke the debugger spirit, let it run free"))

map("n", "<F10>", function()
  require("dap").step_over()
end, opt("Stride over the lesser incantation"))

map("n", "<F11>", function()
  require("dap").step_into()
end, opt("Descend into the depths of the calling ritual"))

map("n", "<F12>", function()
  require("dap").step_out()
end, opt("Ascend from the depths, return to the outer rite"))

map("n", "<Leader>db", function()
  require("dap").toggle_breakpoint()
end, opt("Mark this place where the spirits shall pause"))

map("n", "<Leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, opt("Bind the spirits with a conditional sigil"))

map("n", "<Leader>du", function()
  require("dapui").toggle()
end, opt("Raise or banish the scrying window of the debugger"))

map("n", "<Leader>dQ", function()
  require("dap").terminate()
end, opt("Banish the debugger spirit back to the void"))

-- Escape closures <C-Space>

map("i", "<C-Space>", function()
  local line = vim.fn.getline(".")
  local col = vim.fn.col(".")
  local rest = line:sub(col, #line)
  local closing = rest:match("^([%)%]%}\"'`>]+)")

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

-- LuaSnip: exit snippet without leaving insert mode

map("i", "<C-j>", function()
  local ls = require("luasnip")
  local current = ls.session and ls.session.current_nodes[vim.api.nvim_get_current_buf()]
  if current then
    ls.unlink_current()
  end
end, opt("Sever the thread and escape the snippet's grasp"))
