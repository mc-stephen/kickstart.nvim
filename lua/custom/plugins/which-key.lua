vim.pack.add {
  'https://github.com/folke/which-key.nvim',
}

local wk = require 'which-key'

-- 1. Setup the visual modern behavior (LazyVim style)
wk.setup {
  preset = 'helix', -- Gives it that clean, compact floating look
  win = {
    border = 'rounded', -- Soft elegant corners for the popup window
  },
  delay = function(ctx)
    return ctx.plugin and 0 or 400 -- Pops up fast, but stays out of the way for rapid typing
  end,
}

-- 2. Name your custom categories so they look incredible in the popup
wk.add {

  -- DYNAMIC BUFFER EXPANDER: Automatically lists all open files in memory
  {
    '<leader>b',
    group = 'Buffers',
    expand = function() return require('which-key.extras').expand.buf() end,
  },

  -- DYNAMIC WINDOW EXPANDER & PROXY: Automatically routes to native Ctrl+W actions
  {
    '<leader>w',
    group = 'Windows',
    proxy = '<c-w>',
    expand = function() return require('which-key.extras').expand.win() end,
  },

  { '<leader>c', group = 'Code / LSP' },
  { '<leader>d', group = 'Debug / DAP' },
  { '<leader>F', group = 'Flutter / Dart 🚀' },
  { '<leader>g', group = 'Git / Lazygit' },
  { '<leader>s', group = 'Search / Find' },
  { '<leader>t', group = 'Terminal' },
  { '<leader>u', group = 'ui' },
  { '<leader>x', group = 'diagnostics/quickfix' },
  { '[', group = 'prev' },
  { ']', group = 'next' },
  { 'g', group = 'goto' },
  -- { "gs", group = "surround" },
  { 'z', group = 'fold' },
}
