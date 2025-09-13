return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      'f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      -- JavaScript/TypeScript with Biome fallback to Prettier
      javascript = function(bufnr)
        if vim.fs.find({ 'biome.json', 'biome.jsonc' }, { path = vim.api.nvim_buf_get_name(bufnr), upward = true })[1] then
          return { 'biome' }
        else
          return { 'prettier' }
        end
      end,
      typescript = function(bufnr)
        if vim.fs.find({ 'biome.json', 'biome.jsonc' }, { path = vim.api.nvim_buf_get_name(bufnr), upward = true })[1] then
          return { 'biome' }
        else
          return { 'prettier' }
        end
      end,
      javascriptreact = function(bufnr)
        if vim.fs.find({ 'biome.json', 'biome.jsonc' }, { path = vim.api.nvim_buf_get_name(bufnr), upward = true })[1] then
          return { 'biome' }
        else
          return { 'prettier' }
        end
      end,
      typescriptreact = function(bufnr)
        if vim.fs.find({ 'biome.json', 'biome.jsonc' }, { path = vim.api.nvim_buf_get_name(bufnr), upward = true })[1] then
          return { 'biome' }
        else
          return { 'prettier' }
        end
      end,
      json = function(bufnr)
        if vim.fs.find({ 'biome.json', 'biome.jsonc' }, { path = vim.api.nvim_buf_get_name(bufnr), upward = true })[1] then
          return { 'biome' }
        else
          return { 'prettier' }
        end
      end,
      jsonc = function(bufnr)
        if vim.fs.find({ 'biome.json', 'biome.jsonc' }, { path = vim.api.nvim_buf_get_name(bufnr), upward = true })[1] then
          return { 'biome' }
        else
          return { 'prettier' }
        end
      end,
      -- These typically stay with Prettier since Biome doesn't handle them as well
      html = { 'prettier' },
      css = { 'prettier' },
      scss = { 'prettier' },
      less = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      -- Keep existing formatters
      lua = { 'stylua' },
    },
    formatters = {
      biome = {
        condition = function(ctx)
          return vim.fs.find({ 'biome.json', 'biome.jsonc' }, { path = ctx.filename, upward = true })[1]
        end,
      },
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
