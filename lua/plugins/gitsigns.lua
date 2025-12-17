return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    -- Automatic refresh neo-tree on git status change
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      vim.api.nvim_create_autocmd('User', {
        pattern = 'GitSignsUpdate',
        callback = function()
          pcall(function()
            require('neo-tree.sources.manager').refresh 'filesystem'
          end)
        end,
      })
    end,
  },
}
