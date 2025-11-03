-- Example Lazy.nvim spec showing recommended usage
return {
  'jemjam/neoconfig.nvim',
  opts = {
    defaults = { keymaps = { silent = true, noremap = true } },
    keymaps = {
      { lhs = '<leader>ff', rhs = ':Telescope find_files<CR>', mode = 'n', desc = 'Find files' },
      { lhs = '<leader>p', rhs = ':Telescope live_grep<CR>', mode = {'n','v'}, desc = 'Live grep' },
    },
    commands = {
      { name = 'SayHello', handler = function() print('hello from neoconfig') end, opts = { desc = 'Say hello' } },
    },
    autocmds = {
      { events = 'BufWritePre', pattern = '*', callback = function() vim.lsp.buf.format() end, opts = { once = false } },
    },
  },
  config = function(_, opts) require('neoconfig').setup(opts) end,
}
