vim.pack.add {
  'https://github.com/akinsho/flutter-tools.nvim',
  -- Requires plenary (a common helper library) which Kickstart usually has,
  -- but we list it here just to be absolutely safe
  'https://github.com/nvim-lua/plenary.nvim',
}

require('flutter-tools').setup({
  ui = { border = "rounded" },
  decorations = {
    statusline = { device = true, app_version = true }
  },
  lsp = {
    color_render = true, -- Shows color previews for widgets like Color.fromARGB
  }
})
