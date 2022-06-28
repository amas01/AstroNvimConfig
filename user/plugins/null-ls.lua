return function(config)
  -- Formatting and linting
  -- https://github.com/jose-elias-alvarez/null-ls.nvim
  local null_ls = require "null-ls"
  -- Check supported formatters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
  local formatting = null_ls.builtins.formatting
  -- Check supported linters
  -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions
  local hover = null_ls.builtins.hover
  config.sources = {
    -- Set a formatter
    formatting.stylua,
    formatting.black.with { extra_args = { "--fast" } },
    -- formatting.isort,
    formatting.prettierd,
    formatting.fixjson,
    -- Set a linter
    diagnostics.write_good,
    diagnostics.flake8,
    -- Set code actions
    code_actions.gitsigns,
    -- dictionary
    hover.dictionary,
  }
  -- NOTE: You can remove this on attach function to disable format on save
  config.on_attach = function(client)
    -- NOTE: You can remove this on attach function to disable format on save
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        desc = "Auto format before save",
        pattern = "<buffer>",
        callback = function()
          vim.lsp.buf.formatting_sync(nil, 2000)
        end,
      })
    end
  end
  return config
end
