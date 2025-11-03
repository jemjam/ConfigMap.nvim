-- Direct require usage example
require('neoconfig').setup({
  defaults = { keymaps = { silent = true, noremap = true } },
  keymaps = {
    { lhs = '<leader>t', rhs = ':Telescope treesitter<CR>', mode = 'n', desc = 'Treesitter' },
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
})
