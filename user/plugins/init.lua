return function(plugins)
  local my_plugins = {
    {
      "geg2102/nvim-python-repl",
      event = "BufRead",
      config = function()
        require("nvim-python-repl").setup()
      end,
    },
    {
      "mfussenegger/nvim-dap",
      module = "dap",
      config = require "user.plugins.nvim-dap",
    },
    {
      "rcarriga/nvim-dap-ui",
      after = "nvim-dap",
      config = require "user.plugins.nvim-dapui",
    },
    {
      "nvim-telescope/telescope-dap.nvim",
      module = "telescope._extensions.dap",
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      after = "nvim-dap",
      config = function()
        require("nvim-dap-virtual-text").setup()
      end,
    },
    {
      "mfussenegger/nvim-dap-python",
      after = "nvim-dap",
      config = function()
        require("nvim-dap-python").setup('~/.pyenv/versions/neovim/bin/python')
      end,
    },
  }
  return vim.tbl_deep_extend("force", plugins, my_plugins)
end
