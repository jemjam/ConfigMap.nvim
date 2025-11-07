# Test Plan for settable.nvim

## Overview

This document outlines a comprehensive testing strategy for the settable.nvim plugin. The plugin provides a declarative way to configure Neovim keymaps, commands, and autocmds through Lua tables.

## Current Test Structure

The project currently uses plenary.nvim's busted-style testing framework with the following structure:

```
tests/
├── utils_spec.lua       # Tests for utility functions
├── keymaps_spec.lua     # Tests for keymaps module (newly added)
└── (planned) commands_spec.lua
└── (planned) autocmds_spec.lua
└── (planned) init_spec.lua
```

## Running Tests

Tests can be run in two ways:

1. **Headless mode** (recommended for CI/scripting):
   ```bash
   nvim --headless -c "PlenaryBustedFile tests/utils_spec.lua" -c "qa"
   nvim --headless -c "PlenaryBustedDirectory tests/" -c "qa"
   ```

2. **Interactive mode** (within Neovim):
   ```vim
   :PlenaryBustedFile %
   :PlenaryBustedDirectory tests/
   ```

## Planned Test Modules

### 1. Commands Module Tests (`tests/commands_spec.lua`)

Test cases to implement:
- Basic command creation with string handler
- Command creation with function handler
- Command with options (description, nargs, etc.)
- Command name normalization (removing leading `:`)
- Duplicate command detection and error handling
- Error handling for invalid command entries
- Error handling for missing command name or handler

### 2. Autocmds Module Tests (`tests/autocmds_spec.lua`)

Test cases to implement:
- Basic autocmd creation with callback function
- Autocmd creation with command string
- Multiple event handling
- Pattern matching
- Group assignment and creation
- Buffer-specific autocmds
- Once and nested options
- Error handling for missing events
- Error handling for missing callback/command
- Error handling for invalid entries

### 3. Init Module Tests (`tests/init_spec.lua`)

Test cases to implement:
- Basic setup with empty configuration
- Setup with keymaps, commands, and autocmds
- Setup with function-based configuration
- Integration testing of all modules working together

## Mise Task Configuration

Add the following to your `mise.toml` or `.mise.toml` file:

```toml
[tasks.test]
description = "Run all tests"
run = "nvim --headless -c 'PlenaryBustedDirectory tests/' -c 'qa'"

[tasks.test-keymaps]
description = "Run keymaps tests"
run = "nvim --headless -c 'PlenaryBustedFile tests/keymaps_spec.lua' -c 'qa'"

[tasks.test-utils]
description = "Run utils tests"
run = "nvim --headless -c 'PlenaryBustedFile tests/utils_spec.lua' -c 'qa'"
```

## Test Patterns and Best Practices

### Mocking and Stubbing

Use luassert's stub functionality for mocking Neovim API calls:

```lua
local stub = require('luassert.stub')

-- Stub a function
stub(vim.api, "nvim_create_user_command")

-- Make assertions
assert.stub(vim.api.nvim_create_user_command).was_called_with(...)

-- Revert stub
vim.api.nvim_create_user_command:revert()
```

### Error Testing

Use `assert.has_error` to test error conditions:

```lua
assert.has_error(function()
    commands.apply_commands(invalid_commands)
end, "expected error message")
```

### Test Organization

Follow this pattern for organizing tests:

```lua
describe("module_name", function()
    describe("function_name", function()
        it("should handle normal case", function()
            -- test implementation
        end)
        
        it("should handle edge case", function()
            -- test implementation
        end)
        
        it("should error on invalid input", function()
            -- test implementation
        end)
    end)
end)
```

## Test Coverage Goals

1. **Utils Module**: 100% coverage (currently achieved)
2. **Keymaps Module**: 100% coverage (newly added)
3. **Commands Module**: 100% coverage (planned)
4. **Autocmds Module**: 100% coverage (planned)
5. **Init Module**: 100% coverage (planned)

## Integration Testing

Create integration tests that verify:
- All modules work together correctly
- Configuration is applied as expected
- Error handling works across module boundaries
- Performance is acceptable for large configurations

## Continuous Integration

Recommended CI setup:
- Run all tests on every push/PR
- Report test coverage
- Fail on test errors
- Optionally run on multiple Neovim versions

## Future Enhancements

Consider adding:
- Performance benchmarks
- Test coverage reporting
- Property-based testing for complex configurations
- Fuzz testing for configuration parsing