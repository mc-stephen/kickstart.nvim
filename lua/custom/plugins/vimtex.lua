vim.pack.add { 'https://github.com/lervag/vimtex' }

-- Tree-sitter handles tex highlighting (auto-attached by init.lua §9);
-- disable vimtex's regex syntax to avoid double-highlighting
vim.g.vimtex_syntax_enabled = 0

-- LaTeX LSP: completion, diagnostics, references
-- (binary auto-installed via mason-tool-installer, see init.lua §6)
vim.lsp.config('texlab', {})
vim.lsp.enable('texlab')
