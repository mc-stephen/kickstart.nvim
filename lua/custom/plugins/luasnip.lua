-- Snippet engine (pairs with blink-cmp.lua)
vim.pack.add { { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
require('luasnip').setup {}

-- Prebuilt snippet collection (VS Code format) for many languages
vim.pack.add { { src = 'https://github.com/rafamadriz/friendly-snippets' } }
require('luasnip.loaders.from_vscode').lazy_load()
