-- Add the plugin to your package manager
vim.pack.add {
  'https://github.com/rcarriga/nvim-notify',
}

local notify = require('notify')

-- Configure the visuals and behavior
notify.setup({
  timeout = 3000,           -- How long the toast stays on screen (3 seconds)
  stages = "fade",          -- Animation style: "fade", "slide", or "fade_in_slide_out"
  render = "default",       -- Visual layout style
  background_colour = "#000000", -- Helps fix transparency bleeding on some terminals
})

-- ====================================================================
-- THE MAGIC LINE
-- ====================================================================
-- This overwrites Neovim's default print/notify engine with our new floating one
vim.notify = notify
