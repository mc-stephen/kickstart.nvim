# AGENTS.md

Personal Neovim config — a fork of `kickstart.nvim` using Neovim's **built-in
`vim.pack` plugin manager** (NOT lazy.nvim/packer). Requires **Neovim ≥ 0.12**.

## Layout
- `init.lua` — monolithic entrypoint (10 sections). Configures everything, then `require 'custom.plugins'` at the end.
- `lua/custom/plugins/*.lua` — user plugins, auto-required by `lua/custom/plugins/init.lua` (iterates the dir, requires every `*.lua` except `init.lua`; `*.lua.old` files are ignored). No explicit load order — files resolve in directory order.
- `lua/kickstart/plugins/*.lua` — upstream example plugins; all commented out in `init.lua` §10 (NOT loaded).

## Plugin management (`vim.pack`)
- Pattern: `vim.pack.add { <url> }` immediately followed by `require('<plugin>').setup {}` in the same file.
- `init.lua` defines a local `gh('owner/repo')` helper — it is NOT available in `lua/custom/plugins/*`, which must use full `https://github.com/...` URLs.
- Version pinning: `vim.pack.add { { src = gh 'repo', version = vim.version.range '2.*' } }`.
- `nvim-pack-lock.json` is **git-tracked** and auto-repaired/rewritten by `vim.pack` on startup — do NOT hand-edit it.
- Inspect/update: `:lua vim.pack.update(nil, { offline = true })` / `:lua vim.pack.update()` (then `:write` applies, `:quit` cancels).

## LSP (native — no `require('lspconfig')`)
- Servers live in the `servers` table in `init.lua` §6, then `vim.lsp.config(name, cfg)` + `vim.lsp.enable(name)`. Nvim 0.12 lazily resolves cmd/filetypes/root from lspconfig's runtime `lsp/*.lua` — don't add `require('lspconfig')`.
- Mason auto-installs via `mason-tool-installer` (`ensure_installed = vim.tbl_keys(servers)`); lspconfig names map to Mason packages (`ts_ls`→`typescript-language-server`, `eslint`→`eslint-lsp`, `tailwindcss`→`tailwindcss-language-server`).
- `:LspInfo` does **not** exist here. Use `:checkhealth vim.lsp` or `:lua =vim.lsp.get_clients()`.
- LSP keymaps (`grd` def, `gra` code action, `grn` rename, `gri`/`grr`, `<leader>th` inlay hints) are buffer-local, registered on `LspAttach` — they only exist after a server attaches.

## Gotchas
- **Augroup collision**: LSP keymaps live under augroup `kickstart-lsp-attach`. Because `lua/custom/plugins/*` loads AFTER `init.lua`, re-declaring `vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true })` in a custom file silently wipes all LSP keymaps. Use a unique augroup name in custom plugins (this bug has bitten before).
- **One source of truth**: don't configure the same plugin in both `init.lua` and `lua/custom/plugins/` — the later `setup()` overrides the earlier one (gitsigns and which-key were consolidated into custom plugins for this reason).
- `dap.lua` / `flutter.lua` monkey-patch `dap.run` — fragile; edit with care.

## Commands
- Verify config loads clean: `nvim --headless -c 'qa'` (exit 0 = no startup errors) — the de-facto "typecheck".
- Formatting follows `.stylua.toml` (2-space, `column_width=160`, `call_parentheses="None"`, collapse simple statements — e.g. `require('x').setup {}`, `vim.pack.add { ... }`). CI runs `stylua --check .`; stylua may not be installed locally.
- Health: `:checkhealth kickstart.nvim`.

## Keymaps
- Leader is `<space>`. Which-key groups are declared in `lua/custom/plugins/which-key.lua`; most other keymaps are in `lua/custom/plugins/keymaps.lua` and per-plugin files.
