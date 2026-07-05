-- Pull down official Slint filetype recognition rules
vim.pack.add { 'https://github.com/slint-ui/vim-slint' }

-- Configure the Slint language server using the modern native API
vim.lsp.config('slint_lsp', {})

-- Enable the server to automatically attach to Slint UI files
vim.lsp.enable('slint_lsp')
