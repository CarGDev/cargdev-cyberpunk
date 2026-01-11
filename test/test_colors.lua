-- Test file for CargDev-Cyberpunk colorscheme
-- Run with: nvim --headless -c "lua dofile('test/test_colors.lua')"

local function test_colors()
  local ok, colors = pcall(require, "cargdev-cyberpunk.colors")
  if not ok then
    print("FAIL: Could not load colors module")
    print(colors)
    return false
  end

  local palette = colors.palette
  local tests_passed = 0
  local tests_failed = 0

  -- Test palette structure
  local required_categories = { "bg", "fg", "syntax", "special", "terminal" }
  for _, category in ipairs(required_categories) do
    if palette[category] then
      tests_passed = tests_passed + 1
      print(string.format("PASS: palette.%s exists", category))
    else
      tests_failed = tests_failed + 1
      print(string.format("FAIL: palette.%s is missing", category))
    end
  end

  -- Test color format (should be hex colors)
  local function is_valid_hex(color)
    return type(color) == "string" and color:match("^#%x%x%x%x%x%x$") ~= nil
  end

  for category, values in pairs(palette) do
    for key, value in pairs(values) do
      if is_valid_hex(value) then
        tests_passed = tests_passed + 1
      else
        tests_failed = tests_failed + 1
        print(string.format("FAIL: Invalid color format for %s.%s: %s", category, key, tostring(value)))
      end
    end
  end

  print(string.format("\nResults: %d passed, %d failed", tests_passed, tests_failed))
  return tests_failed == 0
end

local function test_config()
  local ok, config = pcall(require, "cargdev-cyberpunk.config")
  if not ok then
    print("FAIL: Could not load config module")
    print(config)
    return false
  end

  config.setup({})
  local cfg = config.get()

  local tests_passed = 0
  local tests_failed = 0

  -- Test default config values
  local expected_defaults = {
    transparent = false,
    italic_comments = true,
    bold_keywords = true,
    bold_functions = true,
    bold_types = true,
    terminal_colors = true,
  }

  for key, expected in pairs(expected_defaults) do
    if cfg[key] == expected then
      tests_passed = tests_passed + 1
      print(string.format("PASS: config.%s = %s", key, tostring(expected)))
    else
      tests_failed = tests_failed + 1
      print(string.format("FAIL: config.%s expected %s, got %s", key, tostring(expected), tostring(cfg[key])))
    end
  end

  print(string.format("\nResults: %d passed, %d failed", tests_passed, tests_failed))
  return tests_failed == 0
end

local function test_highlights()
  local ok, highlights = pcall(require, "cargdev-cyberpunk.highlights")
  if not ok then
    print("FAIL: Could not load highlights module")
    print(highlights)
    return false
  end

  local colors = require("cargdev-cyberpunk.colors")
  local config = require("cargdev-cyberpunk.config")
  config.setup({})

  local groups = highlights.get_groups(colors.palette, config.get())

  local tests_passed = 0
  local tests_failed = 0

  -- Test essential highlight groups exist
  local essential_groups = {
    "Normal", "NormalFloat", "Comment", "String", "Function",
    "Keyword", "Type", "DiagnosticError", "DiagnosticWarn",
    "TelescopeBorder", "NvimTreeNormal", "GitSignsAdd",
  }

  for _, group in ipairs(essential_groups) do
    if groups[group] then
      tests_passed = tests_passed + 1
      print(string.format("PASS: Highlight group '%s' exists", group))
    else
      tests_failed = tests_failed + 1
      print(string.format("FAIL: Highlight group '%s' is missing", group))
    end
  end

  print(string.format("\nResults: %d passed, %d failed", tests_passed, tests_failed))
  return tests_failed == 0
end

local function test_init()
  local ok, cyberpunk = pcall(require, "cargdev-cyberpunk")
  if not ok then
    print("FAIL: Could not load main module")
    print(cyberpunk)
    return false
  end

  local tests_passed = 0
  local tests_failed = 0

  -- Test module functions exist
  local expected_functions = { "setup", "load", "apply_highlights", "apply_terminal_colors", "get_colors" }

  for _, func_name in ipairs(expected_functions) do
    if type(cyberpunk[func_name]) == "function" then
      tests_passed = tests_passed + 1
      print(string.format("PASS: Function '%s' exists", func_name))
    else
      tests_failed = tests_failed + 1
      print(string.format("FAIL: Function '%s' is missing or not a function", func_name))
    end
  end

  print(string.format("\nResults: %d passed, %d failed", tests_passed, tests_failed))
  return tests_failed == 0
end

-- Run all tests
print("=== Testing CargDev-Cyberpunk Colorscheme ===\n")

print("--- Testing Colors Module ---")
local colors_ok = test_colors()

print("\n--- Testing Config Module ---")
local config_ok = test_config()

print("\n--- Testing Highlights Module ---")
local highlights_ok = test_highlights()

print("\n--- Testing Main Module ---")
local init_ok = test_init()

print("\n=== Test Summary ===")
if colors_ok and config_ok and highlights_ok and init_ok then
  print("All tests passed!")
  vim.cmd("qa!")
else
  print("Some tests failed!")
  vim.cmd("cq!")
end
