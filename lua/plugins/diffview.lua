return {
  'sindrets/diffview.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  cmd = {
    'DiffviewOpen',
    'DiffviewClose',
    'DiffviewToggleFiles',
    'DiffviewFocusFiles',
    'DiffviewFileHistory',
  },
  keys = {
    { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Open Diffview' },
    { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Close Diffview' },
    { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History' },
    { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Branch History' },
  },
  config = function()
    require('diffview').setup {}
  end,
}
