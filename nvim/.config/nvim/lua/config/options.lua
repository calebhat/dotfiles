-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.number = true

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undo"

-- Auto-save/restore session
vim.api.nvim_create_autocmd("VimLeave", {
  callback = function()
    vim.cmd("mksession! ~/.cache/nvim/last-session.vim")
  end,
})
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.filereadable("~/.cache/nvim/last-session.vim") == 1 then
      vim.cmd.source("~/.cache/nvim/last-session.vim")
    end
  end,
})
