-- ~/.config/nvim/lua/plugins/oil.lua
return {
  "stevearc/oil.nvim",
  opts = {
    -- Open in floating window (optional)
    view_options = { show_hidden = true },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["-"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["g."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
  },
  keys = { { "-", "<cmd>Oil<cr>", desc = "Open parent directory" } },
}
