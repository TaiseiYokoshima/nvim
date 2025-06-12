local function add_package(str)
  local subdir_path = vim.fn.stdpath("config") .. "/lua/" .. str
  package.path = package.path .. ";" .. subdir_path
end

return {
  add_package = add_package
}
