-- strap utils to global table
package.path = vim.fn.stdpath("config") .. "/utils/init.lua;" .. package.path
 _G.utils = require("utils")


require("vim-options")
require("autocmds")


require("core")
utils.run_all_with_start("remaps", "general")


-- in_zellij = not (vim.fn.getenv("ZELLIJ") == vim.NIL)
-- in_zellij = false

-- if in_zellij then
--    vim_do("zellij")
-- end
