-- lua/core/obsidian_links.lua
-- Minimal Obsidian-style [[wiki links]] support:
-- - <CR> on a link opens target in a new real tab
-- - <CR> elsewhere behaves normally
-- - Supports aliases: [[file.md|alias]]

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
      -- inner is like "file.md" or "file.md|alias"
      inner = inner:gsub("^%s+", ""):gsub("%s+$", "") -- trim
      local target = inner:match("([^|]+)") or inner  -- strip alias portion
      target = target:gsub("^%s+", ""):gsub("%s+$", "")
      if target == "" then return nil end
      return target
    end

    search_from = e + 1
  end
end

function M.setup()
  -- Only set the mapping for markdown-like buffers.
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "md", "markdown.pandoc" },
    callback = function(ev)
      -- <CR> mapping local to markdown buffers
      vim.keymap.set("n", "<CR>", function()
        local target = get_wikilink_under_cursor()
        if target then
          -- Open in a new real tab
          vim.cmd("tabnew " .. vim.fn.fnameescape(target))
        else
          -- Default Enter behavior
          vim.cmd("normal! <CR>")
        end
      end, { silent = true, buffer = ev.buf, desc = "Open [[wiki link]] in tab" })

      -- Highlight group for wiki links
      -- You can tweak fg to match your theme; underline keeps it obvious.
      vim.api.nvim_set_hl(0, "ObsidianWikiLink", { fg = "#7aa2f7", underline = true })

      -- Basic syntax match for [[...]]
      vim.cmd([[
        syntax match ObsidianWikiLink /\[\[.\{-}\]\]/
      ]])
    end,
  })
end

return M

