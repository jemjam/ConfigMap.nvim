--- neoconfig.nvim — minimal placeholder module
--- Main module file with setup stub and TODOs for implementation

---@class NeoConfig
---@field keymaps table[]
---@field commands table[]
---@field funcs table[]
---@field autocmds table[]
---@field defaults table?

local M = {}

local function normalize_config(raw)
  if type(raw) == "function" then
    raw = raw()
  end
  raw = raw or {}
  raw.keymaps = raw.keymaps or {}
  raw.commands = raw.commands or {}
  raw.funcs = raw.funcs or {}
  raw.autocmds = raw.autocmds or {}
  raw.defaults = raw.defaults or {}
  return raw
end

-- TODO: implement these helpers in Phase 2
local function apply_keymaps(list, defaults)
  -- placeholder: iterate and call vim.keymap.set
  -- each item: { lhs, rhs, mode, desc, opts }
  return
end

local function apply_commands(list, defaults)
  -- placeholder: iterate and call vim.api.nvim_create_user_command
  -- each item: { name, handler, opts }
  return
end

local function apply_autocmds(list, defaults)
  -- placeholder: iterate and call vim.api.nvim_create_augroup / nvim_create_autocmd
  -- each item: { events, pattern, callback/command, group, opts }
  return
end

local function apply_funcs(list)
  -- placeholder: validate functions, no global exposure by default
  return
end

function M.setup(opts)
  local cfg = normalize_config(opts)

  -- Apply configured items (placeholders)
  apply_keymaps(cfg.keymaps, cfg.defaults.keymaps or {})
  apply_commands(cfg.commands, cfg.defaults.commands or {})
  apply_autocmds(cfg.autocmds, cfg.defaults.autocmds or {})
  apply_funcs(cfg.funcs)
end

return M
