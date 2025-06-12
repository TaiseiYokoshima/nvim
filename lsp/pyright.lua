local on_attach = utils.on_attach;
local settings = {
  python = {
    autoSearchPaths = true,
    diagnosticMode = "workspace",
    useLibraryCodeForTypes = true

  }
}

return {
    on_attach = on_attach,
    settings = settings
}

