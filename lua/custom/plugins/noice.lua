-- Register and download the repositories natively
vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/folke/noice.nvim',
}

-- Activate and style the floating command bar UI
require('noice').setup {
  lsp = {
    -- Override markdown rendering so documentation looks flawless
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      ['cmp.entry.get_documentation'] = true,
    },
  },
  cmdline = {
    enabled = true,
    view = 'cmdline_popup', -- Centers the classic ":" command bar
  },
  popupmenu = {
    enabled = true, -- Visually styles dropdown auto-complete choices
  },
  presets = {
    bottom_search = false, -- Keeps standard look-ups tidy
    command_palette = true, -- Balances all layouts uniformly
    long_message_to_split = true, -- Stops errors from blowing up the screen layout
  },
}
