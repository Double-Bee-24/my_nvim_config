return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      -- Add these lines for JavaScript/TypeScript support
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      json = { 'prettier' },
      jsonc = { 'prettier' },
      html = { 'prettier' },
      css = { 'prettier' },
      scss = { 'prettier' },
      less = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      -- Keep existing formatters
      lua = { 'stylua' },
      fish = { 'fish_indent' },
      sh = { 'shfmt' },
    },
    formatters = {
      prettier = {
        -- This ensures prettier respects your .prettierrc files
        condition = function(ctx)
          return vim.fs.find({
            '.prettierrc',
            '.prettierrc.json',
            '.prettierrc.js',
            '.prettierrc.yaml',
            '.prettierrc.yml',
            'prettier.config.js',
            'package.json',
          }, { path = ctx.filename, upward = true })[1]
        end,
      },
    },
  },
}
