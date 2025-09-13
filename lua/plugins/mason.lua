return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'biome',
        'ts_ls', -- TypeScript/JavaScript LSP
      },
    }
  end,
}
