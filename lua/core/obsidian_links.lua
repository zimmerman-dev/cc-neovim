-- lua/core/obsidian_links.lua

-- Open Obsidian-style [[links]] with <CR>
vim.keymap.set("n", "<CR>", function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1

  local start, finish = 0, 0
  while true do
    start, finish = string.find(line, "%[%[(.-)%]%]", finish + 1)
    if not start then
      return
    end
    if col >= start and col <= finish then
      local target = line:sub(start + 2, finish - 2)
      vim.cmd("edit " .. vim.fn.fnameescape(target))
      return
    end
  end
end, { silent = true })

-- Highlight [[Wiki Links]]
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "md", "markdown.pandoc" },
  callback = function()
    -- define highlight group (customize colors if you want)
    vim.api.nvim_set_hl(0, "ObsidianWikiLink", { fg = "#7aa2f7", underline = true })

    -- very basic syntax match for [[links]]
    vim.cmd [[
      syntax match ObsidianWikiLink /\[\[.\{-}\]\]/
    ]]
  end,
})

