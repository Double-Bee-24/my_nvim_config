return {
  'olimorris/codecompanion.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    strategies = {
      chat = {
        adapter = 'anthropic',
        model = 'glm-4.6',
      },
      inline = {
        adapter = 'anthropic',
        model = 'glm-4.6',
      },
    },
    opts = {
      log_level = 'DEBUG',
    },
    adapters = {
      http = {
        anthropic = function()
          return require('codecompanion.adapters').extend('anthropic', {
            env = {
              base_url = 'https://api.z.ai/api/anthropic',
              api_key = 'c8335f96ec4e4402ad493ac36c805ddf.WkIfjqqZL5x1boHi',
            },
          })
        end,
      },
    },
  },
}
