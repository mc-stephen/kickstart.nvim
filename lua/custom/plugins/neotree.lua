vim.pack.add {
  'https://github.com/nvim-neo-tree/neo-tree.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons', -- Gives you file type icons
}

require('neo-tree').setup({
  close_if_last_window = true,
  filesystem = {
    follow_current_file = { enabled = true }, -- Auto-expand tree to your open file
    use_libuv_file_watcher = true,           -- Instantly refresh if files change
  },
  diagnostics = {
    symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
  }
})

-- Map it to Space + n + t (Neo-Tree Toggle)
vim.keymap.set('n', '<leader>nt', ':Neotree toggle left<CR>', { desc = 'Toggle Neo-tree Sidebar' })
