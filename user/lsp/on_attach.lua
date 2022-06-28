return function(client)
  if client.name == "jsonls" or client.name == "html" or client.name == "sumneko_lua" or client.name == "pyright" then
    client.server_capabilities.documentFormattingProvider = false
  end
end
