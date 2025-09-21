return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        mode = 'buffers', -- set to "tabs" to only show tabpages instead
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        -- Custom diagnostics indicator
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ' '
          for e, n in pairs(diagnostics_dict) do
            local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
            s = s .. n .. sym
          end
          return s
        end,
        -- Show buffer close icons
        show_close_icon = true,
        show_buffer_close_icons = true,
        -- Separator style
        separator_style = 'slant', -- "slant" | "thick" | "thin" | { 'any', 'any' },
        -- Always show bufferline
        always_show_bufferline = true,
        -- Sort buffers
        sort_by = 'insert_after_current',
      },
    }
  end,
}
