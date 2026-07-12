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
      dap.adapters.dart = {
        type = 'executable',
        command = paths.flutter_bin,
        args = { 'debug-adapter' },
      }

      dap.configurations.dart = {}

      -- Load VS Code configs if they exist
      if vim.fn.filereadable('.vscode/launch.json') == 1 then
        local vscode_configs = require('dap.ext.vscode').getconfigs()
        for _, c in ipairs(vscode_configs) do
          if c.type == 'dart' then table.insert(dap.configurations.dart, c) end
        end
      end

      -- Baseline fallback config
      if #dap.configurations.dart == 0 then
        table.insert(dap.configurations.dart, {
          type = 'dart',
          request = 'launch',
          name = 'Flutter (Default)',
          program = 'lib/main.dart',
          cwd = '${workspaceFolder}',
        })
      end
    end,
  },
}

-- ====================================================================
-- THE INTERCEPTOR (Strict No-Stress Execution)
-- ====================================================================
local dap = require('dap')

-- 1. Create a wrapper for dap.run
local original_dap_run = dap.run

-- 2. Define the injection logic
dap.run = function(config)
  if _G.flutter_ignore_exceptions then
    config.noDebug = false -- Must be false for logs to flow
    -- This tells the Dart DAP to not break on any exceptions
    config.exceptionFailureMode = "none"
  end
  original_dap_run(config)
end

-- 3. The launch function
_G.flutter_ignore_exceptions = false

local function run_flutter(is_debug)
  _G.flutter_ignore_exceptions = not is_debug
  vim.cmd('FlutterDebug')
end

-- ====================================================================
-- KEYMAPS: Flight Deck
-- ====================================================================
vim.keymap.set('n', '<leader>FD', function() run_flutter(true) end, { desc = 'Flutter: Run Project (Debug)' })
vim.keymap.set('n', '<leader>FR', function() run_flutter(false) end, { desc = 'Flutter: Run Project (No Debug)' })

vim.keymap.set('n', '<leader>Fq', ':FlutterQuit<CR>', { desc = 'Flutter: Terminate App' })
vim.keymap.set('n', '<leader>Fd', ':FlutterDevices<CR>', { desc = 'Flutter: Select Device/Emulator' })
vim.keymap.set('n', '<leader>Fl', ':FlutterLogToggle<CR>', { desc = 'Flutter: Toggle Debug Log Console' })
vim.keymap.set('n', '<leader>Fh', ':FlutterReload<CR>', { desc = 'Flutter: Hot Reload App' })
vim.keymap.set('n', '<leader>FH', ':FlutterRestart<CR>', { desc = 'Flutter: Hot Restart App' })
