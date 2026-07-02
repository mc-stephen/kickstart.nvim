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
    register_configurations = function()
      -- 1. Ensure the path-aware Dart debug adapter is registered
      -- require('dap').adapters.dart = {
      --   type = 'executable',
      --   command = paths.flutter_bin,
      --   args = { 'debug-adapter' },
      -- }

      -- 2. Explicitly pull and filter configurations without using deprecated hooks
      if vim.fn.filereadable '.vscode/launch.json' == 1 then
        local launch_configs = require('dap.ext.vscode').getconfigs()
        local dart_configs = {}

        for _, config in ipairs(launch_configs) do
          if config.type == 'dart' then table.insert(dart_configs, config) end
        end

        require('dap').configurations.dart = dart_configs
      end
    end,

    -- register_configurations = function()
    --   -- 2. Automatically load and map your VS Code launch.json flavors
    --   require('dap.ext.vscode').load_launchjs(nil, { dart = { 'dart' } })
    -- end,
  },
}

-- ====================================================================
-- KEYMAPS: Your Flight Deck for Flutter (Capital F)
-- ====================================================================
vim.keymap.set('n', '<leader>Fr', ':FlutterRun<CR>', { desc = 'Flutter: Run Project' })
vim.keymap.set('n', '<leader>Fq', ':FlutterQuit<CR>', { desc = 'Flutter: Terminate App' })
vim.keymap.set('n', '<leader>Fd', ':FlutterDevices<CR>', { desc = 'Flutter: Select Device/Emulator' })
vim.keymap.set('n', '<leader>Fl', ':FlutterLogToggle<CR>', { desc = 'Flutter: Toggle Debug Log Console' })
vim.keymap.set('n', '<leader>Fh', ':FlutterReload<CR>', { desc = 'Flutter: Hot Reload App' })
vim.keymap.set('n', '<leader>FH', ':FlutterRestart<CR>', { desc = 'Flutter: Hot Restart App' })
