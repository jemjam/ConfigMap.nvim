local keymaps = require("settable.keymaps")
local stub = require("luassert.stub")

describe("keymaps", function()
	describe("apply_keymaps", function()
		it("should apply a basic keymap", function()
			local test_keymaps = {
				{ "a", "b", desc = "test keymap" },
			}

			-- Stub vim.keymap.set to capture calls
			stub(vim.keymap, "set")

			keymaps.apply_keymaps(test_keymaps)

			-- Verify vim.keymap.set was called with correct arguments
			-- Note: modes is passed as a table { "n" } since that's how the function works
			assert.stub(vim.keymap.set).was_called_with({ "n" }, "a", "b", { desc = "test keymap" })

			-- Revert stub
			vim.keymap.set:revert()
		end)

		it("should apply keymap with multiple modes", function()
			local test_keymaps = {
				{ "c", "d", mode = { "n", "v" }, desc = "multi-mode keymap" },
			}

			stub(vim.keymap, "set")

			keymaps.apply_keymaps(test_keymaps)

			assert.stub(vim.keymap.set).was_called_with({ "n", "v" }, "c", "d", { desc = "multi-mode keymap" })

			vim.keymap.set:revert()
		end)

		it("should handle buffer option correctly", function()
			local test_keymaps = {
				{ "e", "f", buffer = true, desc = "buffer keymap" },
			}

			stub(vim.keymap, "set")

			keymaps.apply_keymaps(test_keymaps)

			-- Buffer true should be converted to 0
			assert.stub(vim.keymap.set).was_called_with({ "n" }, "e", "f", { buffer = 0, desc = "buffer keymap" })

			vim.keymap.set:revert()
		end)

		it("should error on duplicate keymaps", function()
			local test_keymaps = {
				{ "g", "h", desc = "first keymap" },
				{ "g", "i", desc = "duplicate keymap" },
			}

			assert.has_error(function()
				keymaps.apply_keymaps(test_keymaps)
			end, "settable: duplicate keymap for mode+lhs: n::g")
		end)

		it("should error when keymap entry is not a table", function()
			local test_keymaps = {
				"not a table",
			}

			assert.has_error(function()
				keymaps.apply_keymaps(test_keymaps)
			end, "settable: keymap entry must be a table: {lhs, rhs, desc?, mode?}")
		end)

		it("should error when keymap missing lhs or rhs", function()
			local test_keymaps = {
				{ "lhs only" },
			}

			assert.has_error(function()
				keymaps.apply_keymaps(test_keymaps)
			end, "settable: keymap entry requires lhs and rhs as first two elements")
		end)
	end)
end)
