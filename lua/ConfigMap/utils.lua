local M = {}

function M.resolve_list(list)
	if type(list) == "function" then
		return list() or {}
	end
	return list or {}
end

function M.merge_opts(defaults, opts)
	if not defaults and not opts then
		return {}
	end
	defaults = defaults or {}
	opts = opts or {}
	if vim.tbl_isempty(defaults) then
		return vim.deepcopy(opts)
	end
	return vim.tbl_deep_extend("force", defaults, opts)
end

return M