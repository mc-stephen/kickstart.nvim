vim.pack.add {
  'https://github.com/mfussenegger/nvim-dap',          -- The core debug engine
  'https://github.com/rcarriga/nvim-dap-ui',          -- The visual dashboard UI
  'https://github.com/nvim-neotest/nvim-nio',         -- Required dependency for the UI
}

local dap = require('dap')
local dapui = require('dapui')

-- Setup the visual panels
dapui.setup()

-- Automatically open the debug dashboard when debugging starts
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

-- ====================================================================
-- KEYMAPS: Your Debug Control Center
-- ====================================================================

-- 1. Breakpoints (Stopping points)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })

-- 2. Execution Controls (Stepping through code)
vim.keymap.set('n', '<leader>dc', dap.continue,          { desc = 'Debug: Start / Continue' })
vim.keymap.set('n', '<leader>di', dap.step_into,         { desc = 'Debug: Step Into function' })
vim.keymap.set('n', '<leader>do', dap.step_over,         { desc = 'Debug: Step Over line' })
vim.keymap.set('n', '<leader>dt', dap.terminate,         { desc = 'Debug: Stop Debugging' })

-- 3. Toggle UI manually if needed
vim.keymap.set('n', '<leader>du', dapui.toggle,          { desc = 'Debug: Toggle UI Panels' })

-- ====================================================================
--
-- ====================================================================
-- Modern, non-deprecated way to load VS Code launch configurations
local vscode = require('dap.ext.vscode')

-- This maps the VS Code "dart" type directly to Neovim's dart/flutter filetype
-- nvim-dap will now automatically load .vscode/launch.json using this mapping.
vscode.type_to_filetypes = {
  dart = { 'dart' }
}

