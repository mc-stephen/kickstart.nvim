vim.pack.add {
  'https://github.com/HiPhish/rainbow-delimiters.nvim',
  'https://github.com/lukas-reineke/indent-blankline.nvim',
}

-- Define the names of your rainbow color levels
local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}

local hooks = require 'ibl.hooks'

-- Automatically register/reset colors whenever your main theme updates
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
  vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
  vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
  vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
  vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
  vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
end)

-- Initialize the engine with your colors and preferred character style
require('ibl').setup {
  enabled = false, -- 👈 JUST ADD THIS LINE TO SHUT IT OFF!
  indent = {
    highlight = highlight,
    char = '│', -- The solid thin line (or use "▏", "┊", "¦")
  },
  scope = {
    enabled = true, -- Highlights the line matching your current cursor block active scope
  },
}
