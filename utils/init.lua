local executors = dofile(vim.fn.stdpath("config") ..  "/utils/executors.lua")
local addpackage = dofile(vim.fn.stdpath("config") .. "/utils/package.lua")
local treesitter = dofile(vim.fn.stdpath("config") .. "/utils/treesitter.lua")
local highlights = dofile(vim.fn.stdpath("config") .. "/utils/highlights.lua")
local on_attach = dofile(vim.fn.stdpath("config") .. "/utils/on_attach.lua")

return vim.tbl_extend("error", executors, addpackage, treesitter, highlights, on_attach)
