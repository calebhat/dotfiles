return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tailwindcss = {
        -- Extend filetypes to include HEEx and Elixir templates
        filetypes = {
          "elixir",
          "eelixir",
          "heex",
          "surface",
        },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              elixir = "html-eex",
              eelixir = "html-eex",
              heex = "html-eex",
              surface = "html-eex",
            },
            experimental = {
              classRegex = {
                -- Support Phoenix class bindings: class={...} or class="..."
                { "class[:=]%{?%{?%s*[\"']([^\"']*)", '"([^"]*)"' },
                { "class[:=]%{?%{?%s*[\"']([^\"']*)", "'([^']*)'" },
              },
            },
          },
        },
      },
    },
  },
}
