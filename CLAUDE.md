# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Vim/Neovim configuration managed with [Vundle](https://github.com/gmarik/Vundle.vim). The main entry point is `vimrc`; `nvimrc` holds Neovim-only additions (Haskell/intero setup, neomake).

## Plugin Management

Vundle is the only submodule (`bundle/Vundle.vim`). All other plugins in `bundle/` are installed by Vundle and are not tracked in git.

```
# Install all plugins listed in vimrc
vim +PluginInstall +qall

# Update all plugins
vim +PluginUpdate +qall

# Remove plugins no longer in vimrc
vim +PluginClean +qall
```

After adding or removing a `Plugin` line in `vimrc`, run `:PluginInstall` or `:PluginClean` inside Vim.

## Repository Structure

- `vimrc` - main config: plugin declarations + all settings and mappings
- `nvimrc` - Neovim-only additions (sourced separately, not via `$MYVIMRC`)
- `bundle/` - Vundle-managed plugins; only `Vundle.vim` is a git submodule
- `ktor-snippets/` - custom UltiSnips-style snippets (`snippets/` dir + `syntax.vim`)
- `colors/` - custom color schemes not available via Vundle
- `ftdetect/` - filetype detection overrides
- `undodir/` - persistent undo history (not committed, gitignored)
- `sessions/` - vim-session saved sessions

## Key Architectural Points

**Leader key** is `<Space>` (set at the top of `vimrc`). The README is outdated - it says `,` but the actual value is `<Space>`.

**Plugin declaration order in vimrc** determines load order. Settings for each plugin are placed immediately after its `Plugin` line, not in a separate section.

**Neovim vs Vim split**: `vimrc` is shared; `nvimrc` adds Haskell tooling (intero-neovim, neomake) and the terminal escape mapping. Neovim must source `nvimrc` separately from its `init.vim`.

**LanguageClient-neovim** (`autozimu/LanguageClient-neovim`) is configured for Haskell via `hie-wrapper`. LSP mappings use `<leader>l*` prefix.

**Persistent undo** is written to `~/.vim/undodir` (not the repo's `undodir/`). The repo's `undodir/` stores session-specific undo for the vimfiles themselves.

**fzf** replaces the commented-out ctrlp. `<C-p>` opens `:Files` with preview. The `fzf` binary must be installed separately; `bundle/fzf` is the Vim plugin wrapper only.

## Common Mappings Reference

| Mapping | Action |
|---------|--------|
| `<C-p>` | Fuzzy file finder (fzf) |
| `<leader>n` | Toggle NERDTree |
| `<leader>f` | Reveal current file in NERDTree |
| `<leader>t` | Toggle Tagbar |
| `<leader>a` | Autoformat buffer |
| `<leader>/` | Ripgrep search |
| `<leader>*` | Ripgrep word under cursor |
| `<leader>bx` / `bj` / `bh` | Beautify XML / JSON / HTML |
| `<leader>cs` / `cl` | Copy relative / absolute file path |
| `<leader>lk/g/r/f` | LSP hover / go-to-def / rename / format |
| `<F5>` | LSP context menu |
| `gc` (visual) | Toggle comment (tcomment) |
| `<C-H/J/K/L>` | Navigate splits |
