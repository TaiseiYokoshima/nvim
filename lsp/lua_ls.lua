local on_attach = utils.on_attach;
local settings = {
   Lua = {
      runtime = {
         version = "LuaJIT",
      },


      diagnostics = {
         globals = { "vim" },
      },

      telemetry = {
         enable = true,
      }
   },
}


return {
   on_attach = on_attach,
   settings = settings
}



