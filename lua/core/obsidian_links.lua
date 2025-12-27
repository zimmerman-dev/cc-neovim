-- lua/core/obsidian_links.lua
-- Minimal Obsidian-style [[wiki links]] support:
-- - <CR> on a link opens target in a new real tab
-- - <CR> elsewhere behaves normally
-- - Supports aliases: [[file.md|alias]]
-- - Resolves [[file]] -> file.md when possible

local M = {}

-- Utility: try to find a [[link]] under cursor in the current line.
-- Returns target string or nil.
local function get_wikilink_under_cursor()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- 1-based column

  local search_from = 1
  while true do
    local s, e, inner = line:find("%[%[(.-)%]%]", search_from)
    if not s then return nil end

    if col >= s and col <= e then
      inner = inner:gsub("^%s+", ""):gsub("%s+$", "") -- trim
      local target = inner:match("([^|]+)") or inner -- strip alias
      target = target:gsub("^%s+", ""):gsub("%s+$", "")
      if target == "" then return nil end
      return target
    end

    search_from = e + 1
  end
end

-- Resolve a wiki link to an existing file if possible
local function resolve_wikilink(target)
  -- 1. Exact match
  if vim.fn.filereadable(target) == 1 then
    return target
  end

  -- 2. Try adding .md
  if vim.fn.filereadable(target .. ".md") == 1 then
    return target .. ".md"
  end

  -- 3. Recursive search for target.md
  local matches = vim.fn.glob("**/" .. target .. ".md", true, true)
  if #matches == 1 then
    return matches[1]
  end

  -- 4. Fallback: let Neovim create a new file
  return target
end

function M.setup()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "md", "markdown.pandoc" },
    callback = function(ev)
      vim.keymap.set("n", "<CR>", function()
        local target = get_wikilink_under_cursor()
        if target then
          local resolved = resolve_wikilink(target)
          vim.cmd("tabnew " .. vim.fn.fnameescape(resolved))
        else
          vim.cmd("normal! <CR>")
        end
      end, {
        silent = true,
        buffer = ev.buf,
        desc = "Open [[wiki link]] in tab",
      })

      vim.api.nvim_set_hl(0, "ObsidianWikiLink", {
        fg = "#7aa2f7",
        underline = true,
      })

      vim.cmd([[
        syntax match ObsidianWikiLink /\[\[.\{-}\]\]/
      ]])
    end,
  })
end

return M

