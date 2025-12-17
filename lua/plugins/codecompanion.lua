return {
  {
    'olimorris/codecompanion.nvim',
    version = '^18.0.0',
    opts = {
      adapters = {
        gemini = {
          type = 'gemini',
          env = {
            api_key = 'GEMINI_API_KEY',
          },
          model = 'models/gemini-1.5-pro',
        },
      },
      strategies = {
        chat = {
          adapter = 'gemini',
        },
        inline = {
          adapter = 'gemini',
        },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
