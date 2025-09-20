return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    opts = {
      flavour = 'macchiato',
      integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
        cmp = true,
        gitsigns = true,
        telescope = true,
        mason = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require('catppuccin').setup(opts)
      pcall(vim.cmd, 'colorscheme catppuccin')
      if vim.g.colors_name ~= 'catppuccin' then
        pcall(vim.cmd, 'colorscheme catppuccin_macchiato')
      end
    end,
  },
}
