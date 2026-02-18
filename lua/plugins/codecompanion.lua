return {
  {
    'olimorris/codecompanion.nvim',
    version = '^18.0.0',
    opts = {
      adapters = {
        ollama = {
          name = 'ollama',
          features = {
            text = true,
            tokens = true,
            vision = false,
          },
          url = 'http://localhost:11434/v1/chat/completions',
          raw_mode = false,
          headers = {
            ['Content-Type'] = 'application/json',
          },
          parameters = {
            sync = true,
          },
          schema = {
            model = {
              default = 'qwen2.5:14b',
            },
            num_ctx = {
              default = 8192,
            },
            temperature = {
              default = 0.7,
            },
          },
        },
      },
      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = {
          adapter = 'ollama',
        },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
