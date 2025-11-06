local utils = require("ConfigMap.utils")

describe("utils", function()
  describe("splitTableProperties", function()
    it("should partition numeric and string keys", function()
      local input = { "a", "b", key = "value" }
      local array, obj = utils.splitTableProperties(input)
      assert.are.same({ "a", "b" }, array)
      assert.are.same({ key = "value" }, obj)
    end)

    it("should handle empty table", function()
      local input = {}
      local array, obj = utils.splitTableProperties(input)
      assert.are.same({}, array)
      assert.are.same({}, obj)
    end)

    it("should handle only numeric keys", function()
      local input = { "x", "y" }
      local array, obj = utils.splitTableProperties(input)
      assert.are.same({ "x", "y" }, array)
      assert.are.same({}, obj)
    end)

    it("should handle only string keys", function()
      local input = { foo = "bar", baz = "qux" }
      local array, obj = utils.splitTableProperties(input)
      assert.are.same({}, array)
      assert.are.same({ foo = "bar", baz = "qux" }, obj)
    end)
  end)
end)