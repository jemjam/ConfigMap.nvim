# Config-Settings.nvim

This is a very simple neovim plugin designed for loading your custom keymaps,
commands and autocommands as part of plugin configuration.

Instead of writing custom configuration with `vim.keymap.set()` calls, you can
define the keymaps as a table. This is similar to what `legendary.nvim` did
except it doesn't provide an interface to query your definitions. The purpose
here is just to simplify setting common config in one centralized space.
