-- 1. Ensure the underlying configurations plugin is loaded natively
vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

-- 2. Configure the Astro server settings using the modern 0.12+ native API
-- (Replaces the deprecated require('lspconfig').astro.setup({}))
vim.lsp.config('astro', {
  -- If you are using an autocompletion plugin like nvim-cmp, you can inject capabilities here:
  -- capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- 3. Turn the server on so it automatically boots up when opening .astro files
vim.lsp.enable('astro')
