-- Unfocused window dimming ('inset card' effect so splits never read as one window)
-- Focused window keeps the theme's Normal background; unfocused ones get a darker bg
-- (applied again on every colorscheme change so <leader>uc switches stay consistent)

-- Separator glyphs: double-line 'blueprint' style (║ ═ ╬ ╠ ╣ ╦ ╩)
vim.opt.fillchars:append {
  vert = '║', horiz = '═', horizup = '╩', horizdown = '╦',
  vertleft = '╣', vertright = '╠', verthoriz = '╬',
}

-- Preview popups (hover ⌥Space/K, signature help, diagnostic float) get rounded frames
vim.o.winborder = 'rounded'

local function apply_window_frame()
  -- Border tint + popup frame styling, theme-proof (re-applied on every colorscheme change)
  vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#565f89' })
  vim.api.nvim_set_hl(0, 'FloatTitle', { fg = '#565f89', bold = true })
  -- fg is pulled from the loaded theme's Normal so text color never drifts
  local normal = vim.api.nvim_get_hl(0, { name = 'Normal', link = false })
  if normal and normal.fg then
    vim.api.nvim_set_hl(0, 'NormalNC', { fg = normal.fg, bg = '#16181d' })
  end
end

vim.api.nvim_create_augroup('window-separators', { clear = true })
vim.api.nvim_create_autocmd('ColorScheme', {
  group = 'window-separators',
  callback = apply_window_frame,
})
apply_window_frame()
