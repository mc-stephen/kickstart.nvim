vim.pack.add {
  'https://github.com/akinsho/flutter-tools.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
}

require('flutter-tools').setup {
  ui = { border = 'rounded' },
  decorations = {
    statusline = { device = true, app_version = true },
  },
  lsp = {
    color_render = true,
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    highlight = 'Comment',
    prefix = ' // ',
    enabled = true,
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
    register_configurations = function(paths)
      local dap = require 'dap'

      -- Define both modes
      local debug_config = {
        type = 'dart',
        request = 'launch',
        name = 'Flutter (Debug)',
        program = 'lib/main.dart',
        cwd = '${workspaceFolder}',
        noDebug = false,
      }

      local no_debug_config = {
        type = 'dart',
        request = 'launch',
        name = 'Flutter (No Debug)',
        program = 'lib/main.dart',
        cwd = '${workspaceFolder}',
        noDebug = true,
      }

      dap.configurations.dart = { debug_config, no_debug_config }
    end,
  },
}

-- ====================================================================
-- KEYMAPS
-- ====================================================================
vim.keymap.set('n', '<leader>Fr', ':FlutterRun<CR>', { desc = 'Flutter: Run Project' })
vim.keymap.set('n', '<leader>Fq', ':FlutterQuit<CR>', { desc = 'Flutter: Terminate App' })
vim.keymap.set('n', '<leader>Fd', ':FlutterDevices<CR>', { desc = 'Flutter: Select Device/Emulator' })
vim.keymap.set('n', '<leader>Fl', ':FlutterLogToggle<CR>', { desc = 'Flutter: Toggle Debug Log Console' })
vim.keymap.set('n', '<leader>Fh', ':FlutterReload<CR>', { desc = 'Flutter: Hot Reload App' })
vim.keymap.set('n', '<leader>FH', ':FlutterRestart<CR>', { desc = 'Flutter: Hot Restart App' })
