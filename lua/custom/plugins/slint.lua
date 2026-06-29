-- Pull down official Slint filetype recognition rules
vim.pack.add { 'https://github.com/slint-ui/vim-slint' }

-- Tell the language engine to attach to Slint UI files
require('lspconfig').slint_lsp.setup({})
