vim.pack.add {
  'https://github.com/folke/snacks.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons', 
}

require('snacks').setup({
  explorer = { enabled = true },
  picker = { enabled = true },
  lazygit = { enabled = true },
})

-- Open Snacks Explorer (Your sidebar)
vim.keymap.set('n', '<leader>e', function()
  require('snacks').explorer()
end, { desc = 'Open Snacks Explorer' })

-- 2. Open Lazygit in a gorgeous floating terminal frame
vim.keymap.set('n', '<leader>gg', function()
  require('snacks').lazygit.open()
end, { desc = 'Open Lazygit Overlay' })
