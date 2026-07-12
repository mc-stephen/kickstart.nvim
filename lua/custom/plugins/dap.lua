vim.pack.add {
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/rcarriga/nvim-dap-ui',
  'https://github.com/nvim-neotest/nvim-nio',
}

local dap = require 'dap'
local dapui = require 'dapui'

-- Enable logging for debugging
dap.set_log_level('DEBUG')

-- Setup the visual panels
dapui.setup()

-- Automatically open/close the debug dashboard
dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end

-- ====================================================================
-- KEYMAPS
-- ====================================================================
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start / Continue' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step Into function' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Debug: Step Over line' })
vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Debug: Stop Debugging' })
vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Debug: Toggle UI Panels' })

-- ====================================================================
-- ADAPTER DEFINITION
-- ====================================================================
dap.adapters.dart = {
  type = 'executable',
  command = 'flutter',
  args = { 'debug-adapter' },
}
