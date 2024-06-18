vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.o.smartindent = true
vim.o.autoindent = true








vim.cmd("set runtimepath+=~/.config/nvim")


vim.keymap.set("n",  "Y", ":noh<CR>", {noremap=true, silent = true})

-- resets up motion
vim.keymap.set("n", "j", "k", {noremap = true, silent = true})
-- resets down motion
vim.keymap.set("n", ";", "j", {noremap = true, silent = true})
-- resets left motion
vim.keymap.set("n", "k", "h", {noremap = true, silent = true})


-- resets up motion
vim.keymap.set("v", "j", "k", {noremap = true, silent = true})


-- resets down motion
vim.keymap.set("v", ";", "j", {noremap = true, silent = true})
-- resets left motion
vim.keymap.set("v", "k", "h", {noremap = true, silent = true})

-- resets up motion
vim.keymap.set("x", "j", "k", {noremap = true, silent = true})
-- resets down motion
vim.keymap.set("x", ";", "j", {noremap = true, silent = true})
-- resets left motion
vim.keymap.set("x", "k", "h", {noremap = true, silent = true})


vim.keymap.set("o", "j", "k", {noremap = true, silent = true})
-- resets down motion
vim.keymap.set("o", ";", "j", {noremap = true, silent = true})
-- resets left motion
vim.keymap.set("o", "k", "h", {noremap = true, silent = true})

vim.keymap.set("s", "j", "k", {noremap = true, silent = true})
-- resets down motion
vim.keymap.set("s", ";", "j", {noremap = true, silent = true})
-- resets left motion
vim.keymap.set("s", "k", "h", {noremap = true, silent = true})









function _G.swap_default_and_clipboard()
  print("swapped")
  local default = vim.fn.getreg('"')
  local default_t = vim.fn.getregtype('"')

  local clipboard = vim.fn.getreg("+")
  local clipboard_t = vim.fn.getregtype("+")

  vim.fn.setreg('"', clipboard, default_t)
  vim.fn.setreg('+', default, clipboard_t)

end

function _G.show_registers()
  local default = vim.fn.getreg('"')
  local clipboard = vim.fn.getreg('+')

  local default_str = "default: " .. default
  local clipboard_str = "clipboard: " .. clipboard

  print(default_str)
  print(clipboard_str)
end


vim.keymap.set("n", "<C-q>", ":lua _G.swap_default_and_clipboard()<CR>")
vim.keymap.set("n", "<C-h>", ":lua _G.show_registers()<CR>")



vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true

-- to go up and down half page but keeps the cursor in the middle of the page
vim.api.nvim_set_keymap("n", "<", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", ">", "<C-u>zz", { noremap = true, silent = true })


local yank_clipboard_only = function (cmd)
  local saved_register = vim.fn.getreg('"')
  local saved_register_type = vim.fn.getregtype('"')
  vim.api.nvim_command(cmd)
  vim.fn.setreg('"', saved_register, saved_register_type)
end























-- system clipboard 
-- pastes without changing what's in the yanked buffer
vim.keymap.set("n", "<leader>v", '"+p', { noremap = true, silent = true })
vim.keymap.set("x", "<leader>v", '"_d"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>v", '"_d"+p', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>V", '"+P', { noremap = true, silent = true })

vim.keymap.set("x", "<leader>V", '"_d"+P', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>V", '"_d"+P', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>cc', function() yank_clipboard_only('normal! "+yy') end, {noremap = true, silent = true})
vim.keymap.set('v', '<leader>c', function() yank_clipboard_only('normal! "+y') end, {noremap = true, silent = true})
vim.keymap.set('x', '<leader>c', function() yank_clipboard_only('normal! "+y') end, {noremap = true, silent = true})

vim.keymap.set("n", "<C-x><C-x>", '"+yy"_dd', { noremap = true, silent = true })
vim.keymap.set("x", "<C-x>", '"+y"_dd', { noremap = true, silent = true })
vim.keymap.set("v", "<C-x>", '"+y"_dd', { noremap = true, silent = true })



-- remaps so that deleting will not change yank register
vim.keymap.set("n", "x", '"_x', { noremap = true, silent = true})          -- replacing one char

vim.keymap.set("n", "d", '"_d', { noremap = true, silent = true})          -- deleting
vim.keymap.set("v", "d", '"_d', { noremap = true, silent = true})          --    |
vim.keymap.set("x", "d", '"_d', { noremap = true, silent = true})          --    |

vim.keymap.set("n", "D", '"_D', { noremap = true, silent = true})          -- delete entire line


vim.keymap.set("v", "p", '"_dp', { noremap = true, silent = true})         -- pasting in v or x
vim.keymap.set("x", "p", '"_dp', { noremap = true, silent = true})         --     | 

vim.keymap.set("v", "P", '"_dP', { noremap = true, silent = true})         -- pasting before in v or x
vim.keymap.set("x", "P", '"_dP', { noremap = true, silent = true})         --     |


vim.keymap.set("n", "<leader>x", 'x', { noremap = true, silent = true })   -- the normals is set to use with leader
                                                                           --       |
vim.keymap.set("n", "<leader>d", 'd', { noremap = true, silent = true })   --       |
vim.keymap.set("v", "<leader>d", 'd', { noremap = true, silent = true })   --       |
vim.keymap.set("x", "<leader>d", 'd', { noremap = true, silent = true })   --       |
                                                                           --       |
vim.keymap.set("n", "<leader>D", 'D', { noremap = true, silent = true })   --       |
                                                                           --       |
vim.keymap.set("v", "<leader>p", 'p', { noremap = true, silent = true })   --       |
vim.keymap.set("x", "<leader>p", 'p', { noremap = true, silent = true })   --       |
                                                                           --       |
vim.keymap.set("v", "<leader>P", 'P', { noremap = true, silent = true })   --       |
vim.keymap.set("x", "<leader>P", 'P', { noremap = true, silent = true })   --       |





-- stting grep the project
vim.keymap.set("n", "<leader>ps", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end)



-- moves the selected text up and down
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")

-- moves to next and previous search hit but keeps the cursor in the middle of the page 
vim.keymap.set("n", "n" , "nzzzv")
vim.keymap.set("n", "N" , "Nzzzv")

vim.keymap.set("n","<CR>" , "o<Esc>", {noremap = true, silent = true})



-- auto indents when going into insert mode if line is empty
vim.keymap.set("n", "i", function()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil and 'cc' or 'i'
end, { expr = true, noremap = true })

vim.keymap.set("n", "<C-i>", "i", {noremap = true, silent = true})



-- this maps tab in insert mode so that if it indents automatically to the correct level only 
-- if the line is empty
vim.keymap.set("i", "<Tab>", function()
  return string.match(vim.api.nvim_get_current_line(), '%g') == nil and '<Esc>cc' or '<Tab>'
end, { expr = true, noremap = true })






-- neotree keymap
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})

-- jumping places back and forth
vim.keymap.set("n", "<leader>o", "<C-o>", { noremap = true, silent = true})
vim.keymap.set("n",  "<leader>i", "<C-i>", { noremap = true, silent = true})

-- since ; is used for arrows
vim.keymap.set("n", ".", ";", { noremap = true, silent = true})







