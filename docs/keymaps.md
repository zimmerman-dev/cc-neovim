## 🗝️ CC-Neovim Keymap Cheat Sheet

This file lists all custom keybindings configured in CC-Neovim.
Keybindings are grouped by category for easy reference.

---

### 🎯 General

| Keybinding        | Mode   | Action                        |
|-------------------|--------|-------------------------------|
| `<Esc>`           | Normal | Clear search highlight        |
| `<leader>fs`      | Normal | Save current file             |
| `<leader>qq`      | Normal | Quit Neovim                   |
| `<leader>QQ`      | Normal | Force quit without saving     |
| `<leader>dd`      | Normal | Open dashboard                |
| `<leader>fn`      | Normal | Create a new empty file       |
| `<leader>sr`      | Normal | Search and replace in file    |

---

### 🪟 Window Management

| Keybinding   | Mode   | Action                              |
|--------------|--------|-------------------------------------|
| `<C-Left>`   | Normal | Decrease vertical split width       |
| `<C-Right>`  | Normal | Increase vertical split width       |
| `<C-Up>`     | Normal | Decrease horizontal split height    |
| `<C-Down>`   | Normal | Increase horizontal split height    |

---

### 🗂 Tabs

| Keybinding        | Mode   | Action                              |
|-------------------|--------|-------------------------------------|
| `<leader>tn`      | Normal | Open a new tab                     |
| `<leader>tc`      | Normal | Close current tab                  |
| `<leader>to`      | Normal | Close all other tabs               |
| `<Tab>`           | Normal | Go to next tab                     |
| `<S-Tab>`         | Normal | Go to previous tab                 |

---

### 💻 Terminals

| Keybinding        | Mode   | Action                              |
|-------------------|--------|-------------------------------------|
| `<leader>tt`      | Normal | Open terminal in horizontal split   |
| `<leader>tv`      | Normal | Open terminal in vertical split     |

---

### 📄 Buffers

| Keybinding        | Mode   | Action                              |
|-------------------|--------|-------------------------------------|
| `<leader>bn`      | Normal | Switch to next buffer              |
| `<leader>bp`      | Normal | Switch to previous buffer          |
| `<leader>bd`      | Normal | Delete current buffer              |

---

### 🔍 Telescope

| Keybinding        | Mode   | Action                              |
|-------------------|--------|-------------------------------------|
| `<leader>fd`      | Normal | Find files in the current file’s directory |
| `<leader>ff`      | Normal | Find files in project              |
| `<leader>fg`      | Normal | Live grep (search text in project) |
| `<leader>fb`      | Normal | Search open buffers                |
| `<leader>fh`      | Normal | Search Neovim help tags            |

---

### ⚙️ LSP (Language Server Protocol)

| Keybinding        | Mode   | Action                              |
|-------------------|--------|-------------------------------------|
| `gd`              | Normal | Go to definition                   |
| `K`               | Normal | Show hover documentation           |
| `gr`              | Normal | Find references                    |
| `[d`              | Normal | Go to previous diagnostic          |
| `]d`              | Normal | Go to next diagnostic              |
| `<leader>rn`      | Normal | Rename symbol                      |
| `<leader>ca`      | Normal | Show code actions                  |
| `<leader>e`       | Normal | Show diagnostics in a floating window |

---

### 🖋️ Insert Mode Enhancements

| Keybinding     | Mode   | Action                                   |
|----------------|--------|------------------------------------------|
| `<C-]>`        | Insert | Jump out of surrounding closures         |
| `<C-j>`        | Insert | Exit snippet without leaving insert mode |

---

