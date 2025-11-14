return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    keys = {
      -- Buffer switching (fuzzy, filename-only)
      { "<leader>fb", "<cmd>Telescope buffers path_display={'tail'} sort_mru=true<cr>", desc = "Find Buffers" },

      -- Live grep: search string in all files
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep String" },

      -- Bonus: find files by name
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.6 },
        path_display = { "smart" },
      },
      pickers = {
        buffers = {
          path_display = { "tail" },
          sort_mru = true,
          ignore_current_buffer = true,
        },
        live_grep = {
          additional_args = { "--hidden", "--glob=!.git/" }, -- Search dotfiles, skip git
        },
      },
    },
  },
}
