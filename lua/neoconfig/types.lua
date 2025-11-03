--- EmmyLua type definitions for neoconfig.nvim
--- These are lightweight annotations to help editor completion.

---@class NCKeymap
---@field lhs string
---@field rhs string|fun()
---@field mode string|string[]|nil
---@field desc string|nil
---@field opts table|nil

---@class NCCommand
---@field name string
---@field handler string|fun()
---@field opts table|nil

---@class NCFunc
---@field name string
---@field fn fun()

---@class NCAutocmd
---@field events string|string[]
---@field pattern string|string[]|nil
---@field callback fun()|nil
---@field command string|nil
---@field group string|nil
---@field opts table|nil

---@class NeoConfig
---@field keymaps NCKeymap[]|fun():NCKeymap[]
---@field commands NCCommand[]|fun():NCCommand[]
---@field funcs NCFunc[]|fun():NCFunc[]
---@field autocmds NCAutocmd[]|fun():NCAutocmd[]
---@field defaults table|nil

return {}
