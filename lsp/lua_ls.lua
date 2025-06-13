local on_attach = utils.on_attach

return {
   on_attach = on_attach,
   cmd = { "lua-language-server" },
   filetypes = { "lua" },
   root_markers = {
     ".git",
     ".luacheckrc",
   },
   single_file_support = true,

}



