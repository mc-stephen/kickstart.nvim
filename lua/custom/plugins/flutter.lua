vim.pack.add {
  'https://github.com/akinsho/flutter-tools.nvim',
  'https://github.com/nvim-lua/plenary.nvim', -- Required dependency
}

require('flutter-tools').setup {
  ui = { border = 'rounded' },
  decorations = {
    statusline = { device = true, app_version = true },
  },
  lsp = {
    color_render = true, -- Shows color previews for widgets like Color.fromARGB
  },
  widget_guides = {
    enabled = true, -- Draws subtle lines showing widget tree nesting depths
  },
  closing_tags = {
    highlight = 'Comment',
    prefix = ' // ',
    enabled = true, -- Automatically places virtual text labels on ending brackets (like VS Code!)
  },
  debugger = {
    enabled = true,
    run_via_dap = true, -- Plugs natively into your new DAP visual engine
  },
}

-- ====================================================================
-- KEYMAPS: Your Flight Deck for Flutter (Capital F)
-- ====================================================================

-- 1. Boot up and target controls
vim.keymap.set('n', '<leader>Fr', ':FlutterRun<CR>', { desc = 'Flutter: Run Project' })
vim.keymap.set('n', '<leader>Fq', ':FlutterQuit<CR>', { desc = 'Flutter: Terminate App' })
vim.keymap.set('n', '<leader>Fd', ':FlutterDevices<CR>', { desc = 'Flutter: Select Device/Emulator' })

-- 2. Visual Log Stream (Your VS Code Debug Console)
vim.keymap.set('n', '<leader>Fl', ':FlutterLogToggle<CR>', { desc = 'Flutter: Toggle Debug Log Console' })

-- 3. Manual Hot Controls (Though it auto-reloads on file save!)
vim.keymap.set('n', '<leader>Fh', ':FlutterReload<CR>', { desc = 'Flutter: Hot Reload App' })
vim.keymap.set('n', '<leader>FH', ':FlutterRestart<CR>', { desc = 'Flutter: Hot Restart App' })
