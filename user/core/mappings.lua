local is_available = astronvim.is_available
local map = vim.keymap.set
local unmap = vim.keymap.del

if is_available "bufferline.nvim" then
  -- Remap next buffer
  unmap("n", "<S-l>")
  map("n", "<TAB>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer tab" })
  -- Remap previous buffer
  unmap("n", "<S-h>")
  map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer tab" })
end

-- Remap toggle NeoTree
if is_available "neo-tree.nvim" then
  unmap("n", "<leader>e")
  map("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle NeoTree" })
end

-- Paste over currently selected text without yanking it
map("v", "p", '"_dP', { desc = "Paste without yank"})

-- Cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", { desc = "Remove search highlighting"})

-- Insert blank line
map("n", "<Enter>", "o<Esc>", { desc = "Insert new line"})

-- dap mappings
map("n", "<leader>xb", function()
  require("dap").toggle_breakpoint()
end, { desc = "Toggle Breakpoint"})


map("n", "<leader>xB", function()
  require("dap").clear_breakpoints()
end, { desc = "Clear Breakpoints"})

map("n", "<leader>xc", function()
  require("dap").continue()
end, { desc = "Continue"})

map("n", "<leader>xi", function()
  require("dap").step_into()
end, { desc = "Step Into"})

map("n", "<leader>xo", function()
  require("dap").step_over()
end, { desc = "Step Over"})

map("n", "<leader>xq", function()
  require("dap").close()
end, { desc = "Close"})

map("n", "<leader>xQ", function()
  require("dap").terminate()
end, { desc = "Terminate"})

map("n", "<leader>xr", function()
  require("dap").repl.toggle()
end, { desc = "REPL"})

map("n", "<leader>xs", function()
  require("dap").float_element "scopes"
end, { desc = "Scopes"})

map("n", "<leader>xt", function()
  require("dap").float_element "stacks"
end, { desc = "Threads"})

map("n", "<leader>xu", function()
  require("dap").toggle()
end, { desc = "Toggle Debugger UI"})

map("n", "<leader>xw", function()
  require("dap").float_element "watches"
end, { desc = "Watches"})

map("n", "<leader>xx", function()
  require("dap.ui.widgets").hover()
end, { desc = "Inspect"})

map("n", "<leader>xv", ":DapVirtualTextToggle<cr>", { desc = "Virtual Text"})
