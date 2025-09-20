return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visible = true, -- show hidden files by default
            show_hidden_count = true,
            hide_dotfiles = false, -- don't hide dotfiles
            hide_gitignored = false, -- don't hide files ignored by git
          },
          follow_current_file = {
            enabled = true,
          },
        },
      }
    end,
    lazy = false, -- neo-tree will lazily load itself
  },
}
