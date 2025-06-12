local function run(str)
   dofile(vim.fn.stdpath("config") .. "/lua/" .. str .. ".lua")
end

local function load_module(str)
  run(str .. "/init.lua")
end


local function remove_value(tbl, value)
  for i, v in ipairs(tbl) do
    if v == value then
      table.remove(tbl, i)
      break
    end
  end
end


local function run_all(str)
  local remap_path = vim.fn.stdpath("config") .. "/lua/" .. str
  local files = vim.fn.glob(remap_path .. "/*.lua", true, true)
  for _, file in ipairs(files) do
    dofile(file)
  end
end

local function run_all_with_start(str, start)
  local remap_path = vim.fn.stdpath("config") .. "/lua/" .. str
  local files = vim.fn.glob(remap_path .. "/*.lua", true, true)
  local start_path = remap_path .. "/" .. start .. ".lua"

  remove_value(files, start_path)

  dofile(start_path)

  for _, file in ipairs(files) do
    dofile(file)
  end
end


local function run_all_except(str, start)
  local remap_path = vim.fn.stdpath("config") .. "/lua/" .. str
  local files = vim.fn.glob(remap_path .. "/*.lua", true, true)
  local start_path = remap_path .. "/" .. start .. ".lua"

  remove_value(files, start_path)

  for _, file in ipairs(files) do
    dofile(file)
  end
end


return {
  run = run,
  load_module = load_module,
  run_all = run_all,
  run_all_except = run_all_except,
  run_all_with_start = run_all_with_start,
}
