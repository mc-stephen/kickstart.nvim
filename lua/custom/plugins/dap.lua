vim.pack.add {
  'https://github.com/mfussenegger/nvim-dap', -- The core debug engine
  'https://github.com/rcarriga/nvim-dap-ui', -- The visual dashboard UI
  'https://github.com/nvim-neotest/nvim-nio', -- Required dependency for the UI
}

-- ====================================================================
--
-- ====================================================================
local dap = require 'dap'
local dapui = require 'dapui'

-- 1. Clear out background auto-loaded configurations to prevent duplication
require('dap').configurations.dart = {}

-- Setup the visual panels
dapui.setup()

-- Automatically open the debug dashboard when debugging starts
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

-- ====================================================================
-- KEYMAPS: Your Debug Control Center
-- ====================================================================
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start / Continue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into function' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug: Step Over line' })
vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Debug: Stop Debugging' })
vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug: Toggle UI Panels' })

-- ====================================================================
-- VS Code Launch Configuration Integration
-- ====================================================================
local vscode = require 'dap.ext.vscode'

-- This maps the VS Code "dart" type directly to Neovim's dart/flutter filetype
vscode.type_to_filetypes = {
  dart = { 'dart' },
}

-- ====================================================================
-- REGISTER THE DART DEBUG ADAPTER 🎯
-- ====================================================================
-- This tells nvim-dap exactly how to launch the backend Dart debug engine
-- dap.adapters.dart = {
--   type = 'executable',
--   command = 'flutter',          -- Uses your global flutter binary
--   args = { 'debug-adapter' },   -- Tells flutter to start up in debugging mode
-- }
