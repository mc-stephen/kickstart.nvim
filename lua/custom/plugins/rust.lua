vim.pack.add { 'https://github.com/mrcjkb/rustaceanvim' }

-- Note: rustaceanvim doesn't use a standard .setup() function.
-- It automatically hooks into your rust-analyzer behind the scenes.
vim.g.rustaceanvim = {
  server = {
    on_attach = function(client, bufnr)
      -- You can put Rust-specific keymaps here if you want later!
    end,
  },
}
