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
  },
  config = function(_, opts)
    require('gitsigns').setup(opts)

    local augroup = vim.api.nvim_create_augroup('NeoTreeGitRefresh', { clear = true })

    local function refresh_all()
      pcall(require('gitsigns').refresh)
      pcall(function()
        require('neo-tree.sources.manager').refresh 'filesystem'
      end)
    end

    vim.api.nvim_create_autocmd('BufWritePost', {
      group = augroup,
      callback = refresh_all,
    })

    -- Refresh when nvim regains focus (covers external file changes by other tools)
    vim.api.nvim_create_autocmd('FocusGained', {
      group = augroup,
      callback = function()
        vim.cmd 'checktime'
        vim.defer_fn(refresh_all, 200)
      end,
    })

    vim.api.nvim_create_autocmd('User', {
      group = augroup,
      pattern = 'GitSignsUpdate',
      callback = function()
        pcall(function()
          require('neo-tree.sources.manager').refresh 'filesystem'
        end)
      end,
    })
  end,
}
