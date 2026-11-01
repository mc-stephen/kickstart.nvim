vim.pack.add {
  -- 1. GitHub Themes (Includes Light, Dark, Dimmed, and Dark High Contrast)
  'https://github.com/projekt0n/github-nvim-theme',

  -- 2. Catppuccin (Super popular, ultra-smooth pastel theme)
  'https://github.com/catppuccin/nvim',

  -- 3. Rose Pine (Beautiful, cozy, minimal palette)
  'https://github.com/rose-pine/neovim',

  -- 4. Gruvbox (The legendary, warm retro-coding classic)
  'https://github.com/ellisonleao/gruvbox.nvim',

  -- 5. Kanagawa (Inspired by traditional Japanese art, very easy on the eyes)
  'https://github.com/rebelot/kanagawa.nvim',

  -- 6. Dark 2026 (VS Code's 2026 default dark theme — faithful port of the official theme JSON)
  'https://github.com/D0nw0r/dark2026.nvim',
}

-- Active colorscheme — one line here to flip themes (everything above stays installed):
-- current: tokyonight-night (previous default) · options: 'dark2026', 'catppuccin-mocha', 'github_dark_dimmed'
-- Preview any of them live with <leader>uc
vim.cmd.colorscheme 'tokyonight-night'

-- Making It Permanent
-- Whenever you find a variant that hits perfectly, go ahead and replace your old cmd('colorscheme tokyonight') line in your init.lua with the new name. For example:
-- If you choose the clean GitHub variant
-- vim.cmd('colorscheme github_dark_dimmed')

-- Or if you want to try out Catppuccin
-- vim.cmd('colorscheme catppuccin-mocha')
