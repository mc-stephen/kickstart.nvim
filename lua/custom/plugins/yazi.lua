vim.pack.add {
  'https://github.com/mikavilpas/yazi.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
}

require('yazi').setup({
  open_for_directories = false, -- Prevent it from overriding default netrw folders
})

-- Map it to Space + e (Explore)
vim.keymap.set('n', '<leader>y', function()
  require('yazi').yazi()
end, { desc = 'Open Yazi File Manager' })
