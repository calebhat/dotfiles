-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<leader>cd", function()
  local root = vim.fs.root(0, { ".git", "mix.exs", "package.json" })
  if root then
    vim.cmd.cd(root)
  end
end, { desc = "CD to Project Root" })

-- Grep (search) work under cursor in entire project
vim.keymap.set("n", "<leader>*", function()
  require("telescope.builtin").grep_string({ search = vim.fn.expand("<cword>") })
end, { desc = "Grep Word Under Cursor" })

-- smart grep find
vim.keymap.set("n", "gf", function()
  local path = vim.fn.expand("<cfile>")
  if vim.fn.filereadable(path) == 1 then
    vim.cmd.edit(path)
  else
    -- Try Elixir module → file
    local mod = path:gsub("%.", "/") .. ".ex"
    local candidates = vim.fn.glob("**/" .. mod, true, true)
    if #candidates > 0 then
      vim.cmd.edit(candidates[1])
    end
  end
end, { desc = "Smart gf" })
