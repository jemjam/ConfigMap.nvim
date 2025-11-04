-- Example opts table you can pass to your plugin manager (preferred)
-- Use the `opts = { ... }` form when loading the plugin; keymaps are
-- provided as tables: {lhs, rhs, desc?, mode?}

return {
  defaults = { keymaps = { silent = true, noremap = true } },
  keymaps = {
    { '<leader>t', ':Telescope treesitter<CR>', desc = 'Treesitter' },
  },
  commands = {
    { name = 'Greet', handler = function() print('Hello from Greet') end, opts = { desc = 'Greet' } },
  },
  autocmds = {
    { events = {'BufEnter','BufWinEnter'}, pattern = '*.md', callback = function() print('Markdown opened') end },
  },
  funcs = {
    { name = 'DoNothing', fn = function() end },
  },
}
